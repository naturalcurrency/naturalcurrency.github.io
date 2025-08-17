-- Align schema to target model
-- 1) Ensure timestamp trigger function exists
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2) Categories table
CREATE TABLE IF NOT EXISTS public.categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL,
  description text,
  color text DEFAULT 'primary',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS categories_slug_key ON public.categories (slug);
CREATE UNIQUE INDEX IF NOT EXISTS categories_name_key ON public.categories (name);

ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='categories' AND policyname='Admins can manage categories'
  ) THEN
    CREATE POLICY "Admins can manage categories" ON public.categories
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='categories' AND policyname='Authenticated users can view categories'
  ) THEN
    CREATE POLICY "Authenticated users can view categories" ON public.categories
    FOR SELECT USING (true);
  END IF;
END $$;

DROP TRIGGER IF EXISTS update_categories_updated_at ON public.categories;
-- categories has no updated_at column, so no trigger needed

-- 3) Articles table alignment
ALTER TABLE public.articles
  ADD COLUMN IF NOT EXISTS subtitle text,
  ADD COLUMN IF NOT EXISTS category text,
  ADD COLUMN IF NOT EXISTS image_url text,
  ADD COLUMN IF NOT EXISTS read_time integer,
  ADD COLUMN IF NOT EXISTS metric_value text,
  ADD COLUMN IF NOT EXISTS slug text,
  ADD COLUMN IF NOT EXISTS author_id uuid,
  ADD COLUMN IF NOT EXISTS published boolean DEFAULT false,
  ADD COLUMN IF NOT EXISTS featured boolean DEFAULT false,
  ADD COLUMN IF NOT EXISTS featured_order integer,
  ADD COLUMN IF NOT EXISTS excerpt text,
  ADD COLUMN IF NOT EXISTS author_name text,
  ADD COLUMN IF NOT EXISTS view_count integer DEFAULT 0,
  ADD COLUMN IF NOT EXISTS published_date date;

-- Backfill and enforce NOT NULL on category safely
UPDATE public.articles SET category = COALESCE(category, 'general');
ALTER TABLE public.articles ALTER COLUMN category SET NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS articles_slug_key ON public.articles (slug);

-- Ensure updated_at trigger exists for articles
DROP TRIGGER IF EXISTS update_articles_updated_at ON public.articles;
CREATE TRIGGER update_articles_updated_at
BEFORE UPDATE ON public.articles
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 4) Events table alignment
DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_schema='public' AND table_name='events' AND column_name='event_date'
  ) AND NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_schema='public' AND table_name='events' AND column_name='start_date'
  ) THEN
    ALTER TABLE public.events RENAME COLUMN event_date TO start_date;
  END IF;
END $$;

ALTER TABLE public.events
  ADD COLUMN IF NOT EXISTS event_type text,
  ADD COLUMN IF NOT EXISTS end_date timestamptz,
  ADD COLUMN IF NOT EXISTS venue text,
  ADD COLUMN IF NOT EXISTS image_url text,
  ADD COLUMN IF NOT EXISTS registration_url text,
  ADD COLUMN IF NOT EXISTS price numeric,
  ADD COLUMN IF NOT EXISTS capacity integer,
  ADD COLUMN IF NOT EXISTS organizer text,
  ADD COLUMN IF NOT EXISTS featured boolean DEFAULT false,
  ADD COLUMN IF NOT EXISTS published boolean DEFAULT true;

DROP TRIGGER IF EXISTS update_events_updated_at ON public.events;
CREATE TRIGGER update_events_updated_at
BEFORE UPDATE ON public.events
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 5) Rename key_deals to deals if needed
DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables WHERE table_schema='public' AND table_name='key_deals'
  ) AND NOT EXISTS (
    SELECT 1 FROM information_schema.tables WHERE table_schema='public' AND table_name='deals'
  ) THEN
    ALTER TABLE public.key_deals RENAME TO deals;
  END IF;
END $$;

-- 6) Deals table alignment (after rename or if already exists)
ALTER TABLE public.deals
  ADD COLUMN IF NOT EXISTS deal_id text,
  ADD COLUMN IF NOT EXISTS deal_name text,
  ADD COLUMN IF NOT EXISTS deal_status text DEFAULT 'Draft',
  ADD COLUMN IF NOT EXISTS transaction_type text,
  ADD COLUMN IF NOT EXISTS announcement_date date,
  ADD COLUMN IF NOT EXISTS closing_date date,
  ADD COLUMN IF NOT EXISTS deal_value_formatted text,
  ADD COLUMN IF NOT EXISTS deal_size_category text,
  ADD COLUMN IF NOT EXISTS price_per_sf numeric,
  ADD COLUMN IF NOT EXISTS cap_rate numeric,
  ADD COLUMN IF NOT EXISTS investment_strategy text,
  ADD COLUMN IF NOT EXISTS property_name text,
  ADD COLUMN IF NOT EXISTS property_type text,
  ADD COLUMN IF NOT EXISTS property_subtype text,
  ADD COLUMN IF NOT EXISTS square_footage integer,
  ADD COLUMN IF NOT EXISTS year_built integer,
  ADD COLUMN IF NOT EXISTS occupancy_rate numeric,
  ADD COLUMN IF NOT EXISTS image_url text,
  ADD COLUMN IF NOT EXISTS full_address text,
  ADD COLUMN IF NOT EXISTS street_address text,
  ADD COLUMN IF NOT EXISTS city text,
  ADD COLUMN IF NOT EXISTS state_province text,
  ADD COLUMN IF NOT EXISTS country text,
  ADD COLUMN IF NOT EXISTS region text,
  ADD COLUMN IF NOT EXISTS postal_code text,
  ADD COLUMN IF NOT EXISTS latitude numeric,
  ADD COLUMN IF NOT EXISTS longitude numeric,
  ADD COLUMN IF NOT EXISTS buyer text,
  ADD COLUMN IF NOT EXISTS buyer_type text,
  ADD COLUMN IF NOT EXISTS seller text,
  ADD COLUMN IF NOT EXISTS seller_type text,
  ADD COLUMN IF NOT EXISTS broker text,
  ADD COLUMN IF NOT EXISTS lender text,
  ADD COLUMN IF NOT EXISTS deal_highlights jsonb DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS market_intelligence text,
  ADD COLUMN IF NOT EXISTS strategic_significance text,
  ADD COLUMN IF NOT EXISTS competitive_dynamics text,
  ADD COLUMN IF NOT EXISTS source text,
  ADD COLUMN IF NOT EXISTS confidence_score numeric,
  ADD COLUMN IF NOT EXISTS data_quality_score numeric,
  ADD COLUMN IF NOT EXISTS featured_deal boolean DEFAULT false,
  ADD COLUMN IF NOT EXISTS recent_deal boolean DEFAULT false,
  ADD COLUMN IF NOT EXISTS pipeline_deal boolean DEFAULT false,
  ADD COLUMN IF NOT EXISTS trending_deal boolean DEFAULT false,
  ADD COLUMN IF NOT EXISTS published boolean DEFAULT true,
  ADD COLUMN IF NOT EXISTS last_updated timestamptz DEFAULT now();

-- Convert deal_value to bigint if not already
DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_schema='public' AND table_name='deals' AND column_name='deal_value' AND data_type <> 'bigint'
  ) THEN
    ALTER TABLE public.deals ALTER COLUMN deal_value TYPE bigint USING (round(COALESCE(deal_value,0))::bigint);
  END IF;
END $$;

DROP TRIGGER IF EXISTS update_deals_updated_at ON public.deals;
CREATE TRIGGER update_deals_updated_at
BEFORE UPDATE ON public.deals
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 7) Snapshot dimension tables
CREATE TABLE IF NOT EXISTS public.snapshot_geographic_regions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX IF NOT EXISTS snapshot_geographic_regions_slug_key ON public.snapshot_geographic_regions (slug);
ALTER TABLE public.snapshot_geographic_regions ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_geographic_regions' AND policyname='Admins can manage snapshot_geographic_regions') THEN
    CREATE POLICY "Admins can manage snapshot_geographic_regions" ON public.snapshot_geographic_regions
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_geographic_regions' AND policyname='Authenticated users can view snapshot_geographic_regions') THEN
    CREATE POLICY "Authenticated users can view snapshot_geographic_regions" ON public.snapshot_geographic_regions
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_geographic_regions_updated_at ON public.snapshot_geographic_regions;
CREATE TRIGGER update_snapshot_geographic_regions_updated_at
BEFORE UPDATE ON public.snapshot_geographic_regions
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE IF NOT EXISTS public.snapshot_countries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL,
  region_id uuid NOT NULL REFERENCES public.snapshot_geographic_regions(id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX IF NOT EXISTS snapshot_countries_slug_key ON public.snapshot_countries (slug);
ALTER TABLE public.snapshot_countries ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_countries' AND policyname='Admins can manage snapshot_countries') THEN
    CREATE POLICY "Admins can manage snapshot_countries" ON public.snapshot_countries
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_countries' AND policyname='Authenticated users can view snapshot_countries') THEN
    CREATE POLICY "Authenticated users can view snapshot_countries" ON public.snapshot_countries
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_countries_updated_at ON public.snapshot_countries;
CREATE TRIGGER update_snapshot_countries_updated_at
BEFORE UPDATE ON public.snapshot_countries
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE IF NOT EXISTS public.snapshot_cities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL,
  country_id uuid NOT NULL REFERENCES public.snapshot_countries(id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX IF NOT EXISTS snapshot_cities_slug_key ON public.snapshot_cities (slug);
ALTER TABLE public.snapshot_cities ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_cities' AND policyname='Admins can manage snapshot_cities') THEN
    CREATE POLICY "Admins can manage snapshot_cities" ON public.snapshot_cities
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_cities' AND policyname='Authenticated users can view snapshot_cities') THEN
    CREATE POLICY "Authenticated users can view snapshot_cities" ON public.snapshot_cities
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_cities_updated_at ON public.snapshot_cities;
CREATE TRIGGER update_snapshot_cities_updated_at
BEFORE UPDATE ON public.snapshot_cities
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE IF NOT EXISTS public.snapshot_sectors (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX IF NOT EXISTS snapshot_sectors_slug_key ON public.snapshot_sectors (slug);
ALTER TABLE public.snapshot_sectors ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_sectors' AND policyname='Admins can manage snapshot_sectors') THEN
    CREATE POLICY "Admins can manage snapshot_sectors" ON public.snapshot_sectors
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_sectors' AND policyname='Authenticated users can view snapshot_sectors') THEN
    CREATE POLICY "Authenticated users can view snapshot_sectors" ON public.snapshot_sectors
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_sectors_updated_at ON public.snapshot_sectors;
CREATE TRIGGER update_snapshot_sectors_updated_at
BEFORE UPDATE ON public.snapshot_sectors
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE IF NOT EXISTS public.snapshot_sub_sectors (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL,
  sector_id uuid NOT NULL REFERENCES public.snapshot_sectors(id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE UNIQUE INDEX IF NOT EXISTS snapshot_sub_sectors_slug_key ON public.snapshot_sub_sectors (slug);
ALTER TABLE public.snapshot_sub_sectors ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_sub_sectors' AND policyname='Admins can manage snapshot_sub_sectors') THEN
    CREATE POLICY "Admins can manage snapshot_sub_sectors" ON public.snapshot_sub_sectors
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_sub_sectors' AND policyname='Authenticated users can view snapshot_sub_sectors') THEN
    CREATE POLICY "Authenticated users can view snapshot_sub_sectors" ON public.snapshot_sub_sectors
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_sub_sectors_updated_at ON public.snapshot_sub_sectors;
CREATE TRIGGER update_snapshot_sub_sectors_updated_at
BEFORE UPDATE ON public.snapshot_sub_sectors
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 8) Snapshot content tables
CREATE TABLE IF NOT EXISTS public.snapshot_market_metrics (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  metric_name text NOT NULL,
  metric_category text NOT NULL,
  metric_family text NOT NULL,
  current_value text NOT NULL,
  change_percentage numeric,
  change_direction text,
  sparkline_data jsonb,
  region_id uuid REFERENCES public.snapshot_geographic_regions(id) ON DELETE SET NULL,
  country_id uuid REFERENCES public.snapshot_countries(id) ON DELETE SET NULL,
  city_id uuid REFERENCES public.snapshot_cities(id) ON DELETE SET NULL,
  sector_id uuid REFERENCES public.snapshot_sectors(id) ON DELETE SET NULL,
  sub_sector_id uuid REFERENCES public.snapshot_sub_sectors(id) ON DELETE SET NULL,
  data_date date NOT NULL DEFAULT CURRENT_DATE,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
ALTER TABLE public.snapshot_market_metrics ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_market_metrics' AND policyname='Admins can manage snapshot_market_metrics') THEN
    CREATE POLICY "Admins can manage snapshot_market_metrics" ON public.snapshot_market_metrics
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_market_metrics' AND policyname='Authenticated users can view snapshot_market_metrics') THEN
    CREATE POLICY "Authenticated users can view snapshot_market_metrics" ON public.snapshot_market_metrics
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_market_metrics_updated_at ON public.snapshot_market_metrics;
CREATE TRIGGER update_snapshot_market_metrics_updated_at
BEFORE UPDATE ON public.snapshot_market_metrics
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE IF NOT EXISTS public.snapshot_market_comparisons (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  comparison_type text NOT NULL,
  title text NOT NULL,
  description text,
  comparison_data jsonb NOT NULL,
  region_id uuid REFERENCES public.snapshot_geographic_regions(id) ON DELETE SET NULL,
  country_id uuid REFERENCES public.snapshot_countries(id) ON DELETE SET NULL,
  sector_id uuid REFERENCES public.snapshot_sectors(id) ON DELETE SET NULL,
  published boolean DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
ALTER TABLE public.snapshot_market_comparisons ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_market_comparisons' AND policyname='Admins can manage snapshot_market_comparisons') THEN
    CREATE POLICY "Admins can manage snapshot_market_comparisons" ON public.snapshot_market_comparisons
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_market_comparisons' AND policyname='Authenticated users can view snapshot_market_comparisons') THEN
    CREATE POLICY "Authenticated users can view snapshot_market_comparisons" ON public.snapshot_market_comparisons
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_market_comparisons_updated_at ON public.snapshot_market_comparisons;
CREATE TRIGGER update_snapshot_market_comparisons_updated_at
BEFORE UPDATE ON public.snapshot_market_comparisons
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE IF NOT EXISTS public.snapshot_sector_intelligence (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  content text NOT NULL,
  metrics jsonb,
  sector_id uuid NOT NULL REFERENCES public.snapshot_sectors(id) ON DELETE SET NULL,
  sub_sector_id uuid REFERENCES public.snapshot_sub_sectors(id) ON DELETE SET NULL,
  region_id uuid REFERENCES public.snapshot_geographic_regions(id) ON DELETE SET NULL,
  country_id uuid REFERENCES public.snapshot_countries(id) ON DELETE SET NULL,
  published boolean DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
ALTER TABLE public.snapshot_sector_intelligence ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_sector_intelligence' AND policyname='Admins can manage snapshot_sector_intelligence') THEN
    CREATE POLICY "Admins can manage snapshot_sector_intelligence" ON public.snapshot_sector_intelligence
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_sector_intelligence' AND policyname='Authenticated users can view snapshot_sector_intelligence') THEN
    CREATE POLICY "Authenticated users can view snapshot_sector_intelligence" ON public.snapshot_sector_intelligence
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_sector_intelligence_updated_at ON public.snapshot_sector_intelligence;
CREATE TRIGGER update_snapshot_sector_intelligence_updated_at
BEFORE UPDATE ON public.snapshot_sector_intelligence
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE IF NOT EXISTS public.snapshot_trending_people (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  company text NOT NULL,
  position text NOT NULL,
  image_url text,
  change_percentage numeric,
  description text,
  sector_id uuid REFERENCES public.snapshot_sectors(id) ON DELETE SET NULL,
  region_id uuid REFERENCES public.snapshot_geographic_regions(id) ON DELETE SET NULL,
  country_id uuid REFERENCES public.snapshot_countries(id) ON DELETE SET NULL,
  published boolean DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
ALTER TABLE public.snapshot_trending_people ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_trending_people' AND policyname='Admins can manage snapshot_trending_people') THEN
    CREATE POLICY "Admins can manage snapshot_trending_people" ON public.snapshot_trending_people
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_trending_people' AND policyname='Authenticated users can view snapshot_trending_people') THEN
    CREATE POLICY "Authenticated users can view snapshot_trending_people" ON public.snapshot_trending_people
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_trending_people_updated_at ON public.snapshot_trending_people;
CREATE TRIGGER update_snapshot_trending_people_updated_at
BEFORE UPDATE ON public.snapshot_trending_people
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE IF NOT EXISTS public.snapshot_trending_projects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  location text NOT NULL,
  project_value text NOT NULL,
  project_status text NOT NULL,
  image_url text,
  change_percentage numeric,
  description text,
  sector_id uuid REFERENCES public.snapshot_sectors(id) ON DELETE SET NULL,
  sub_sector_id uuid REFERENCES public.snapshot_sub_sectors(id) ON DELETE SET NULL,
  region_id uuid REFERENCES public.snapshot_geographic_regions(id) ON DELETE SET NULL,
  country_id uuid REFERENCES public.snapshot_countries(id) ON DELETE SET NULL,
  city_id uuid REFERENCES public.snapshot_cities(id) ON DELETE SET NULL,
  published boolean DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
ALTER TABLE public.snapshot_trending_projects ENABLE ROW LEVEL SECURITY;
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_trending_projects' AND policyname='Admins can manage snapshot_trending_projects') THEN
    CREATE POLICY "Admins can manage snapshot_trending_projects" ON public.snapshot_trending_projects
    FOR ALL USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='snapshot_trending_projects' AND policyname='Authenticated users can view snapshot_trending_projects') THEN
    CREATE POLICY "Authenticated users can view snapshot_trending_projects" ON public.snapshot_trending_projects
    FOR SELECT USING (true);
  END IF;
END $$;
DROP TRIGGER IF EXISTS update_snapshot_trending_projects_updated_at ON public.snapshot_trending_projects;
CREATE TRIGGER update_snapshot_trending_projects_updated_at
BEFORE UPDATE ON public.snapshot_trending_projects
FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

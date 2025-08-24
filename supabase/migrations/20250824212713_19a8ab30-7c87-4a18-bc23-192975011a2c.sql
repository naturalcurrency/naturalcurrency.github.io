-- Fix constraint issue and add remaining key administrative divisions
-- Drop ALL old unique constraints that might be interfering
DO $$ 
DECLARE
    constraint_name TEXT;
BEGIN
    -- Drop all existing unique constraints on the table
    FOR constraint_name IN 
        SELECT conname FROM pg_constraint 
        WHERE conrelid = 'snapshot_administrative_divisions'::regclass 
        AND contype = 'u'
    LOOP
        EXECUTE 'ALTER TABLE snapshot_administrative_divisions DROP CONSTRAINT IF EXISTS ' || constraint_name;
    END LOOP;
END $$;

-- Recreate the proper unique constraint
CREATE UNIQUE INDEX IF NOT EXISTS uq_admin_division_country_slug 
ON public.snapshot_administrative_divisions(country_id, slug);

-- Add key missing administrative divisions for major countries
-- Focus on the most important ones that users will likely filter by

-- Philippines - Add key provinces including Metro Manila
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Philippines' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'ñ','n')), c.id
FROM c, UNNEST(ARRAY['Metro Manila','Cebu','Davao del Sur','Laguna','Cavite','Bulacan','Rizal','Batangas','Pampanga','Quezon','Iloilo','Negros Occidental','Pangasinan','Bohol','Leyte']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Indonesia - Add key provinces
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Indonesia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Jakarta','West Java','East Java','Central Java','North Sumatra','South Sulawesi','Bali','West Sumatra','Yogyakarta','Riau','South Sumatra']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Vietnam - Add key provinces/cities
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Vietnam' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'ă','a'),'ê','e')), c.id
FROM c, UNNEST(ARRAY['Hà Nội','Hồ Chí Minh','Đà Nẵng','Hải Phòng','Cần Thơ','An Giang','Bà Rịa-Vũng Tàu','Bình Dương','Đồng Nai','Long An']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Bangladesh - Add all divisions
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Bangladesh' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Dhaka','Chittagong','Rajshahi','Khulna','Barisal','Sylhet','Rangpur','Mymensingh']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Pakistan - Add key provinces
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Pakistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'&','and')), c.id
FROM c, UNNEST(ARRAY['Punjab','Sindh','Khyber Pakhtunkhwa','Balochistan','Islamabad Capital Territory']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Colombia - Add key departments
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Colombia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'í','i')), c.id
FROM c, UNNEST(ARRAY['Bogotá','Antioquia','Valle del Cauca','Atlántico','Santander','Bolívar','Cundinamarca','Norte de Santander','Córdoba','Tolima']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Peru - Add key regions
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Peru' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'ú','u')), c.id
FROM c, UNNEST(ARRAY['Lima','Arequipa','La Libertad','Piura','Lambayeque','Junín','Cusco','Cajamarca','Loreto','Ancash']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Ecuador - Add key provinces  
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Ecuador' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'í','i')), c.id
FROM c, UNNEST(ARRAY['Pichincha','Guayas','Azuay','Manabí','El Oro','Los Ríos','Tungurahua','Imbabura','Cotopaxi','Loja']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- MIDDLE EAST & AFRICA

-- South Africa - Add all provinces  
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'South Africa' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Gauteng','Western Cape','KwaZulu-Natal','Eastern Cape','Limpopo','Mpumalanga','North West','Free State','Northern Cape']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Nigeria - Add all states
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Nigeria' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Lagos','Kano','Kaduna','Oyo','Rivers','Bayelsa','Delta','Anambra','Imo','Abia','Cross River','Akwa Ibom','Enugu','Edo','Ondo','Osun','Ogun','Kwara','Plateau','Borno','Adamawa','Taraba','Gombe','Bauchi','Yobe','Jigawa','Katsina','Zamfara','Sokoto','Kebbi','Niger','Kogi','Benue','Nasarawa','Abuja']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kenya - Add key counties
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Kenya' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Nairobi City','Kiambu','Nakuru','Machakos','Meru','Kisumu','Uasin Gishu','Kakamega','Mombasa','Kilifi']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Egypt - Add key governorates
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Egypt' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Cairo','Giza','Alexandria','Qalyubia','Sharqia','Dakahlia','Gharbia','Beheira','Minya','Asyut']) d
ON CONFLICT (country_id, slug) DO NOTHING;
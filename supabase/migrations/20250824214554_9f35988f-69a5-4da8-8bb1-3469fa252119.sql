-- Seed Ghana administrative divisions (16 regions)
WITH c AS (
  SELECT id FROM snapshot_countries WHERE name = 'Ghana' LIMIT 1
)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, v.slug, c.id
FROM c
JOIN (
  VALUES
    ('Ahafo','gh-ahafo'),
    ('Ashanti','gh-ashanti'),
    ('Bono','gh-bono'),
    ('Bono East','gh-bono-east'),
    ('Central','gh-central'),
    ('Eastern','gh-eastern'),
    ('Greater Accra','gh-greater-accra'),
    ('North East','gh-north-east'),
    ('Northern','gh-northern'),
    ('Oti','gh-oti'),
    ('Savannah','gh-savannah'),
    ('Upper East','gh-upper-east'),
    ('Upper West','gh-upper-west'),
    ('Volta','gh-volta'),
    ('Western','gh-western'),
    ('Western North','gh-western-north')
) AS v(name, slug) ON CONFLICT (country_id, slug) DO NOTHING;
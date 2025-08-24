-- Batch 1: Middle East & Africa administrative divisions (46 countries)
-- Remove placeholder entries and add real divisions

-- First, remove existing placeholder entries for MEA countries
DELETE FROM snapshot_administrative_divisions 
WHERE country_id IN (
  SELECT c.id FROM snapshot_countries c 
  JOIN snapshot_geographic_regions r ON r.id = c.region_id 
  WHERE r.name = 'Middle East & Africa'
) AND (name = 'National' OR slug LIKE '%-national');

-- Algeria (48 wilayas)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Adrar'), ('Ain Defla'), ('Ain Temouchent'), ('Algiers'), ('Annaba'), ('Batna'), ('Bechar'), ('Bejaia'),
  ('Biskra'), ('Blida'), ('Bordj Bou Arreridj'), ('Bouira'), ('Boumerdes'), ('Chlef'), ('Constantine'),
  ('Djelfa'), ('El Bayadh'), ('El Oued'), ('El Tarf'), ('Ghardaia'), ('Guelma'), ('Illizi'), ('Jijel'),
  ('Khenchela'), ('Laghouat'), ('M''Sila'), ('Mascara'), ('Medea'), ('Mila'), ('Mostaganem'), ('Naama'),
  ('Oran'), ('Ouargla'), ('Oum El Bouaghi'), ('Relizane'), ('Saida'), ('Setif'), ('Sidi Bel Abbes'),
  ('Skikda'), ('Souk Ahras'), ('Tamanrasset'), ('Tebessa'), ('Tiaret'), ('Tindouf'), ('Tipaza'),
  ('Tissemsilt'), ('Tizi Ouzou'), ('Tlemcen')
) AS divisions(division_name)
WHERE c.name = 'Algeria'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Angola (18 provinces)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Bengo'), ('Benguela'), ('Bie'), ('Cabinda'), ('Cuanza Norte'), ('Cuanza Sul'), ('Cunene'),
  ('Huambo'), ('Huila'), ('Luanda'), ('Lunda Norte'), ('Lunda Sul'), ('Malanje'), ('Moxico'),
  ('Namibe'), ('Uige'), ('Zaire'), ('Cuando Cubango')
) AS divisions(division_name)
WHERE c.name = 'Angola'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Bahrain (4 governorates)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Capital'), ('Muharraq'), ('Northern'), ('Southern')
) AS divisions(division_name)
WHERE c.name = 'Bahrain'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Benin (12 departments)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Alibori'), ('Atakora'), ('Atlantique'), ('Borgou'), ('Collines'), ('Couffo'),
  ('Donga'), ('Littoral'), ('Mono'), ('Oueme'), ('Plateau'), ('Zou')
) AS divisions(division_name)
WHERE c.name = 'Benin'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Botswana (10 districts)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Central'), ('Chobe'), ('Ghanzi'), ('Kgalagadi'), ('Kgatleng'), ('Kweneng'),
  ('North-East'), ('North-West'), ('South-East'), ('Southern')
) AS divisions(division_name)
WHERE c.name = 'Botswana'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Burkina Faso (13 regions)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Boucle du Mouhoun'), ('Cascades'), ('Centre'), ('Centre-Est'), ('Centre-Nord'),
  ('Centre-Ouest'), ('Centre-Sud'), ('Est'), ('Hauts-Bassins'), ('Nord'),
  ('Plateau-Central'), ('Sahel'), ('Sud-Ouest')
) AS divisions(division_name)
WHERE c.name = 'Burkina Faso'
ON CONFLICT (country_id, slug) DO NOTHING;
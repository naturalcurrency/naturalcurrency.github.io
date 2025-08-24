-- Finish Middle East & Africa countries with administrative divisions
-- Continue with remaining MEA countries

-- Iran (32 provinces) 
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Alborz'), ('Ardabil'), ('Bushehr'), ('Chaharmahal and Bakhtiari'), ('East Azerbaijan'), ('Fars'), ('Gilan'), ('Golestan'), ('Hamadan'), ('Hormozgan'),
 ('Ilam'), ('Isfahan'), ('Kerman'), ('Kermanshah'), ('Khorasan-e Razavi'), ('Khuzestan'), ('Kohgiluyeh and Boyer-Ahmad'), ('Kurdistan'), ('Lorestan'), ('Markazi'),
 ('Mazandaran'), ('North Khorasan'), ('Qazvin'), ('Qom'), ('Semnan'), ('Sistan and Baluchestan'), ('South Khorasan'), ('Tehran'), ('West Azerbaijan'), ('Yazd'), ('Zanjan'), ('Alborz')
) AS divisions(division_name)
WHERE c.name = 'Iran'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Iraq (19 provinces)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Al Anbar'), ('Al Muthanna'), ('Al Qadisiyah'), ('Babil'), ('Baghdad'), ('Basra'), ('Dhi Qar'), ('Diyala'), ('Dohuk'), ('Erbil'),
 ('Halabja'), ('Karbala'), ('Kirkuk'), ('Maysan'), ('Najaf'), ('Nineveh'), ('Saladin'), ('Sulaymaniyah'), ('Wasit')
) AS divisions(division_name)
WHERE c.name = 'Iraq'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Israel (7 districts)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Central'), ('Haifa'), ('Jerusalem'), ('Northern'), ('Southern'), ('Tel Aviv'), ('Judea and Samaria')) AS divisions(division_name)
WHERE c.name = 'Israel'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Jordan (12 governorates)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Ajloun'), ('Amman'), ('Aqaba'), ('Balqa'), ('Irbid'), ('Jerash'), ('Karak'), ('Ma''an'), ('Madaba'), ('Mafraq'), ('Tafilah'), ('Zarqa')) AS divisions(division_name)
WHERE c.name = 'Jordan'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kenya (47 counties)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Baringo'), ('Bomet'), ('Bungoma'), ('Busia'), ('Elgeyo-Marakwet'), ('Embu'), ('Garissa'), ('Homa Bay'), ('Isiolo'), ('Kajiado'), ('Kakamega'), ('Kericho'),
 ('Kiambu'), ('Kilifi'), ('Kirinyaga'), ('Kisii'), ('Kisumu'), ('Kitui'), ('Kwale'), ('Laikipia'), ('Lamu'), ('Machakos'), ('Makueni'), ('Mandera'),
 ('Marsabit'), ('Meru'), ('Migori'), ('Mombasa'), ('Murang''a'), ('Nairobi City'), ('Nakuru'), ('Nandi'), ('Narok'), ('Nyamira'), ('Nyandarua'),
 ('Nyeri'), ('Samburu'), ('Siaya'), ('Taita-Taveta'), ('Tana River'), ('Tharaka-Nithi'), ('Trans Nzoia'), ('Turkana'), ('Uasin Gishu'), ('Vihiga'), ('Wajir'), ('West Pokot')
) AS divisions(division_name)
WHERE c.name = 'Kenya'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kuwait (6 governorates) 
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Al Ahmadi'), ('Al Asimah'), ('Al Farwaniyah'), ('Al Jahra'), ('Hawalli'), ('Mubarak Al-Kabeer')) AS divisions(division_name)
WHERE c.name = 'Kuwait'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Lebanon (8 mohafazat)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Akkar'), ('Baalbek-Hermel'), ('Beirut'), ('Beqaa'), ('Mount Lebanon'), ('Nabatieh'), ('North'), ('South')) AS divisions(division_name)
WHERE c.name = 'Lebanon'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Lesotho (10 districts)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Berea'), ('Butha-Buthe'), ('Leribe'), ('Mafeteng'), ('Maseru'), ('Mohale''s Hoek'), ('Mokhotlong'), ('Qacha''s Nek'), ('Quthing'), ('Thaba-Tseka')) AS divisions(division_name)
WHERE c.name = 'Lesotho'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Liberia (15 counties)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Bomi'), ('Bong'), ('Gbarpolu'), ('Grand Bassa'), ('Grand Cape Mount'), ('Grand Gedeh'), ('Grand Kru'), ('Lofa'), ('Margibi'), ('Maryland'), ('Montserrado'), ('Nimba'), ('River Cess'), ('River Gee'), ('Sinoe')) AS divisions(division_name)
WHERE c.name = 'Liberia'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Libya (22 districts)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Al Butnan'), ('Al Jabal al Akhdar'), ('Al Jabal al Gharbi'), ('Al Jfara'), ('Al Jufrah'), ('Al Kufrah'), ('Al Marj'), ('Al Murgub'),
 ('An Nuqat al Khams'), ('Az Zawiyah'), ('Benghazi'), ('Derna'), ('Ghat'), ('Misrata'), ('Murzuq'), ('Nalut'), ('Sabha'), ('Sirte'),
 ('Tripoli'), ('Wadi al Hayaa'), ('Wadi ash Shati'), ('Al Wahat')
) AS divisions(division_name)
WHERE c.name = 'Libya'
ON CONFLICT (country_id, slug) DO NOTHING;
-- Fixed SQL: escape quotes properly for PostgreSQL regex
-- Continue seeding large countries' administrative divisions

-- Japan (47 prefectures)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Aichi'), ('Akita'), ('Aomori'), ('Chiba'), ('Ehime'), ('Fukui'), ('Fukuoka'), ('Fukushima'),
  ('Gifu'), ('Gunma'), ('Hiroshima'), ('Hokkaido'), ('Hyogo'), ('Ibaraki'), ('Ishikawa'), ('Iwate'),
  ('Kagawa'), ('Kagoshima'), ('Kanagawa'), ('Kochi'), ('Kumamoto'), ('Kyoto'), ('Mie'), ('Miyagi'),
  ('Miyazaki'), ('Nagano'), ('Nagasaki'), ('Nara'), ('Niigata'), ('Oita'), ('Okayama'), ('Okinawa'),
  ('Osaka'), ('Saga'), ('Saitama'), ('Shiga'), ('Shimane'), ('Shizuoka'), ('Tochigi'), ('Tokushima'),
  ('Tokyo'), ('Tottori'), ('Toyama'), ('Wakayama'), ('Yamagata'), ('Yamaguchi'), ('Yamanashi')
) AS divisions(division_name)
WHERE c.name = 'Japan'
ON CONFLICT (country_id, slug) DO NOTHING;

-- South Korea (17 first-level divisions)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Busan'), ('Daegu'), ('Daejeon'), ('Gangwon'), ('Gwangju'), ('Gyeonggi'), ('Incheon'),
  ('Jeju'), ('North Chungcheong'), ('North Gyeongsang'), ('North Jeolla'), ('Sejong'), ('Seoul'),
  ('South Chungcheong'), ('South Gyeongsang'), ('South Jeolla'), ('Ulsan')
) AS divisions(division_name)
WHERE c.name = 'South Korea'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Taiwan (22 divisions)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Changhua'), ('Chiayi'), ('Chiayi City'), ('Hsinchu'), ('Hsinchu City'), ('Hualien'),
  ('Kaohsiung'), ('Keelung'), ('Kinmen'), ('Lienchiang'), ('Miaoli'), ('Nantou'),
  ('New Taipei'), ('Penghu'), ('Pingtung'), ('Taichung'), ('Tainan'), ('Taipei'),
  ('Taitung'), ('Taoyuan'), ('Yilan'), ('Yunlin')
) AS divisions(division_name)
WHERE c.name = 'Taiwan'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Mongolia (22 provinces)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Arkhangai'), ('Bayan-Olgii'), ('Bayankhongor'), ('Bulgan'), ('Darkhan-Uul'), ('Dornod'),
  ('Dornogovi'), ('Dundgovi'), ('Govi-Altai'), ('Govisukmber'), ('Khentii'), ('Khovd'),
  ('Khovsgol'), ('Omnogovi'), ('Orkhon'), ('Ovorkhangai'), ('Selenge'), ('Sukhbaatar'),
  ('Tov'), ('Uvs'), ('Zavkhan'), ('Ulaanbaatar')
) AS divisions(division_name)
WHERE c.name = 'Mongolia'
ON CONFLICT (country_id, slug) DO NOTHING;

-- North Korea (11 provinces)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Chagang'), ('Kangwon'), ('North Hamgyong'), ('North Hwanghae'), ('North Pyongan'),
  ('Pyongyang'), ('Rason'), ('Ryanggang'), ('South Hamgyong'), ('South Hwanghae'), ('South Pyongan')
) AS divisions(division_name)
WHERE c.name = 'North Korea'
ON CONFLICT (country_id, slug) DO NOTHING;
-- Clear existing administrative divisions to start fresh with proper unique constraints
DELETE FROM snapshot_administrative_divisions;

-- Drop existing constraint and create proper one
DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'snapshot_cities_slug_key') THEN
    ALTER TABLE snapshot_administrative_divisions DROP CONSTRAINT snapshot_cities_slug_key;
  END IF;
END $$;

-- Create proper unique constraint on country_id + slug to avoid duplicates across countries
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes WHERE schemaname = 'public' AND indexname = 'uq_admin_division_country_slug'
  ) THEN
    CREATE UNIQUE INDEX uq_admin_division_country_slug 
      ON public.snapshot_administrative_divisions(country_id, slug);
  END IF;
END $$;

-- Insert all administrative divisions systematically - FIRST BATCH (Part 1)
-- ASIA PACIFIC REGION

-- Australia
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Australia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'''',''),'''','')), c.id
FROM c, UNNEST(ARRAY[
  'New South Wales','Queensland','South Australia','Tasmania','Victoria','Western Australia','Australian Capital Territory','Northern Territory'
]) d;

-- Brunei
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Brunei' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Belait','Brunei-Muara','Temburong','Tutong']) d;

-- Japan (all prefectures)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Japan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Aichi','Akita','Aomori','Chiba','Ehime','Fukui','Fukuoka','Fukushima','Gifu','Gunma','Hiroshima','Hokkaido','Hyogo','Ibaraki','Ishikawa','Iwate','Kagawa','Kagoshima','Kanagawa','Kochi','Kumamoto','Kyoto','Mie','Miyagi','Miyazaki','Nagano','Nagasaki','Nara','Niigata','Oita','Okayama','Okinawa','Osaka','Saga','Saitama','Shiga','Shimane','Shizuoka','Tochigi','Tokushima','Tokyo','Tottori','Toyama','Wakayama','Yamagata','Yamaguchi','Yamanashi']) d;

-- Hong Kong (all districts)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Hong Kong' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'&','and')), c.id
FROM c, UNNEST(ARRAY['Central and Western','Eastern','Southern','Yau Tsim Mong','Sham Shui Po','Kowloon City','Wong Tai Sin','Kwun Tong','Kwai Tsing','Tsuen Wan','Tuen Mun','Yuen Long','North','Tai Po','Sha Tin','Sai Kung','Islands','Wan Chai']) d;

-- New Zealand
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'New Zealand' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'''','')), c.id
FROM c, UNNEST(ARRAY['Auckland','Bay of Plenty','Canterbury','Gisborne','Hawke''s Bay','Manawatu-Wanganui','Marlborough','Nelson','Northland','Otago','Southland','Taranaki','Tasman','Waikato','Wellington','West Coast','Chatham Islands']) d;

-- Singapore
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Singapore' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Central Singapore','North East','North West','South East','South West']) d;

-- South Korea
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'South Korea' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Busan','Daegu','Daejeon','Gangwon','Gwangju','Gyeonggi','Incheon','Jeju','North Chungcheong','North Gyeongsang','North Jeolla','Sejong','Seoul','South Chungcheong','South Gyeongsang','South Jeolla','Ulsan']) d;

-- Taiwan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Taiwan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Changhua','Chiayi','Chiayi City','Hsinchu','Hsinchu City','Hualien','Kaohsiung','Keelung','Kinmen','Lienchiang','Miaoli','Nantou','New Taipei','Penghu','Pingtung','Taichung','Tainan','Taipei','Taitung','Taoyuan','Yilan','Yunlin']) d;

-- EMERGING ASIA REGION

-- China (all provinces/municipalities)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'China' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Anhui','Beijing','Chongqing','Fujian','Gansu','Guangdong','Guangxi','Guizhou','Hainan','Hebei','Heilongjiang','Henan','Hong Kong','Hubei','Hunan','Inner Mongolia','Jiangsu','Jiangxi','Jilin','Liaoning','Macau','Ningxia','Qinghai','Shaanxi','Shandong','Shanghai','Shanxi','Sichuan','Tianjin','Tibet','Xinjiang','Yunnan','Zhejiang']) d;

-- India (all states and union territories)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'India' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'&','and'),'''','')), c.id
FROM c, UNNEST(ARRAY['Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand','Karnataka','Kerala','Madhya Pradesh','Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan','Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand','West Bengal','Andaman and Nicobar Islands','Chandigarh','Dadra and Nagar Haveli and Daman and Diu','Delhi','Jammu and Kashmir','Ladakh','Lakshadweep','Puducherry']) d;

-- Thailand (all provinces)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Thailand' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Amnat Charoen','Ang Thong','Bangkok','Bueng Kan','Buriram','Chachoengsao','Chai Nat','Chaiyaphum','Chanthaburi','Chiang Mai','Chiang Rai','Chonburi','Chumphon','Kalasin','Kamphaeng Phet','Kanchanaburi','Khon Kaen','Krabi','Lampang','Lamphun','Loei','Lopburi','Mae Hong Son','Maha Sarakham','Mukdahan','Nakhon Nayok','Nakhon Pathom','Nakhon Phanom','Nakhon Ratchasima','Nakhon Sawan','Nakhon Si Thammarat','Nan','Narathiwat','Nong Bua Lamphu','Nong Khai','Nonthaburi','Pathum Thani','Pattani','Phang Nga','Phatthalung','Phayao','Phetchabun','Phetchaburi','Phichit','Phitsanulok','Phra Nakhon Si Ayutthaya','Phrae','Phuket','Prachinburi','Prachuap Khiri Khan','Ranong','Ratchaburi','Rayong','Roi Et','Sa Kaeo','Sakon Nakhon','Samut Prakan','Samut Sakhon','Samut Songkhram','Saraburi','Satun','Sing Buri','Sisaket','Songkhla','Sukhothai','Suphan Buri','Surat Thani','Surin','Tak','Trang','Trat','Ubon Ratchathani','Udon Thani','Uthai Thani','Uttaradit','Yala','Yasothon']) d;
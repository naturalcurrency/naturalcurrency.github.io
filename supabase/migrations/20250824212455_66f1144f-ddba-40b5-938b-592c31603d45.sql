-- Ensure unique divisions per country
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes WHERE schemaname = 'public' AND indexname = 'uq_admin_division_country_slug'
  ) THEN
    CREATE UNIQUE INDEX uq_admin_division_country_slug 
      ON public.snapshot_administrative_divisions(country_id, slug);
  END IF;
END $$;

-- Helper to insert divisions for a country
-- Usage pattern below repeats per country using UNNEST arrays

-- =============== ASIA PACIFIC ===============
-- Australia
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Australia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),'''','')) AS slug, c.id
FROM c, UNNEST(ARRAY[
  'New South Wales','Queensland','South Australia','Tasmania','Victoria','Western Australia','Australian Capital Territory','Northern Territory'
]) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Brunei
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Brunei' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Belait','Brunei-Muara','Temburong','Tutong']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Cook Islands (island councils)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Cook Islands' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Aitutaki','Atiu','Mangaia','Mauke','Mitiaro','Palmerston','Penrhyn','Pukapuka','Rakahanga','Rarotonga','Manihiki','Nassau','Suwarrow','Takutea','Manuae']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Fiji
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Fiji' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Central','Eastern','Northern','Western','Rotuma']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- French Polynesia
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'French Polynesia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Windward Islands','Leeward Islands','Marquesas Islands','Austral Islands','Tuamotu-Gambier']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Hong Kong (districts)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Hong Kong' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Central and Western','Eastern','Southern','Yau Tsim Mong','Sham Shui Po','Kowloon City','Wong Tai Sin','Kwun Tong','Kwai Tsing','Tsuen Wan','Tuen Mun','Yuen Long','North','Tai Po','Sha Tin','Sai Kung','Islands','Wan Chai']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Japan (prefectures)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Japan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),'''','')), c.id
FROM c, UNNEST(ARRAY['Aichi','Akita','Aomori','Chiba','Ehime','Fukui','Fukuoka','Fukushima','Gifu','Gunma','Hiroshima','Hokkaido','Hyogo','Ibaraki','Ishikawa','Iwate','Kagawa','Kagoshima','Kanagawa','Kochi','Kumamoto','Kyoto','Mie','Miyagi','Miyazaki','Nagano','Nagasaki','Nara','Niigata','Oita','Okayama','Okinawa','Osaka','Saga','Saitama','Shiga','Shimane','Shizuoka','Tochigi','Tokushima','Tokyo','Tottori','Toyama','Wakayama','Yamagata','Yamaguchi','Yamanashi']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kiribati (island councils)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Kiribati' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Abaiang','Abemama','Aranuka','Arorae','Banaba','Beru','Butaritari','Kanton','Kiritimati','Kuria','Maiana','Makin','Marakei','Nikunau','Nonouti','Onotoa','Tabiteuea','Tabuaeran','Tamana','Tarawa','Teraina']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Macau (parishes)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Macau' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'ã','a'),'ó','o')), c.id
FROM c, UNNEST(ARRAY['Nossa Senhora de Fátima','Santo António','São Lázaro','Sé','São Lourenço','Nossa Senhora do Carmo','São Francisco Xavier','Cotai']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Marshall Islands (atolls)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Marshall Islands' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Ailinglaplap','Ailuk','Arno','Aur','Bikini','Ebon','Enewetak','Jabat','Jaluit','Kili','Kwajalein','Lae','Lib','Likiep','Majuro','Maloelap','Mejit','Mili','Namdrik','Namu','Rongelap','Ujae','Utrik','Wotje']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Micronesia
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Micronesia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Chuuk','Kosrae','Pohnpei','Yap']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Nauru (districts)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Nauru' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Aiwo','Anabar','Anetan','Anibare','Baitsi','Boe','Buada','Denigomodu','Ewa','Ijuw','Meneng','Nibok','Uaboe','Yaren']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- New Caledonia
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'New Caledonia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['North Province','South Province','Loyalty Islands Province']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- New Zealand
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'New Zealand' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Auckland','Bay of Plenty','Canterbury','Gisborne','Hawke’s Bay','Manawatu-Wanganui','Marlborough','Nelson','Northland','Otago','Southland','Taranaki','Tasman','Waikato','Wellington','West Coast','Chatham Islands']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Palau
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Palau' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Aimeliik','Airai','Angaur','Hatohobei','Kayangel','Koror','Melekeok','Ngaraard','Ngarchelong','Ngardmau','Ngatpang','Ngchesar','Ngeremlengui','Ngiwal','Peleliu','Sonsorol']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Papua New Guinea
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Papua New Guinea' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Central','Chimbu','Eastern Highlands','East New Britain','East Sepik','Enga','Gulf','Hela','Jiwaka','Madang','Manus','Milne Bay','Morobe','New Ireland','Northern','Sandaun','Southern Highlands','Western','Western Highlands','West New Britain','Bougainville','National Capital District']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Samoa
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Samoa' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),'''','')), c.id
FROM c, UNNEST(ARRAY['A’ana','Aiga-i-le-Tai','Atua','Fa’asaleleaga','Gaga’emauga','Gagaifomauga','Palauli','Satupa’itea','Tuamasaga','Va’a-o-Fonoti','Vaisigano']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Singapore (CDCs)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Singapore' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Central Singapore','North East','North West','South East','South West']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Solomon Islands (+ capital)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Solomon Islands' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Central','Choiseul','Guadalcanal','Isabel','Makira-Ulawa','Malaita','Rennell and Bellona','Temotu','Western','Honiara']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- South Korea
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'South Korea' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Busan','Daegu','Daejeon','Gangwon','Gwangju','Gyeonggi','Incheon','Jeju','North Chungcheong','North Gyeongsang','North Jeolla','Sejong','Seoul','South Chungcheong','South Gyeongsang','South Jeolla','Ulsan']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Taiwan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Taiwan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Changhua','Chiayi','Chiayi City','Hsinchu','Hsinchu City','Hualien','Kaohsiung','Keelung','Kinmen','Lienchiang','Miaoli','Nantou','New Taipei','Penghu','Pingtung','Taichung','Tainan','Taipei','Taitung','Taoyuan','Yilan','Yunlin']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Tonga
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Tonga' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['‘Eua','Ha’apai','Niuas','Tongatapu','Vava’u']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Tuvalu
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Tuvalu' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Funafuti','Nanumaga','Nanumea','Niulakita','Niutao','Nui','Nukufetau','Nukulaelae','Vaitupu']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Vanuatu
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Vanuatu' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Malampa','Penama','Sanma','Shefa','Tafea','Torba']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- =============== EMERGING ASIA ===============
-- Afghanistan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Afghanistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),'''','')), c.id
FROM c, UNNEST(ARRAY['Badakhshan','Badghis','Baghlan','Balkh','Bamyan','Daykundi','Farah','Faryab','Ghazni','Ghor','Helmand','Herat','Jowzjan','Kabul','Kandahar','Kapisa','Khost','Kunar','Kunduz','Laghman','Logar','Nangarhar','Nimruz','Nuristan','Paktia','Paktika','Panjshir','Parwan','Samangan','Sar-e Pol','Takhar','Uruzgan','Wardak','Zabul']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Bangladesh
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Bangladesh' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Barisal','Chittagong','Dhaka','Khulna','Mymensingh','Rajshahi','Rangpur','Sylhet']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Bhutan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Bhutan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Bumthang','Chukha','Dagana','Gasa','Haa','Lhuntse','Mongar','Paro','Pema Gatshel','Punakha','Samdrup Jongkhar','Samtse','Sarpang','Thimphu','Trashigang','Trashiyangtse','Trongsa','Tsirang','Wangdue Phodrang','Zhemgang']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Cambodia
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Cambodia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'é','e')), c.id
FROM c, UNNEST(ARRAY['Banteay Meanchey','Battambang','Kampong Cham','Kampong Chhnang','Kampong Speu','Kampong Thom','Kampot','Kandal','Kep','Koh Kong','Kratié','Mondulkiri','Oddar Meanchey','Pailin','Phnom Penh','Preah Vihear','Prey Veng','Pursat','Ratanakiri','Siem Reap','Sihanoukville','Stung Treng','Svay Rieng','Takeo','Tboung Khmum']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- China (full set per spec)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'China' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),',','')), c.id
FROM c, UNNEST(ARRAY['Anhui','Beijing','Chongqing','Fujian','Gansu','Guangdong','Guangxi','Guizhou','Hainan','Hebei','Heilongjiang','Henan','Hong Kong','Hubei','Hunan','Inner Mongolia','Jiangsu','Jiangxi','Jilin','Liaoning','Macau','Ningxia','Qinghai','Shaanxi','Shandong','Shanghai','Shanxi','Sichuan','Tianjin','Tibet','Xinjiang','Yunnan','Zhejiang']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- East Timor (Timor-Leste)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'East Timor (Timor-Leste)' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'ç','c'),'é','e')), c.id
FROM c, UNNEST(ARRAY['Aileu','Ainaro','Baucau','Bobonaro','Cova Lima','Dili','Ermera','Lautém','Liquiçá','Manatuto','Manufahi','Oecusse','Viqueque']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- India (full states + UTs)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'India' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'&','and'),'’','')), c.id
FROM c, UNNEST(ARRAY['Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh','Jharkhand','Karnataka','Kerala','Madhya Pradesh','Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan','Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand','West Bengal','Andaman and Nicobar Islands','Chandigarh','Dadra and Nagar Haveli and Daman and Diu','Delhi','Jammu and Kashmir','Ladakh','Lakshadweep','Puducherry']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Indonesia (full per spec)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Indonesia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),',','')), c.id
FROM c, UNNEST(ARRAY['Aceh','Bali','Bangka Belitung','Banten','Bengkulu','Central Java','Central Kalimantan','Central Sulawesi','East Java','East Kalimantan','East Nusa Tenggara','Gorontalo','Jakarta','Jambi','Lampung','Maluku','North Kalimantan','North Maluku','North Sulawesi','North Sumatra','Papua','Riau','Riau Islands','South Kalimantan','South Sulawesi','South Sumatra','Southeast Sulawesi','West Java','West Kalimantan','West Nusa Tenggara','West Papua','West Sulawesi','West Sumatra','Yogyakarta']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kazakhstan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Kazakhstan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Abai','Akmola','Aktobe','Almaty','Almaty City','Atyrau','Baikonur','East Kazakhstan','Jambyl','Jetisu','Karaganda','Kostanay','Kyzylorda','Mangystau','North Kazakhstan','Pavlodar','Shymkent','Turkistan','West Kazakhstan']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kyrgyzstan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Kyrgyzstan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Alai','Batken','Chuy','Jalal-Abad','Naryn','Osh','Osh City','Talas','Yssyk-Köl']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Laos
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Laos' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),'ô','o')), c.id
FROM c, UNNEST(ARRAY['Attapeu','Bokeo','Bolikhamxai','Champasak','Houaphan','Khammouane','Luang Namtha','Luang Prabang','Oudomxay','Phongsaly','Sainyabuli','Salavan','Savannakhet','Sekong','Vientiane','Vientiane Prefecture','Xaisomboun','Xiengkhuang']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Malaysia
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Malaysia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),'á','a')), c.id
FROM c, UNNEST(ARRAY['Johor','Kedah','Kelantan','Kuala Lumpur','Labuan','Malacca','Negeri Sembilan','Pahang','Penang','Perak','Perlis','Putrajaya','Sabah','Sarawak','Selangor','Terengganu']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Maldives
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Maldives' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Alif Alif','Alif Dhaal','Baa','Dhaalu','Faafu','Gaaf Alif','Gaaf Dhaal','Gnaviyani','Haa Alif','Haa Dhaal','Kaafu','Laamu','Lhaviyani','Malé','Meemu','Noonu','Raa','Seenu','Shaviyani','Thaa','Vaavu']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Mongolia
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Mongolia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'ö','o'),'ü','u')), c.id
FROM c, UNNEST(ARRAY['Arkhangai','Bayan-Ölgii','Bayankhongor','Bulgan','Darkhan-Uul','Dornod','Dornogovi','Dundgovi','Govi-Altai','Govisümber','Khentii','Khovd','Khövsgöl','Ömnögovi','Orkhon','Övörkhangai','Selenge','Sükhbaatar','Töv','Uvs','Zavkhan','Ulaanbaatar']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Myanmar
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Myanmar' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Ayeyarwady','Bago','Chin','Kachin','Kayah','Kayin','Magway','Mandalay','Mon','Naypyidaw','Rakhine','Sagaing','Shan','Tanintharyi','Yangon']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Nepal
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Nepal' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Bagmati','Gandaki','Karnali','Koshi','Lumbini','Madhesh','Sudurpashchim']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- North Korea
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'North Korea' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Chagang','Kangwon','North Hamgyong','North Hwanghae','North Pyongan','Pyongyang','Rason','Ryanggang','South Hamgyong','South Hwanghae','South Pyongan']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Pakistan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Pakistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),'&','and')), c.id
FROM c, UNNEST(ARRAY['Balochistan','Khyber Pakhtunkhwa','Punjab','Sindh','Azad Jammu and Kashmir','Gilgit-Baltistan','Islamabad Capital Territory']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Philippines (provinces subset + Metro Manila as provided)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Philippines' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'’',''),'ñ','n')), c.id
FROM c, UNNEST(ARRAY['Abra','Agusan del Norte','Agusan del Sur','Aklan','Albay','Antique','Apayao','Aurora','Basilan','Bataan','Batanes','Batangas','Benguet','Biliran','Bohol','Bukidnon','Bulacan','Cagayan','Camarines Norte','Camarines Sur','Camiguin','Capiz','Catanduanes','Cavite','Cebu','Cotabato','Davao de Oro','Davao del Norte','Davao del Sur','Davao Occidental','Davao Oriental','Dinagat Islands','Eastern Samar','Guimaras','Ifugao','Ilocos Norte','Ilocos Sur','Iloilo','Isabela','Kalinga','La Union','Laguna','Lanao del Norte','Lanao del Sur','Leyte','Maguindanao del Norte','Maguindanao del Sur','Marinduque','Masbate','Misamis Occidental','Misamis Oriental','Mountain Province','Negros Occidental','Negros Oriental','Northern Samar','Nueva Ecija','Nueva Vizcaya','Occidental Mindoro','Oriental Mindoro','Palawan','Pampanga','Pangasinan','Quezon','Quirino','Rizal','Rombloca','Samar','Sarangani','Siquijor','Sorsogon','South Cotabato','Southern Leyte','Sultan Kudarat','Sulu','Surigao del Norte','Surigao del Sur','Tarlac','Tawi-Tawi','Zambales','Zamboanga del Norte','Zamboanga del Sur','Zamboanga Sibugay','Metro Manila']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Sri Lanka
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Sri Lanka' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Central','Eastern','North Central','Northern','North Western','Sabaragamuwa','Southern','Uva','Western']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Tajikistan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Tajikistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Dushanbe','Gorno-Badakhshan','Khatlon','Sughd','Districts of Republican Subordination']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Thailand
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Thailand' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Amnat Charoen','Ang Thong','Bangkok','Bueng Kan','Buriram','Chachoengsao','Chai Nat','Chaiyaphum','Chanthaburi','Chiang Mai','Chiang Rai','Chonburi','Chumphon','Kalasin','Kamphaeng Phet','Kanchanaburi','Khon Kaen','Krabi','Lampang','Lamphun','Loei','Lopburi','Mae Hong Son','Maha Sarakham','Mukdahan','Nakhon Nayok','Nakhon Pathom','Nakhon Phanom','Nakhon Ratchasima','Nakhon Sawan','Nakhon Si Thammarat','Nan','Narathiwat','Nong Bua Lamphu','Nong Khai','Nonthaburi','Pathum Thani','Pattani','Phang Nga','Phatthalung','Phayao','Phetchabun','Phetchaburi','Phichit','Phitsanulok','Phra Nakhon Si Ayutthaya','Phrae','Phuket','Prachinburi','Prachuap Khiri Khan','Ranong','Ratchaburi','Rayong','Roi Et','Sa Kaeo','Sakon Nakhon','Samut Prakan','Samut Sakhon','Samut Songkhram','Saraburi','Satun','Sing Buri','Sisaket','Songkhla','Sukhothai','Suphan Buri','Surat Thani','Surin','Tak','Trang','Trat','Ubon Ratchathani','Udon Thani','Uthai Thani','Uttaradit','Yala','Yasothon']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Turkmenistan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Turkmenistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Ahal','Ashgabat','Balkan','Dashoguz','Lebap','Mary']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Uzbekistan
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Uzbekistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'’','')), c.id
FROM c, UNNEST(ARRAY['Andijan','Bukhara','Fergana','Jizzakh','Karakalpakstan','Kashkadarya','Khorezm','Namangan','Navoiy','Samarkand','Surkhandarya','Syrdarya','Tashkent','Tashkent City']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Vietnam
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Vietnam' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(REPLACE(d,' ', '-'),'Đ','D'),'à','a'),'á','a')), c.id
FROM c, UNNEST(ARRAY['An Giang','Bà Rịa-Vũng Tàu','Bắc Giang','Bắc Kạn','Bạc Liêu','Bắc Ninh','Bến Tre','Bình Định','Bình Dương','Bình Phước','Bình Thuận','Cà Mau','Cần Thơ','Cao Bằng','Đà Nẵng','Đắk Lắk','Đắk Nông','Điện Biên','Đồng Nai','Đồng Tháp','Gia Lai','Hà Giang','Hà Nam','Hà Nội','Hà Tĩnh','Hải Dương','Hải Phòng','Hậu Giang','Hòa Bình','Hưng Yên','Khánh Hòa','Kiên Giang','Kon Tum','Lai Châu','Lâm Đồng','Lạng Sơn','Lào Cai','Long An','Nam Định','Nghệ An','Ninh Bình','Ninh Thuận','Phú Thọ','Phú Yên','Quảng Bình','Quảng Nam','Quảng Ngãi','Quảng Ninh','Quảng Trị','Sóc Trăng','Sơn La','Tây Ninh','Thái Bình','Thái Nguyên','Thanh Hóa','Thừa Thiên Huế','Tiền Giang','Trà Vinh','Tuyên Quang','Vĩnh Long','Vĩnh Phúc','Yên Bái']) d
ON CONFLICT (country_id, slug) DO NOTHING;
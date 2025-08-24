-- Fill gaps: Asia Pacific microstates and Emerging Asia (phase 1)

-- Helper note: we prefix slugs with country slug to avoid collisions

-- Kiribati (21 island councils)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Kiribati' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Abaiang','abaiang'),('Abemama','abemama'),('Aranuka','aranuka'),('Arorae','arorae'),('Banaba','banaba'),('Beru','beru'),('Butaritari','butaritari'),('Kanton','kanton'),('Kiritimati','kiritimati'),('Kuria','kuria'),('Maiana','maiana'),('Makin','makin'),('Marakei','marakei'),('Nikunau','nikunau'),('Nonouti','nonouti'),('Onotoa','onotoa'),('Tabiteuea','tabiteuea'),('Tabuaeran','tabuaeran'),('Tamana','tamana'),('Tarawa','tarawa'),('Teraina','teraina')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Macau (8 parishes)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Macau' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Nossa Senhora de Fatima','nossa-senhora-de-fatima'),('Santo Antonio','santo-antonio'),('Sao Lazaro','sao-lazaro'),('Se','se'),('Sao Lourenco','sao-lourenco'),('Nossa Senhora do Carmo','nossa-senhora-do-carmo'),('Sao Francisco Xavier','sao-francisco-xavier'),('Cotai','cotai')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Marshall Islands (24 inhabited island councils)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Marshall Islands' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Ailinglaplap','ailinglaplap'),('Ailuk','ailuk'),('Arno','arno'),('Aur','aur'),('Bikini','bikini'),('Ebon','ebon'),('Enewetak','enewetak'),('Jabat','jabat'),('Jaluit','jaluit'),('Kili','kili'),('Kwajalein','kwajalein'),('Lae','lae'),('Lib','lib'),('Likiep','likiep'),('Majuro','majuro'),('Maloelap','maloelap'),('Mejit','mejit'),('Mili','mili'),('Namdrik','namdrik'),('Namu','namu'),('Rongelap','rongelap'),('Ujae','ujae'),('Utrik','utrik'),('Wotje','wotje')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Micronesia (4 states)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Micronesia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Chuuk','chuuk'),('Kosrae','kosrae'),('Pohnpei','pohnpei'),('Yap','yap')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Nauru (14 districts)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Nauru' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Aiwo','aiwo'),('Anabar','anabar'),('Anetan','anetan'),('Anibare','anibare'),('Baitsi','baitsi'),('Boe','boe'),('Buada','buada'),('Denigomodu','denigomodu'),('Ewa','ewa'),('Ijuw','ijuw'),('Meneng','meneng'),('Nibok','nibok'),('Uaboe','uaboe'),('Yaren','yaren')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- New Caledonia (3)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'New Caledonia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('North Province','north-province'),('South Province','south-province'),('Loyalty Islands Province','loyalty-islands-province')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Palau (16 states)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Palau' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Aimeliik','aimeliik'),('Airai','airai'),('Angaur','angaur'),('Hatohobei','hatohobei'),('Kayangel','kayangel'),('Koror','koror'),('Melekeok','melekeok'),('Ngaraard','ngaraard'),('Ngarchelong','ngarchelong'),('Ngardmau','ngardmau'),('Ngatpang','ngatpang'),('Ngchesar','ngchesar'),('Ngeremlengui','ngeremlengui'),('Ngiwal','ngiwal'),('Peleliu','peleliu'),('Sonsorol','sonsorol')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Papua New Guinea (22)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Papua New Guinea' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Central','central'),('Chimbu','chimbu'),('Eastern Highlands','eastern-highlands'),('East New Britain','east-new-britain'),('East Sepik','east-sepik'),('Enga','enga'),('Gulf','gulf'),('Hela','hela'),('Jiwaka','jiwaka'),('Madang','madang'),('Manus','manus'),('Milne Bay','milne-bay'),('Morobe','morobe'),('New Ireland','new-ireland'),('Northern','northern'),('Sandaun','sandaun'),('Southern Highlands','southern-highlands'),('Western','western'),('Western Highlands','western-highlands'),('West New Britain','west-new-britain'),('Bougainville','bougainville'),('National Capital District','national-capital-district')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Samoa (11)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Samoa' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('A''ana','aana'),('Aiga-i-le-Tai','aiga-i-le-tai'),('Atua','atua'),('Fa''asaleleaga','faasaleleaga'),('Gaga''emauga','gagaemauga'),('Gagaifomauga','gagaifomauga'),('Palauli','palauli'),('Satupa''itea','satupaitea'),('Tuamasaga','tuamasaga'),('Va''a-o-Fonoti','vaa-o-fonoti'),('Vaisigano','vaisigano')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Singapore (5 CDC districts)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Singapore' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Central Singapore','central-singapore'),('North East','north-east'),('North West','north-west'),('South East','south-east'),('South West','south-west')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Solomon Islands (10 provinces + Honiara)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Solomon Islands' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Central','central'),('Choiseul','choiseul'),('Guadalcanal','guadalcanal'),('Isabel','isabel'),('Makira-Ulawa','makira-ulawa'),('Malaita','malaita'),('Rennell and Bellona','rennell-and-bellona'),('Temotu','temotu'),('Western','western'),('Honiara','honiara')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Tonga (5)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Tonga' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Eua','eua'),('Ha''apai','haapai'),('Niuas','niuas'),('Tongatapu','tongatapu'),('Vava''u','vavau')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Tuvalu (9)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Tuvalu' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Funafuti','funafuti'),('Nanumaga','nanumaga'),('Nanumea','nanumea'),('Niulakita','niulakita'),('Niutao','niutao'),('Nui','nui'),('Nukufetau','nukufetau'),('Nukulaelae','nukulaelae'),('Vaitupu','vaitupu')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Vanuatu (6)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Vanuatu' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Malampa','malampa'),('Penama','penama'),('Sanma','sanma'),('Shefa','shefa'),('Tafea','tafea'),('Torba','torba')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Emerging Asia basics (smaller lists)

-- Bangladesh (8)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Bangladesh' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Barisal','barisal'),('Chittagong','chittagong'),('Dhaka','dhaka'),('Khulna','khulna'),('Mymensingh','mymensingh'),('Rajshahi','rajshahi'),('Rangpur','rangpur'),('Sylhet','sylhet')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Pakistan (7 incl territories)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Pakistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Balochistan','balochistan'),('Khyber Pakhtunkhwa','khyber-pakhtunkhwa'),('Punjab','punjab'),('Sindh','sindh'),('Azad Jammu and Kashmir','azad-jammu-and-kashmir'),('Gilgit-Baltistan','gilgit-baltistan'),('Islamabad Capital Territory','islamabad-capital-territory')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Sri Lanka (9)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Sri Lanka' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Central','central'),('Eastern','eastern'),('North Central','north-central'),('Northern','northern'),('North Western','north-western'),('Sabaragamuwa','sabaragamuwa'),('Southern','southern'),('Uva','uva'),('Western','western')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Nepal (7)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Nepal' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Bagmati','bagmati'),('Gandaki','gandaki'),('Karnali','karnali'),('Koshi','koshi'),('Lumbini','lumbini'),('Madhesh','madhesh'),('Sudurpashchim','sudurpashchim')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Laos (18)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Laos' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Attapeu','attapeu'),('Bokeo','bokeo'),('Bolikhamxai','bolikhamxai'),('Champasak','champasak'),('Houaphan','houaphan'),('Khammouane','khammouane'),('Luang Namtha','luang-namtha'),('Luang Prabang','luang-prabang'),('Oudomxay','oudomxay'),('Phongsaly','phongsaly'),('Sainyabuli','sainyabuli'),('Salavan','salavan'),('Savannakhet','savannakhet'),('Sekong','sekong'),('Vientiane','vientiane'),('Vientiane Prefecture','vientiane-prefecture'),('Xaisomboun','xaisomboun'),('Xiengkhuang','xiengkhuang')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Malaysia (16 + 3 Federal Territories already covered by KL/Labuan/Putrajaya)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Malaysia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Johor','johor'),('Kedah','kedah'),('Kelantan','kelantan'),('Kuala Lumpur','kuala-lumpur'),('Labuan','labuan'),('Malacca','malacca'),('Negeri Sembilan','negeri-sembilan'),('Pahang','pahang'),('Penang','penang'),('Perak','perak'),('Perlis','perlis'),('Putrajaya','putrajaya'),('Sabah','sabah'),('Sarawak','sarawak'),('Selangor','selangor'),('Terengganu','terengganu')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Maldives (20+ atolls simplified as listed)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Maldives' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Alif Alif','alif-alif'),('Alif Dhaal','alif-dhaal'),('Baa','baa'),('Dhaalu','dhaalu'),('Faafu','faafu'),('Gaaf Alif','gaaf-alif'),('Gaaf Dhaal','gaaf-dhaal'),('Gnaviyani','gnaviyani'),('Haa Alif','haa-alif'),('Haa Dhaal','haa-dhaal'),('Kaafu','kaafu'),('Laamu','laamu'),('Lhaviyani','lhaviyani'),('Male','male'),('Meemu','meemu'),('Noonu','noonu'),('Raa','raa'),('Seenu','seenu'),('Shaviyani','shaviyani'),('Thaa','thaa'),('Vaavu','vaavu')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kyrgyzstan (9)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Kyrgyzstan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Alai','alai'),('Batken','batken'),('Chuy','chuy'),('Jalal-Abad','jalal-abad'),('Naryn','naryn'),('Osh','osh'),('Osh City','osh-city'),('Talas','talas'),('Yssyk-Kol','yssyk-kol')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Tajikistan (5)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Tajikistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Dushanbe','dushanbe'),('Gorno-Badakhshan','gorno-badakhshan'),('Khatlon','khatlon'),('Sughd','sughd'),('Districts of Republican Subordination','districts-of-republican-subordination')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Turkmenistan (6)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Turkmenistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Ahal','ahal'),('Ashgabat','ashgabat'),('Balkan','balkan'),('Dashoguz','dashoguz'),('Lebap','lebap'),('Mary','mary')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Uzbekistan (14)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Uzbekistan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Andijan','andijan'),('Bukhara','bukhara'),('Fergana','fergana'),('Jizzakh','jizzakh'),('Karakalpakstan','karakalpakstan'),('Kashkadarya','kashkadarya'),('Khorezm','khorezm'),('Namangan','namangan'),('Navoiy','navoiy'),('Samarkand','samarkand'),('Surkhandarya','surkhandarya'),('Syrdarya','syrdarya'),('Tashkent','tashkent'),('Tashkent City','tashkent-city')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kazakhstan (20)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Kazakhstan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES ('Abai','abai'),('Akmola','akmola'),('Aktobe','aktobe'),('Almaty','almaty'),('Almaty City','almaty-city'),('Atyrau','atyrau'),('Baikonur','baikonur'),('East Kazakhstan','east-kazakhstan'),('Jambyl','jambyl'),('Jetisu','jetisu'),('Karaganda','karaganda'),('Kostanay','kostanay'),('Kyzylorda','kyzylorda'),('Mangystau','mangystau'),('North Kazakhstan','north-kazakhstan'),('Pavlodar','pavlodar'),('Shymkent','shymkent'),('Turkistan','turkistan'),('West Kazakhstan','west-kazakhstan'),('Ulytau','ulytau')) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Cambodia (25)
WITH c AS (SELECT id, slug FROM snapshot_countries WHERE name = 'Cambodia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT v.name, CONCAT(c.slug, '-', v.slug), c.id FROM c
CROSS JOIN (VALUES
 ('Banteay Meanchey','banteay-meanchey'),('Battambang','battambang'),('Kampong Cham','kampong-cham'),('Kampong Chhnang','kampong-chhnang'),('Kampong Speu','kampong-speu'),('Kampong Thom','kampong-thom'),('Kampot','kampot'),('Kandal','kandal'),('Kep','kep'),('Koh Kong','koh-kong'),('Kratie','kratie'),('Mondulkiri','mondulkiri'),('Oddar Meanchey','oddar-meanchey'),('Pailin','pailin'),('Phnom Penh','phnom-penh'),('Preah Vihear','preah-vihear'),('Prey Veng','prey-veng'),('Pursat','pursat'),('Ratanakiri','ratanakiri'),('Siem Reap','siem-reap'),('Preah Sihanouk','preah-sihanouk'),('Stung Treng','stung-treng'),('Svay Rieng','svay-rieng'),('Takeo','takeo'),('Tboung Khmum','tboung-khmum')
) AS v(name, slug)
ON CONFLICT (country_id, slug) DO NOTHING;

-- Kyrgyzstan, Tajikistan, Turkmenistan, Uzbekistan already added above
-- Note: We will handle large sets (China, India, Indonesia, Philippines, Thailand, Vietnam, Afghanistan, Bhutan, Mongolia, Myanmar, North Korea, East Timor) in the next batch due to size.

-- Fix security linter warning: ensure function has fixed search_path
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS trigger
LANGUAGE plpgsql
SET search_path TO 'public'
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

-- Helper slug expression: remove apostrophes and non-alphanumerics, collapse to hyphens
-- Seed remaining large countries' first-level divisions

-- Japan (47 prefectures)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '[’''']', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
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
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '[’''']', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
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
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '[’''']', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Changhua'), ('Chiayi'), ('Chiayi City'), ('Hsinchu'), ('Hsinchu City'), ('Hualien'),
  ('Kaohsiung'), ('Keelung'), ('Kinmen'), ('Lienchiang'), ('Miaoli'), ('Nantou'),
  ('New Taipei'), ('Penghu'), ('Pingtung'), ('Taichung'), ('Tainan'), ('Taipei'),
  ('Taitung'), ('Taoyuan'), ('Yilan'), ('Yunlin')
) AS divisions(division_name)
WHERE c.name = 'Taiwan'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Philippines (82 including NCR as Metro Manila)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '[’''']', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Abra'), ('Agusan del Norte'), ('Agusan del Sur'), ('Aklan'), ('Albay'), ('Antique'), ('Apayao'),
  ('Aurora'), ('Basilan'), ('Bataan'), ('Batanes'), ('Batangas'), ('Benguet'), ('Biliran'),
  ('Bohol'), ('Bukidnon'), ('Bulacan'), ('Cagayan'), ('Camarines Norte'), ('Camarines Sur'),
  ('Camiguin'), ('Capiz'), ('Catanduanes'), ('Cavite'), ('Cebu'), ('Cotabato'), ('Davao de Oro'),
  ('Davao del Norte'), ('Davao del Sur'), ('Davao Occidental'), ('Davao Oriental'), ('Dinagat Islands'),
  ('Eastern Samar'), ('Guimaras'), ('Ifugao'), ('Ilocos Norte'), ('Ilocos Sur'), ('Iloilo'),
  ('Isabela'), ('Kalinga'), ('La Union'), ('Laguna'), ('Lanao del Norte'), ('Lanao del Sur'),
  ('Leyte'), ('Maguindanao del Norte'), ('Maguindanao del Sur'), ('Marinduque'), ('Masbate'),
  ('Misamis Occidental'), ('Misamis Oriental'), ('Mountain Province'), ('Negros Occidental'),
  ('Negros Oriental'), ('Northern Samar'), ('Nueva Ecija'), ('Nueva Vizcaya'), ('Occidental Mindoro'),
  ('Oriental Mindoro'), ('Palawan'), ('Pampanga'), ('Pangasinan'), ('Quezon'), ('Quirino'), ('Rizal'),
  ('Romblon'), ('Samar'), ('Sarangani'), ('Siquijor'), ('Sorsogon'), ('South Cotabato'),
  ('Southern Leyte'), ('Sultan Kudarat'), ('Sulu'), ('Surigao del Norte'), ('Surigao del Sur'),
  ('Tarlac'), ('Tawi-Tawi'), ('Zambales'), ('Zamboanga del Norte'), ('Zamboanga del Sur'),
  ('Zamboanga Sibugay'), ('Metro Manila')
) AS divisions(division_name)
WHERE c.name = 'Philippines'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Thailand (77 provinces)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '[’''']', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Amnat Charoen'), ('Ang Thong'), ('Bangkok'), ('Bueng Kan'), ('Buriram'), ('Chachoengsao'),
  ('Chai Nat'), ('Chaiyaphum'), ('Chanthaburi'), ('Chiang Mai'), ('Chiang Rai'), ('Chonburi'),
  ('Chumphon'), ('Kalasin'), ('Kamphaeng Phet'), ('Kanchanaburi'), ('Khon Kaen'), ('Krabi'),
  ('Lampang'), ('Lamphun'), ('Loei'), ('Lopburi'), ('Mae Hong Son'), ('Maha Sarakham'),
  ('Mukdahan'), ('Nakhon Nayok'), ('Nakhon Pathom'), ('Nakhon Phanom'), ('Nakhon Ratchasima'),
  ('Nakhon Sawan'), ('Nakhon Si Thammarat'), ('Nan'), ('Narathiwat'), ('Nong Bua Lamphu'),
  ('Nong Khai'), ('Nonthaburi'), ('Pathum Thani'), ('Pattani'), ('Phang Nga'), ('Phatthalung'),
  ('Phayao'), ('Phetchabun'), ('Phetchaburi'), ('Phichit'), ('Phitsanulok'), ('Phra Nakhon Si Ayutthaya'),
  ('Phrae'), ('Phuket'), ('Prachinburi'), ('Prachuap Khiri Khan'), ('Ranong'), ('Ratchaburi'),
  ('Rayong'), ('Roi Et'), ('Sa Kaeo'), ('Sakon Nakhon'), ('Samut Prakan'), ('Samut Sakhon'),
  ('Samut Songkhram'), ('Saraburi'), ('Satun'), ('Sing Buri'), ('Sisaket'), ('Songkhla'),
  ('Sukhothai'), ('Suphan Buri'), ('Surat Thani'), ('Surin'), ('Tak'), ('Trang'), ('Trat'),
  ('Ubon Ratchathani'), ('Udon Thani'), ('Uthai Thani'), ('Uttaradit'), ('Yala'), ('Yasothon')
) AS divisions(division_name)
WHERE c.name = 'Thailand'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Vietnam (63 provinces/cities)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '[’''']', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('An Giang'), ('Ba Ria-Vung Tau'), ('Bac Giang'), ('Bac Kan'), ('Bac Lieu'), ('Bac Ninh'),
  ('Ben Tre'), ('Binh Dinh'), ('Binh Duong'), ('Binh Phuoc'), ('Binh Thuan'), ('Ca Mau'),
  ('Can Tho'), ('Cao Bang'), ('Da Nang'), ('Dak Lak'), ('Dak Nong'), ('Dien Bien'),
  ('Dong Nai'), ('Dong Thap'), ('Gia Lai'), ('Ha Giang'), ('Ha Nam'), ('Ha Noi'), ('Ha Tinh'),
  ('Hai Duong'), ('Hai Phong'), ('Hau Giang'), ('Hoa Binh'), ('Hung Yen'), ('Khanh Hoa'),
  ('Kien Giang'), ('Kon Tum'), ('Lai Chau'), ('Lam Dong'), ('Lang Son'), ('Lao Cai'),
  ('Long An'), ('Nam Dinh'), ('Nghe An'), ('Ninh Binh'), ('Ninh Thuan'), ('Phu Tho'),
  ('Phu Yen'), ('Quang Binh'), ('Quang Nam'), ('Quang Ngai'), ('Quang Ninh'), ('Quang Tri'),
  ('Soc Trang'), ('Son La'), ('Tay Ninh'), ('Thai Binh'), ('Thai Nguyen'), ('Thanh Hoa'),
  ('Thua Thien Hue'), ('Tien Giang'), ('Tra Vinh'), ('Tuyen Quang'), ('Vinh Long'), ('Vinh Phuc'),
  ('Yen Bai')
) AS divisions(division_name)
WHERE c.name = 'Vietnam'
ON CONFLICT (country_id, slug) DO NOTHING;
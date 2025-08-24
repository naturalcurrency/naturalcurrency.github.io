-- Seed remaining Asia/Emerging detailed divisions, then add a fallback 'National' for any country still missing

-- Helper slug sanitation: remove apostrophes then collapse non-alphanumerics to hyphens
-- Bhutan (20 dzongkhags)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Bumthang'), ('Chukha'), ('Dagana'), ('Gasa'), ('Haa'), ('Lhuntse'), ('Mongar'), ('Paro'),
  ('Pema Gatshel'), ('Punakha'), ('Samdrup Jongkhar'), ('Samtse'), ('Sarpang'), ('Thimphu'),
  ('Trashigang'), ('Trashiyangtse'), ('Trongsa'), ('Tsirang'), ('Wangdue Phodrang'), ('Zhemgang')
) AS divisions(division_name)
WHERE c.name = 'Bhutan'
ON CONFLICT (country_id, slug) DO NOTHING;

-- East Timor (Timor-Leste) (13 municipalities)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Aileu'), ('Ainaro'), ('Baucau'), ('Bobonaro'), ('Cova Lima'), ('Dili'), ('Ermera'),
  ('Lautem'), ('Liquica'), ('Manatuto'), ('Manufahi'), ('Oecusse'), ('Viqueque')
) AS divisions(division_name)
WHERE c.name = 'East Timor (Timor-Leste)'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Philippines (82 provinces + Metro Manila)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name,
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
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
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
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
  LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g')))
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

-- Finally, ensure no country is left without at least one division: add a single 'National' placeholder wherever zero remain
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, 'National', 'national'
FROM snapshot_countries c
LEFT JOIN snapshot_administrative_divisions d ON d.country_id = c.id
GROUP BY c.id
HAVING COUNT(d.id) = 0;
-- Continue adding administrative divisions for remaining major Asia Pacific countries

-- China (33 provinces/regions/municipalities)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug) 
SELECT c.id, division_name, LOWER(REPLACE(REPLACE(division_name, ' ', '-'), '''', ''))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Anhui'), ('Beijing'), ('Chongqing'), ('Fujian'), ('Gansu'), ('Guangdong'), 
  ('Guangxi'), ('Guizhou'), ('Hainan'), ('Hebei'), ('Heilongjiang'), ('Henan'), 
  ('Hong Kong'), ('Hubei'), ('Hunan'), ('Inner Mongolia'), ('Jiangsu'), ('Jiangxi'), 
  ('Jilin'), ('Liaoning'), ('Macau'), ('Ningxia'), ('Qinghai'), ('Shaanxi'), 
  ('Shandong'), ('Shanghai'), ('Shanxi'), ('Sichuan'), ('Tianjin'), ('Tibet'), 
  ('Xinjiang'), ('Yunnan'), ('Zhejiang')
) AS divisions(division_name)
WHERE c.name = 'China'
ON CONFLICT (country_id, slug) DO NOTHING;

-- India (36 states and union territories)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug) 
SELECT c.id, division_name, LOWER(REPLACE(REPLACE(division_name, ' ', '-'), '''', ''))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Andhra Pradesh'), ('Arunachal Pradesh'), ('Assam'), ('Bihar'), ('Chhattisgarh'), 
  ('Goa'), ('Gujarat'), ('Haryana'), ('Himachal Pradesh'), ('Jharkhand'), ('Karnataka'), 
  ('Kerala'), ('Madhya Pradesh'), ('Maharashtra'), ('Manipur'), ('Meghalaya'), ('Mizoram'), 
  ('Nagaland'), ('Odisha'), ('Punjab'), ('Rajasthan'), ('Sikkim'), ('Tamil Nadu'), 
  ('Telangana'), ('Tripura'), ('Uttar Pradesh'), ('Uttarakhand'), ('West Bengal'), 
  ('Andaman and Nicobar Islands'), ('Chandigarh'), ('Dadra and Nagar Haveli and Daman and Diu'), 
  ('Delhi'), ('Jammu and Kashmir'), ('Ladakh'), ('Lakshadweep'), ('Puducherry')
) AS divisions(division_name)
WHERE c.name = 'India'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Indonesia (34 provinces)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug) 
SELECT c.id, division_name, LOWER(REPLACE(REPLACE(division_name, ' ', '-'), '''', ''))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Aceh'), ('Bali'), ('Bangka Belitung'), ('Banten'), ('Bengkulu'), ('Central Java'), 
  ('Central Kalimantan'), ('Central Sulawesi'), ('East Java'), ('East Kalimantan'), 
  ('East Nusa Tenggara'), ('Gorontalo'), ('Jakarta'), ('Jambi'), ('Lampung'), ('Maluku'), 
  ('North Kalimantan'), ('North Maluku'), ('North Sulawesi'), ('North Sumatra'), ('Papua'), 
  ('Riau'), ('Riau Islands'), ('South Kalimantan'), ('South Sulawesi'), ('South Sumatra'), 
  ('Southeast Sulawesi'), ('West Java'), ('West Kalimantan'), ('West Nusa Tenggara'), 
  ('West Papua'), ('West Sulawesi'), ('West Sumatra'), ('Yogyakarta')
) AS divisions(division_name)
WHERE c.name = 'Indonesia'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Afghanistan (34 provinces)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug) 
SELECT c.id, division_name, LOWER(REPLACE(REPLACE(division_name, ' ', '-'), '''', ''))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Badakhshan'), ('Badghis'), ('Baghlan'), ('Balkh'), ('Bamyan'), ('Daykundi'), 
  ('Farah'), ('Faryab'), ('Ghazni'), ('Ghor'), ('Helmand'), ('Herat'), ('Jowzjan'), 
  ('Kabul'), ('Kandahar'), ('Kapisa'), ('Khost'), ('Kunar'), ('Kunduz'), ('Laghman'), 
  ('Logar'), ('Nangarhar'), ('Nimruz'), ('Nuristan'), ('Paktia'), ('Paktika'), 
  ('Panjshir'), ('Parwan'), ('Samangan'), ('Sar-e Pol'), ('Takhar'), ('Uruzgan'), 
  ('Wardak'), ('Zabul')
) AS divisions(division_name)
WHERE c.name = 'Afghanistan'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Myanmar (15 states and regions)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug) 
SELECT c.id, division_name, LOWER(REPLACE(REPLACE(division_name, ' ', '-'), '''', ''))
FROM snapshot_countries c
CROSS JOIN (VALUES
  ('Ayeyarwady'), ('Bago'), ('Chin'), ('Kachin'), ('Kayah'), ('Kayin'), ('Magway'), 
  ('Mandalay'), ('Mon'), ('Naypyidaw'), ('Rakhine'), ('Sagaing'), ('Shan'), 
  ('Tanintharyi'), ('Yangon')
) AS divisions(division_name)
WHERE c.name = 'Myanmar'
ON CONFLICT (country_id, slug) DO NOTHING;
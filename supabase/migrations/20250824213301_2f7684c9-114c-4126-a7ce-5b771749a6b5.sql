-- Clear existing administrative divisions and insert comprehensive list for Asia Pacific

-- Clear existing data
DELETE FROM snapshot_administrative_divisions;

-- Insert administrative divisions for Asia Pacific region

-- Australia
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT 'New South Wales', 'new-south-wales', id FROM snapshot_countries WHERE slug = 'australia'
UNION ALL
SELECT 'Queensland', 'queensland', id FROM snapshot_countries WHERE slug = 'australia'
UNION ALL
SELECT 'South Australia', 'south-australia', id FROM snapshot_countries WHERE slug = 'australia'
UNION ALL
SELECT 'Tasmania', 'tasmania', id FROM snapshot_countries WHERE slug = 'australia'
UNION ALL
SELECT 'Victoria', 'victoria', id FROM snapshot_countries WHERE slug = 'australia'
UNION ALL
SELECT 'Western Australia', 'western-australia', id FROM snapshot_countries WHERE slug = 'australia'
UNION ALL
SELECT 'Australian Capital Territory', 'australian-capital-territory', id FROM snapshot_countries WHERE slug = 'australia'
UNION ALL
SELECT 'Northern Territory', 'northern-territory', id FROM snapshot_countries WHERE slug = 'australia';

-- Brunei
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT 'Belait', 'belait', id FROM snapshot_countries WHERE slug = 'brunei'
UNION ALL
SELECT 'Brunei-Muara', 'brunei-muara', id FROM snapshot_countries WHERE slug = 'brunei'
UNION ALL
SELECT 'Temburong', 'temburong', id FROM snapshot_countries WHERE slug = 'brunei'
UNION ALL
SELECT 'Tutong', 'tutong', id FROM snapshot_countries WHERE slug = 'brunei';

-- Cook Islands
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT 'Aitutaki', 'aitutaki', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Atiu', 'atiu', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Mangaia', 'mangaia', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Mauke', 'mauke', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Mitiaro', 'mitiaro', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Palmerston', 'palmerston', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Penrhyn', 'penrhyn', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Pukapuka', 'pukapuka', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Rakahanga', 'rakahanga', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Rarotonga', 'rarotonga', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Manihiki', 'manihiki', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Nassau', 'nassau-ci', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Suwarrow', 'suwarrow', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Takutea', 'takutea', id FROM snapshot_countries WHERE slug = 'cook-islands'
UNION ALL
SELECT 'Manuae', 'manuae', id FROM snapshot_countries WHERE slug = 'cook-islands';

-- Fiji
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT 'Central', 'central-fiji', id FROM snapshot_countries WHERE slug = 'fiji'
UNION ALL
SELECT 'Eastern', 'eastern-fiji', id FROM snapshot_countries WHERE slug = 'fiji'
UNION ALL
SELECT 'Northern', 'northern-fiji', id FROM snapshot_countries WHERE slug = 'fiji'
UNION ALL
SELECT 'Western', 'western-fiji', id FROM snapshot_countries WHERE slug = 'fiji'
UNION ALL
SELECT 'Rotuma', 'rotuma', id FROM snapshot_countries WHERE slug = 'fiji';

-- French Polynesia
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT 'Windward Islands', 'windward-islands', id FROM snapshot_countries WHERE slug = 'french-polynesia'
UNION ALL
SELECT 'Leeward Islands', 'leeward-islands', id FROM snapshot_countries WHERE slug = 'french-polynesia'
UNION ALL
SELECT 'Marquesas Islands', 'marquesas-islands', id FROM snapshot_countries WHERE slug = 'french-polynesia'
UNION ALL
SELECT 'Austral Islands', 'austral-islands', id FROM snapshot_countries WHERE slug = 'french-polynesia'
UNION ALL
SELECT 'Tuamotu-Gambier', 'tuamotu-gambier', id FROM snapshot_countries WHERE slug = 'french-polynesia';

-- Hong Kong
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT 'Central and Western', 'central-and-western', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Eastern', 'eastern-hk', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Southern', 'southern-hk', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Yau Tsim Mong', 'yau-tsim-mong', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Sham Shui Po', 'sham-shui-po', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Kowloon City', 'kowloon-city', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Wong Tai Sin', 'wong-tai-sin', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Kwun Tong', 'kwun-tong', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Kwai Tsing', 'kwai-tsing', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Tsuen Wan', 'tsuen-wan', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Tuen Mun', 'tuen-mun', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Yuen Long', 'yuen-long', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'North', 'north-hk', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Tai Po', 'tai-po', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Sha Tin', 'sha-tin', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Sai Kung', 'sai-kung', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Islands', 'islands-hk', id FROM snapshot_countries WHERE slug = 'hong-kong'
UNION ALL
SELECT 'Wan Chai', 'wan-chai', id FROM snapshot_countries WHERE slug = 'hong-kong';
-- First, clear existing data to avoid conflicts
TRUNCATE TABLE snapshot_cities, snapshot_countries, snapshot_geographic_regions CASCADE;

-- Insert geographic regions
INSERT INTO snapshot_geographic_regions (name, slug) VALUES 
('Asia Pacific', 'asia-pacific'),
('Emerging Asia', 'emerging-asia'),
('Europe', 'europe'),
('Latin America', 'latin-america'),
('Middle East & Africa', 'middle-east-africa'),
('North America', 'north-america');

-- Insert countries for Asia Pacific
INSERT INTO snapshot_countries (name, slug, region_id) 
SELECT country_name, LOWER(REPLACE(REPLACE(REPLACE(country_name, ' ', '-'), '(', ''), ')', '')), regions.id
FROM (VALUES 
  ('Australia'), ('Brunei'), ('Cook Islands'), ('Fiji'), ('French Polynesia'), 
  ('Hong Kong'), ('Japan'), ('Kiribati'), ('Macau'), ('Marshall Islands'), 
  ('Micronesia'), ('Nauru'), ('New Caledonia'), ('New Zealand'), ('Palau'), 
  ('Papua New Guinea'), ('Samoa'), ('Singapore'), ('Solomon Islands'), 
  ('South Korea'), ('Taiwan'), ('Tonga'), ('Tuvalu'), ('Vanuatu')
) AS countries(country_name)
CROSS JOIN snapshot_geographic_regions regions
WHERE regions.slug = 'asia-pacific';

-- Insert countries for Emerging Asia
INSERT INTO snapshot_countries (name, slug, region_id)
SELECT country_name, LOWER(REPLACE(REPLACE(REPLACE(country_name, ' ', '-'), '(', ''), ')', '')), regions.id
FROM (VALUES
  ('Afghanistan'), ('Bangladesh'), ('Bhutan'), ('Cambodia'), ('China'), 
  ('East Timor (Timor-Leste)'), ('India'), ('Indonesia'), ('Kazakhstan'), 
  ('Kyrgyzstan'), ('Laos'), ('Malaysia'), ('Maldives'), ('Mongolia'), 
  ('Myanmar'), ('Nepal'), ('North Korea'), ('Pakistan'), ('Philippines'), 
  ('Sri Lanka'), ('Tajikistan'), ('Thailand'), ('Turkmenistan'), 
  ('Uzbekistan'), ('Vietnam')
) AS countries(country_name)
CROSS JOIN snapshot_geographic_regions regions
WHERE regions.slug = 'emerging-asia';

-- Insert countries for Europe
INSERT INTO snapshot_countries (name, slug, region_id)
SELECT country_name, LOWER(REPLACE(REPLACE(REPLACE(country_name, ' ', '-'), '(', ''), ')', '')), regions.id
FROM (VALUES
  ('Albania'), ('Andorra'), ('Armenia'), ('Austria'), ('Azerbaijan'), 
  ('Belarus'), ('Belgium'), ('Bosnia and Herzegovina'), ('Bulgaria'), 
  ('Croatia'), ('Cyprus'), ('Czech Republic'), ('Denmark'), ('Estonia'), 
  ('Finland'), ('France'), ('Georgia'), ('Germany'), ('Greece'), 
  ('Hungary'), ('Iceland'), ('Ireland'), ('Italy'), ('Kosovo'), 
  ('Latvia'), ('Liechtenstein'), ('Lithuania'), ('Luxembourg'), ('Malta'), 
  ('Moldova'), ('Monaco'), ('Montenegro'), ('Netherlands'), ('North Macedonia'), 
  ('Norway'), ('Poland'), ('Portugal'), ('Romania'), ('Russia'), 
  ('San Marino'), ('Serbia'), ('Slovakia'), ('Slovenia'), ('Spain'), 
  ('Sweden'), ('Switzerland'), ('Turkey'), ('Ukraine'), ('United Kingdom'), 
  ('Vatican City (Holy See)')
) AS countries(country_name)
CROSS JOIN snapshot_geographic_regions regions
WHERE regions.slug = 'europe';

-- Insert countries for Latin America
INSERT INTO snapshot_countries (name, slug, region_id)
SELECT country_name, LOWER(REPLACE(REPLACE(REPLACE(country_name, ' ', '-'), '(', ''), ')', '')), regions.id
FROM (VALUES
  ('Antigua and Barbuda'), ('Anguilla'), ('Argentina'), ('Aruba'), 
  ('Bahamas'), ('Barbados'), ('Belize'), ('Bermuda'), ('Bolivia'), 
  ('Brazil'), ('Cayman Islands'), ('Chile'), ('Colombia'), ('Costa Rica'), 
  ('Cuba'), ('Curaçao'), ('Dominica'), ('Dominican Republic'), ('Ecuador'), 
  ('El Salvador'), ('Grenada'), ('Guatemala'), ('Guyana'), ('Haiti'), 
  ('Honduras'), ('Jamaica'), ('Montserrat'), ('Nicaragua'), ('Panama'), 
  ('Paraguay'), ('Peru'), ('Puerto Rico'), ('Saint Kitts and Nevis'), 
  ('Saint Lucia'), ('Saint Vincent and the Grenadines'), ('Sint Maarten'), 
  ('Suriname'), ('Trinidad and Tobago'), ('Turks and Caicos Islands'), 
  ('Uruguay'), ('Venezuela')
) AS countries(country_name)
CROSS JOIN snapshot_geographic_regions regions
WHERE regions.slug = 'latin-america';

-- Insert countries for Middle East & Africa
INSERT INTO snapshot_countries (name, slug, region_id)
SELECT country_name, LOWER(REPLACE(REPLACE(REPLACE(country_name, ' ', '-'), '(', ''), ')', '')), regions.id
FROM (VALUES
  ('Algeria'), ('Angola'), ('Bahrain'), ('Benin'), ('Botswana'), 
  ('Burkina Faso'), ('Burundi'), ('Cameroon'), ('Cape Verde (Cabo Verde)'), 
  ('Central African Republic'), ('Chad'), ('Comoros'), ('Congo'), 
  ('Djibouti'), ('DR Congo'), ('Egypt'), ('Equatorial Guinea'), ('Eritrea'), 
  ('Eswatini'), ('Ethiopia'), ('Gabon'), ('Gambia'), ('Ghana'), 
  ('Guinea'), ('Guinea-Bissau'), ('Iran'), ('Iraq'), ('Israel'), 
  ('Ivory Coast (Côte d''Ivoire)'), ('Jordan'), ('Kenya'), ('Kuwait'), 
  ('Lebanon'), ('Lesotho'), ('Liberia'), ('Libya'), ('Madagascar'), 
  ('Malawi'), ('Mali'), ('Mauritania'), ('Mauritius'), ('Morocco'), 
  ('Mozambique'), ('Namibia'), ('Niger'), ('Nigeria'), ('Oman'), 
  ('Palestine'), ('Qatar'), ('Rwanda'), ('São Tomé and Príncipe'), 
  ('Saudi Arabia'), ('Senegal'), ('Seychelles'), ('Sierra Leone'), 
  ('Somalia'), ('South Africa'), ('South Sudan'), ('Sudan'), ('Syria'), 
  ('Tanzania'), ('Togo'), ('Tunisia'), ('UAE (United Arab Emirates)'), 
  ('Uganda'), ('Yemen'), ('Zambia'), ('Zimbabwe')
) AS countries(country_name)
CROSS JOIN snapshot_geographic_regions regions
WHERE regions.slug = 'middle-east-africa';

-- Insert countries for North America
INSERT INTO snapshot_countries (name, slug, region_id)
SELECT country_name, LOWER(REPLACE(REPLACE(REPLACE(country_name, ' ', '-'), '(', ''), ')', '')), regions.id
FROM (VALUES
  ('Canada'), ('Greenland'), ('Mexico'), ('United States')
) AS countries(country_name)
CROSS JOIN snapshot_geographic_regions regions
WHERE regions.slug = 'north-america';

-- Add some sample sectors
INSERT INTO snapshot_sectors (name, slug) VALUES
('Energy', 'energy'),
('Water', 'water'),
('Minerals', 'minerals'),
('Agriculture', 'agriculture'),
('Forestry', 'forestry');

-- Add some sample sub-sectors
INSERT INTO snapshot_sub_sectors (name, slug, sector_id)
SELECT sub_sector_name, LOWER(REPLACE(sub_sector_name, ' ', '-')), sectors.id
FROM (VALUES
  ('Renewable Energy', 'Energy'),
  ('Oil & Gas', 'Energy'),
  ('Nuclear', 'Energy'),
  ('Freshwater Rights', 'Water'),
  ('Wastewater Treatment', 'Water'),
  ('Desalination', 'Water'),
  ('Critical Minerals', 'Minerals'),
  ('Precious Metals', 'Minerals'),
  ('Base Metals', 'Minerals'),
  ('Sustainable Farming', 'Agriculture'),
  ('Livestock', 'Agriculture'),
  ('Carbon Sequestration', 'Forestry'),
  ('Timber', 'Forestry')
) AS sub_sectors(sub_sector_name, sector_name)
JOIN snapshot_sectors sectors ON sectors.name = sub_sectors.sector_name;
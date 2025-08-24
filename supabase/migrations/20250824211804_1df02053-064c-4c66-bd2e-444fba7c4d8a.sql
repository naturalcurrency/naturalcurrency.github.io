-- Insert administrative divisions (states/provinces) with sample data for key countries
-- This is a large dataset, so I'll include the most important countries and major administrative divisions

WITH country_ids AS (
  SELECT id, name FROM snapshot_countries
)

INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT division, LOWER(REPLACE(REPLACE(REPLACE(division, ' ', '-'), '(', ''), ')', '')), country_ids.id
FROM (VALUES
  -- Australia
  ('New South Wales', 'Australia'),
  ('Queensland', 'Australia'),
  ('South Australia', 'Australia'),
  ('Tasmania', 'Australia'),
  ('Victoria', 'Australia'),
  ('Western Australia', 'Australia'),
  ('Australian Capital Territory', 'Australia'),
  ('Northern Territory', 'Australia'),
  
  -- Japan (sample prefectures)
  ('Tokyo', 'Japan'),
  ('Osaka', 'Japan'),
  ('Kanagawa', 'Japan'),
  ('Aichi', 'Japan'),
  ('Hokkaido', 'Japan'),
  ('Fukuoka', 'Japan'),
  ('Hyogo', 'Japan'),
  ('Saitama', 'Japan'),
  
  -- China (sample provinces)
  ('Beijing', 'China'),
  ('Shanghai', 'China'),
  ('Guangdong', 'China'),
  ('Jiangsu', 'China'),
  ('Zhejiang', 'China'),
  ('Shandong', 'China'),
  ('Sichuan', 'China'),
  ('Hubei', 'China'),
  
  -- India (sample states)
  ('Maharashtra', 'India'),
  ('Gujarat', 'India'),
  ('Tamil Nadu', 'India'),
  ('Karnataka', 'India'),
  ('Uttar Pradesh', 'India'),
  ('West Bengal', 'India'),
  ('Rajasthan', 'India'),
  ('Andhra Pradesh', 'India'),
  
  -- United States (sample states)
  ('California', 'United States'),
  ('Texas', 'United States'),
  ('New York', 'United States'),
  ('Florida', 'United States'),
  ('Illinois', 'United States'),
  ('Pennsylvania', 'United States'),
  ('Ohio', 'United States'),
  ('Georgia', 'United States'),
  
  -- Canada (provinces)
  ('Ontario', 'Canada'),
  ('Quebec', 'Canada'),
  ('British Columbia', 'Canada'),
  ('Alberta', 'Canada'),
  ('Manitoba', 'Canada'),
  ('Saskatchewan', 'Canada'),
  ('Nova Scotia', 'Canada'),
  ('New Brunswick', 'Canada'),
  ('Newfoundland and Labrador', 'Canada'),
  ('Prince Edward Island', 'Canada'),
  
  -- United Kingdom
  ('England', 'United Kingdom'),
  ('Scotland', 'United Kingdom'),
  ('Wales', 'United Kingdom'),
  ('Northern Ireland', 'United Kingdom'),
  
  -- Germany (sample states)
  ('Bavaria', 'Germany'),
  ('North Rhine-Westphalia', 'Germany'),
  ('Baden-Württemberg', 'Germany'),
  ('Lower Saxony', 'Germany'),
  ('Hesse', 'Germany'),
  ('Saxony', 'Germany'),
  ('Rhineland-Palatinate', 'Germany'),
  ('Berlin', 'Germany'),
  
  -- France (sample regions)
  ('Île-de-France', 'France'),
  ('Auvergne-Rhône-Alpes', 'France'),
  ('Nouvelle-Aquitaine', 'France'),
  ('Occitanie', 'France'),
  ('Hauts-de-France', 'France'),
  ('Grand Est', 'France'),
  ('Provence-Alpes-Côte d''Azur', 'France'),
  ('Pays de la Loire', 'France'),
  
  -- Brazil (sample states)
  ('São Paulo', 'Brazil'),
  ('Rio de Janeiro', 'Brazil'),
  ('Minas Gerais', 'Brazil'),
  ('Bahia', 'Brazil'),
  ('Paraná', 'Brazil'),
  ('Rio Grande do Sul', 'Brazil'),
  ('Pernambuco', 'Brazil'),
  ('Ceará', 'Brazil'),
  
  -- Mexico (sample states)
  ('Mexico City', 'Mexico'),
  ('Jalisco', 'Mexico'),
  ('Nuevo León', 'Mexico'),
  ('Puebla', 'Mexico'),
  ('Guanajuato', 'Mexico'),
  ('Chihuahua', 'Mexico'),
  ('Michoacán', 'Mexico'),
  ('Oaxaca', 'Mexico'),
  
  -- South Africa (provinces)
  ('Gauteng', 'South Africa'),
  ('KwaZulu-Natal', 'South Africa'),
  ('Western Cape', 'South Africa'),
  ('Eastern Cape', 'South Africa'),
  ('Limpopo', 'South Africa'),
  ('Mpumalanga', 'South Africa'),
  ('North West', 'South Africa'),
  ('Free State', 'South Africa'),
  ('Northern Cape', 'South Africa'),
  
  -- Russia (sample regions)
  ('Moscow', 'Russia'),
  ('Moscow City', 'Russia'),
  ('Saint Petersburg', 'Russia'),
  ('Sverdlovsk', 'Russia'),
  ('Krasnodar', 'Russia'),
  ('Tatarstan', 'Russia'),
  ('Novosibirsk', 'Russia'),
  ('Rostov', 'Russia')
) AS divisions(division, country)
JOIN country_ids ON country_ids.name = divisions.country;
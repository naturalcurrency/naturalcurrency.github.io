-- Continue adding administrative divisions - Europe batch

-- Japan - Add all prefectures
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'japan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Aichi','Akita','Aomori','Chiba','Ehime','Fukui','Fukuoka','Fukushima','Gifu','Gunma','Hiroshima','Hokkaido','Hyogo','Ibaraki','Ishikawa','Iwate','Kagawa','Kagoshima','Kanagawa','Kochi','Kumamoto','Kyoto','Mie','Miyagi','Miyazaki','Nagano','Nagasaki','Nara','Niigata','Oita','Okayama','Okinawa','Osaka','Saga','Saitama','Shiga','Shimane','Shizuoka','Tochigi','Tokushima','Tokyo','Tottori','Toyama','Wakayama','Yamagata','Yamaguchi','Yamanashi']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- New Zealand  
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'new-zealand' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Auckland','Bay of Plenty','Canterbury','Gisborne','Hawke''s Bay','Manawatu-Wanganui','Marlborough','Nelson','Northland','Otago','Southland','Taranaki','Tasman','Waikato','Wellington','West Coast','Chatham Islands']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- South Korea
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'south-korea' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Seoul','Busan','Incheon','Daegu','Daejeon','Gwangju','Ulsan','Sejong','Gyeonggi','Gangwon','North Chungcheong','South Chungcheong','North Jeolla','South Jeolla','North Gyeongsang','South Gyeongsang','Jeju']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Taiwan
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'taiwan' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Taipei','New Taipei','Taoyuan','Taichung','Tainan','Kaohsiung','Keelung','Hsinchu','Hsinchu City','Chiayi','Chiayi City','Changhua','Nantou','Yunlin','Pingtung','Taitung','Hualien','Yilan','Penghu','Kinmen','Lienchiang','Miaoli']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- EUROPE REGION

-- United Kingdom
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'united-kingdom' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['England','Scotland','Wales','Northern Ireland']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Germany 
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'germany' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Baden-Württemberg','Bavaria','Berlin','Brandenburg','Bremen','Hamburg','Hesse','Lower Saxony','Mecklenburg-Vorpommern','North Rhine-Westphalia','Rhineland-Palatinate','Saarland','Saxony','Saxony-Anhalt','Schleswig-Holstein','Thuringia']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- France
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'france' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Auvergne-Rhône-Alpes','Bourgogne-Franche-Comté','Brittany','Centre-Val de Loire','Corsica','Grand Est','Hauts-de-France','Île-de-France','Normandy','Nouvelle-Aquitaine','Occitanie','Pays de la Loire','Provence-Alpes-Côte d''Azur','Guadeloupe','Martinique','French Guiana','Réunion','Mayotte']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Italy
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'italy' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Abruzzo','Aosta Valley','Apulia','Basilicata','Calabria','Campania','Emilia-Romagna','Friuli-Venezia Giulia','Lazio','Liguria','Lombardy','Marche','Molise','Piedmont','Sardinia','Sicily','Trentino-Alto Adige','Tuscany','Umbria','Veneto']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Spain
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'spain' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Andalusia','Aragon','Asturias','Balearic Islands','Basque Country','Canary Islands','Cantabria','Castile and León','Castilla-La Mancha','Catalonia','Extremadura','Galicia','La Rioja','Madrid','Murcia','Navarre','Valencian Community','Ceuta','Melilla']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Netherlands
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'netherlands' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Drenthe','Flevoland','Friesland','Gelderland','Groningen','Limburg','North Brabant','North Holland','Overijssel','South Holland','Utrecht','Zeeland','Bonaire','Saba','Sint Eustatius']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Poland  
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'poland' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Greater Poland','Kuyavian-Pomeranian','Lesser Poland','Łódź','Lower Silesian','Lublin','Lubusz','Masovian','Opole','Podkarpackie','Podlaskie','Pomeranian','Silesian','Świętokrzyskie','Warmian-Masurian','West Pomeranian']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Belgium
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'belgium' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Brussels-Capital','Flanders','Wallonia']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Switzerland
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'switzerland' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Aargau','Appenzell Ausserrhoden','Appenzell Innerrhoden','Basel-Landschaft','Basel-Stadt','Bern','Fribourg','Geneva','Glarus','Grisons','Jura','Lucerne','Neuchâtel','Nidwalden','Obwalden','Schaffhausen','Schwyz','Solothurn','St. Gallen','Thurgau','Ticino','Uri','Valais','Vaud','Zug','Zurich']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Austria
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'austria' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Burgenland','Carinthia','Lower Austria','Upper Austria','Salzburg','Styria','Tyrol','Vorarlberg','Vienna']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Sweden
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'sweden' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Blekinge','Dalarna','Gävleborg','Gotland','Halland','Jämtland','Jönköping','Kalmar','Kronoberg','Norrbotten','Örebro','Östergötland','Skåne','Södermanland','Stockholm','Uppsala','Värmland','Västerbotten','Västernorrland','Västmanland','Västra Götaland']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Norway
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'norway' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Agder','Innlandet','Møre og Romsdal','Nordland','Oslo','Rogaland','Troms og Finnmark','Trøndelag','Vestfold og Telemark','Vestland','Viken']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Denmark
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'denmark' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Capital Region','Central Denmark','North Denmark','Zealand','Southern Denmark']) d
ON CONFLICT (country_id, slug) DO NOTHING;
-- Continue with major countries - Part 2

-- EUROPE REGION

-- United Kingdom (with constituent countries and subdivisions)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'United Kingdom' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'&','and'),'''','')), c.id
FROM c, UNNEST(ARRAY['England','Scotland','Wales','Northern Ireland']) d;

-- Germany (all states)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Germany' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'ü','u')), c.id
FROM c, UNNEST(ARRAY['Baden-Württemberg','Bavaria','Berlin','Brandenburg','Bremen','Hamburg','Hesse','Lower Saxony','Mecklenburg-Vorpommern','North Rhine-Westphalia','Rhineland-Palatinate','Saarland','Saxony','Saxony-Anhalt','Schleswig-Holstein','Thuringia']) d;

-- France (all regions)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'France' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'è','e'),'é','e')), c.id
FROM c, UNNEST(ARRAY['Auvergne-Rhône-Alpes','Bourgogne-Franche-Comté','Brittany','Centre-Val de Loire','Corsica','Grand Est','Hauts-de-France','Île-de-France','Normandy','Nouvelle-Aquitaine','Occitanie','Pays de la Loire','Provence-Alpes-Côte d''Azur','Guadeloupe','Martinique','French Guiana','Réunion','Mayotte']) d;

-- Italy (all regions)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Italy' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'à','a')), c.id
FROM c, UNNEST(ARRAY['Abruzzo','Aosta Valley','Apulia','Basilicata','Calabria','Campania','Emilia-Romagna','Friuli-Venezia Giulia','Lazio','Liguria','Lombardy','Marche','Molise','Piedmont','Sardinia','Sicily','Trentino-Alto Adige','Tuscany','Umbria','Veneto']) d;

-- Spain (all autonomous communities)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Spain' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'ó','o'),'ñ','n')), c.id
FROM c, UNNEST(ARRAY['Andalusia','Aragon','Asturias','Balearic Islands','Basque Country','Canary Islands','Cantabria','Castile and León','Castilla-La Mancha','Catalonia','Extremadura','Galicia','La Rioja','Madrid','Murcia','Navarre','Valencian Community','Ceuta','Melilla']) d;

-- Russia (major federal subjects)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Russia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'''','')), c.id
FROM c, UNNEST(ARRAY['Adygea','Altai Krai','Altai Republic','Amur','Arkhangelsk','Astrakhan','Bashkortostan','Belgorod','Bryansk','Buryatia','Chechnya','Chelyabinsk','Chukotka','Chuvashia','Crimea','Dagestan','Donetsk','Ingushetia','Irkutsk','Ivanovo','Jewish Autonomous Oblast','Kabardino-Balkaria','Kaliningrad','Kalmykia','Kaluga','Kamchatka','Karachay-Cherkessia','Karelia','Kemerovo','Khabarovsk','Khakassia','Khanty-Mansi','Kirov','Komi','Kostroma','Krasnodar','Krasnoyarsk','Kurgan','Kursk','Leningrad','Lipetsk','Lugansk','Magadan','Mari El','Mordovia','Moscow','Moscow City','Murmansk','Nenets','Nizhny Novgorod','North Ossetia-Alania','Novgorod','Novosibirsk','Omsk','Orenburg','Oryol','Penza','Perm','Primorsky','Pskov','Rostov','Ryazan','Sakha','Sakhalin','Samara','Saratov','Sevastopol','Smolensk','Stavropol','Sverdlovsk','Tambov','Tatarstan','Tomsk','Tula','Tuva','Tver','Tyumen','Udmurtia','Ulyanovsk','Vladimir','Volgograd','Vologda','Voronezh','Yamalo-Nenets','Yaroslavl','Zabaykalsky']) d;

-- NORTH AMERICA REGION

-- United States (sample states)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'United States' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Alabama','Alaska','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','Florida','Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming','District of Columbia']) d;

-- Canada (all provinces and territories)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Canada' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(d,' ', '-'),'&','and')), c.id
FROM c, UNNEST(ARRAY['Ontario','Quebec','British Columbia','Alberta','Manitoba','Saskatchewan','Nova Scotia','New Brunswick','Newfoundland and Labrador','Prince Edward Island','Northwest Territories','Nunavut','Yukon']) d;

-- Mexico (sample states)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Mexico' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'ó','o'),'ñ','n')), c.id
FROM c, UNNEST(ARRAY['Aguascalientes','Baja California','Baja California Sur','Campeche','Chiapas','Chihuahua','Coahuila','Colima','Durango','Guanajuato','Guerrero','Hidalgo','Jalisco','Mexico','Michoacán','Morelos','Nayarit','Nuevo León','Oaxaca','Puebla','Querétaro','Quintana Roo','San Luis Potosí','Sinaloa','Sonora','Tabasco','Tamaulipas','Tlaxcala','Veracruz','Yucatán','Zacatecas','Mexico City']) d;

-- LATIN AMERICA REGION

-- Brazil (all states + DF)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Brazil' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'ã','a'),'í','i')), c.id
FROM c, UNNEST(ARRAY['Acre','Alagoas','Amapá','Amazonas','Bahia','Ceará','Espírito Santo','Goiás','Maranhão','Mato Grosso','Mato Grosso do Sul','Minas Gerais','Pará','Paraíba','Paraná','Pernambuco','Piauí','Rio de Janeiro','Rio Grande do Norte','Rio Grande do Sul','Rondônia','Roraima','Santa Catarina','São Paulo','Sergipe','Tocantins','Brasília']) d;

-- Argentina (all provinces)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Argentina' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'ó','o'),'í','i')), c.id
FROM c, UNNEST(ARRAY['Buenos Aires','Buenos Aires City','Catamarca','Chaco','Chubut','Córdoba','Corrientes','Entre Ríos','Formosa','Jujuy','La Pampa','La Rioja','Mendoza','Misiones','Neuquén','Río Negro','Salta','San Juan','San Luis','Santa Cruz','Santa Fe','Santiago del Estero','Tierra del Fuego','Tucumán']) d;

-- Chile (all regions)
WITH c AS (SELECT id FROM snapshot_countries WHERE name = 'Chile' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(REPLACE(REPLACE(d,' ', '-'),'í','i'),'ñ','n')), c.id
FROM c, UNNEST(ARRAY['Antofagasta','Araucanía','Arica y Parinacota','Atacama','Aysén','Biobío','Coquimbo','Los Lagos','Los Ríos','Magallanes','Maule','Ñuble','O''Higgins','Santiago Metropolitan','Tarapacá','Valparaíso']) d;
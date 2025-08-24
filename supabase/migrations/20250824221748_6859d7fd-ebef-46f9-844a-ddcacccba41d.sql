-- Continue Batch 1: Middle East & Africa — seed more countries with country-prefixed slugs
-- Remove placeholder entries (safe to re-run)
DELETE FROM snapshot_administrative_divisions 
WHERE country_id IN (
  SELECT c.id FROM snapshot_countries c 
  JOIN snapshot_geographic_regions r ON r.id = c.region_id 
  WHERE r.name = 'Middle East & Africa'
) AND (name = 'National' OR slug LIKE '%-national');

-- Cameroon (10 regions)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Adamawa'), ('Centre'), ('East'), ('Far North'), ('Littoral'), ('North'), ('North-West'), ('South'), ('South-West'), ('West')
) AS divisions(division_name)
WHERE c.name = 'Cameroon'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Cape Verde (Cabo Verde) (22 municipalities)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Boa Vista'), ('Brava'), ('Maio'), ('Mosteiros'), ('Paul'), ('Porto Novo'), ('Praia'), ('Ribeira Brava'), ('Ribeira Grande'), ('Ribeira Grande de Santiago'),
 ('Sal'), ('Santa Catarina'), ('Santa Catarina do Fogo'), ('Santa Cruz'), ('São Domingos'), ('São Filipe'), ('São Lourenço dos Órgãos'), ('São Miguel'),
 ('São Salvador do Mundo'), ('São Vicente'), ('Tarrafal'), ('Tarrafal de São Nicolau')
) AS divisions(division_name)
WHERE c.name = 'Cape Verde (Cabo Verde)'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Central African Republic (16 prefectures + capital)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Bamingui-Bangoran'), ('Bangui'), ('Basse-Kotto'), ('Haute-Kotto'), ('Haut-Mbomou'), ('Kémo'), ('Lobaye'), ('Mambéré-Kadéï'), ('Mbomou'),
 ('Nana-Grébizi'), ('Nana-Mambéré'), ('Ombella-M’Poko'), ('Ouaka'), ('Ouham'), ('Ouham-Pendé'), ('Sangha-Mbaéré'), ('Vakaga')
) AS divisions(division_name)
WHERE c.name = 'Central African Republic'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Chad (23 regions incl. capital)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Barh El Gazel'), ('Batha'), ('Borkou'), ('Chari-Baguirmi'), ('Ennedi-Est'), ('Ennedi-Ouest'), ('Guéra'), ('Hadjer-Lamis'), ('Kanem'), ('Lac'),
 ('Logone Occidental'), ('Logone Oriental'), ('Mandoul'), ('Mayo-Kebbi Est'), ('Mayo-Kebbi Ouest'), ('Moyen-Chari'), ('N’Djamena'), ('Ouaddaï'),
 ('Salamat'), ('Sila'), ('Tandjilé'), ('Tibesti'), ('Wadi Fira')
) AS divisions(division_name)
WHERE c.name = 'Chad'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Comoros (3 islands)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Anjouan'), ('Grande Comore'), ('Mohéli')) AS divisions(division_name)
WHERE c.name = 'Comoros'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Congo (12 departments)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Bouenza'), ('Brazzaville'), ('Cuvette'), ('Cuvette-Ouest'), ('Kouilou'), ('Lékoumou'), ('Likouala'), ('Niari'), ('Plateaux'), ('Pointe-Noire'), ('Pool'), ('Sangha')
) AS divisions(division_name)
WHERE c.name = 'Congo'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Djibouti (6 regions)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Ali Sabieh'), ('Arta'), ('Dikhil'), ('Djibouti'), ('Obock'), ('Tadjourah')) AS divisions(division_name)
WHERE c.name = 'Djibouti'
ON CONFLICT (country_id, slug) DO NOTHING;

-- DR Congo (26 provinces incl. Kinshasa)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Bas-Uélé'), ('Équateur'), ('Haut-Katanga'), ('Haut-Lomami'), ('Haut-Uélé'), ('Ituri'), ('Kasaï'), ('Kasaï-Central'), ('Kasaï-Oriental'),
 ('Kinshasa'), ('Kongo Central'), ('Kwango'), ('Kwilu'), ('Lomami'), ('Lualaba'), ('Mai-Ndombe'), ('Maniema'), ('Mongala'), ('Nord-Kivu'),
 ('Nord-Ubangi'), ('Sankuru'), ('Sud-Kivu'), ('Sud-Ubangi'), ('Tanganyika'), ('Tshopo'), ('Tshuapa')
) AS divisions(division_name)
WHERE c.name = 'DR Congo'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Equatorial Guinea (8)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Annobón'), ('Bioko Norte'), ('Bioko Sur'), ('Centro Sur'), ('Djibloho'), ('Kié-Ntem'), ('Litoral'), ('Wele-Nzas')) AS divisions(division_name)
WHERE c.name = 'Equatorial Guinea'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Eritrea (6)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Anseba'), ('Debub'), ('Gash-Barka'), ('Maekel'), ('Northern Red Sea'), ('Southern Red Sea')) AS divisions(division_name)
WHERE c.name = 'Eritrea'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Eswatini (4)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Hhohho'), ('Lubombo'), ('Manzini'), ('Shiselweni')) AS divisions(division_name)
WHERE c.name = 'Eswatini'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Ethiopia (12+ regions and cities)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Addis Ababa'), ('Afar'), ('Amhara'), ('Benishangul-Gumuz'), ('Dire Dawa'), ('Gambela'), ('Harari'), ('Oromia'), ('Sidama'),
 ('Somali'), ('South West Ethiopia Peoples'), ('Southern Nations, Nationalities, and Peoples'), ('Tigray')
) AS divisions(division_name)
WHERE c.name = 'Ethiopia'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Gabon (9)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Estuaire'), ('Haut-Ogooué'), ('Moyen-Ogooué'), ('Ngounié'), ('Nyanga'), ('Ogooué-Ivindo'), ('Ogooué-Lolo'), ('Ogooué-Maritime'), ('Woleu-Ntem')) AS divisions(division_name)
WHERE c.name = 'Gabon'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Gambia (7 incl. Banjul)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Banjul'), ('Central River'), ('Lower River'), ('North Bank'), ('Upper River'), ('West Coast'), ('Kombo St Mary')) AS divisions(division_name)
WHERE c.name = 'Gambia'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Guinea (8 + capital)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Boké'), ('Conakry'), ('Faranah'), ('Kankan'), ('Kindia'), ('Labé'), ('Mamou'), ('Nzérékoré')) AS divisions(division_name)
WHERE c.name = 'Guinea'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Guinea-Bissau (11 incl. Bissau)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES ('Bafatá'), ('Biombo'), ('Bissau'), ('Bolama'), ('Cacheu'), ('Gabú'), ('Oio'), ('Quinara'), ('Tombali'), ('Safim'), ('Bubaque')) AS divisions(division_name)
WHERE c.name = 'Guinea-Bissau'
ON CONFLICT (country_id, slug) DO NOTHING;

-- Ivory Coast (Côte d’Ivoire) (14 districts incl. capitals)
INSERT INTO snapshot_administrative_divisions (country_id, name, slug)
SELECT c.id, division_name, CONCAT(c.slug, '-', LOWER(TRIM(BOTH '-' FROM REGEXP_REPLACE(REGEXP_REPLACE(division_name, '''', '', 'g'), '[^a-zA-Z0-9]+', '-', 'g'))))
FROM snapshot_countries c
CROSS JOIN (VALUES
 ('Abidjan'), ('Bas-Sassandra'), ('Comoé'), ('Denguélé'), ('Gôh-Djiboua'), ('Lacs'), ('Lagunes'), ('Montagnes'),
 ('Sassandra-Marahoué'), ('Savanes'), ('Vallée du Bandama'), ('Woroba'), ('Yamoussoukro'), ('Zanzan')
) AS divisions(division_name)
WHERE c.name = 'Ivory Coast (Côte d’Ivoire)'
ON CONFLICT (country_id, slug) DO NOTHING;
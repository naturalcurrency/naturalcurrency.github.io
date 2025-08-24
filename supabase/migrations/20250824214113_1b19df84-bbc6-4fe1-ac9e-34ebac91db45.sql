-- Final batch: Sub-Saharan Africa and remaining countries - fixed syntax
-- Using efficient VALUES approach for major African countries

WITH data(country_name, code, division_name) AS (
  VALUES
    -- South Africa 
    ('South Africa','za','Gauteng'),('South Africa','za','Western Cape'),('South Africa','za','KwaZulu-Natal'),('South Africa','za','Eastern Cape'),('South Africa','za','Limpopo'),('South Africa','za','Mpumalanga'),('South Africa','za','North West'),('South Africa','za','Free State'),('South Africa','za','Northern Cape'),
    -- Nigeria
    ('Nigeria','ng','Lagos'),('Nigeria','ng','Kano'),('Nigeria','ng','Kaduna'),('Nigeria','ng','Oyo'),('Nigeria','ng','Rivers'),('Nigeria','ng','Bayelsa'),('Nigeria','ng','Delta'),('Nigeria','ng','Anambra'),('Nigeria','ng','Imo'),('Nigeria','ng','Abia'),('Nigeria','ng','Cross River'),('Nigeria','ng','Akwa Ibom'),('Nigeria','ng','Enugu'),('Nigeria','ng','Edo'),('Nigeria','ng','Ondo'),('Nigeria','ng','Osun'),('Nigeria','ng','Ogun'),('Nigeria','ng','Kwara'),('Nigeria','ng','Plateau'),('Nigeria','ng','Borno'),('Nigeria','ng','Adamawa'),('Nigeria','ng','Taraba'),('Nigeria','ng','Gombe'),('Nigeria','ng','Bauchi'),('Nigeria','ng','Yobe'),('Nigeria','ng','Jigawa'),('Nigeria','ng','Katsina'),('Nigeria','ng','Zamfara'),('Nigeria','ng','Sokoto'),('Nigeria','ng','Kebbi'),('Nigeria','ng','Niger'),('Nigeria','ng','Kogi'),('Nigeria','ng','Benue'),('Nigeria','ng','Nasarawa'),('Nigeria','ng','Abuja'),
    -- Kenya
    ('Kenya','ke','Nairobi City'),('Kenya','ke','Kiambu'),('Kenya','ke','Nakuru'),('Kenya','ke','Machakos'),('Kenya','ke','Meru'),('Kenya','ke','Kisumu'),('Kenya','ke','Uasin Gishu'),('Kenya','ke','Kakamega'),('Kenya','ke','Mombasa'),('Kenya','ke','Kilifi'),('Kenya','ke','Baringo'),('Kenya','ke','Bomet'),('Kenya','ke','Bungoma'),('Kenya','ke','Busia'),('Kenya','ke','Elgeyo-Marakwet'),('Kenya','ke','Embu'),('Kenya','ke','Garissa'),('Kenya','ke','Homa Bay'),('Kenya','ke','Isiolo'),('Kenya','ke','Kajiado'),('Kenya','ke','Kericho'),('Kenya','ke','Kirinyaga'),('Kenya','ke','Kisii'),('Kenya','ke','Kitui'),('Kenya','ke','Kwale'),('Kenya','ke','Laikipia'),('Kenya','ke','Lamu'),('Kenya','ke','Makueni'),('Kenya','ke','Mandera'),('Kenya','ke','Marsabit'),('Kenya','ke','Migori'),('Kenya','ke','Muranga'),('Kenya','ke','Nandi'),('Kenya','ke','Narok'),('Kenya','ke','Nyamira'),('Kenya','ke','Nyandarua'),('Kenya','ke','Nyeri'),('Kenya','ke','Samburu'),('Kenya','ke','Siaya'),('Kenya','ke','Taita-Taveta'),('Kenya','ke','Tana River'),('Kenya','ke','Tharaka-Nithi'),('Kenya','ke','Trans Nzoia'),('Kenya','ke','Turkana'),('Kenya','ke','Vihiga'),('Kenya','ke','Wajir'),('Kenya','ke','West Pokot'),
    -- Ethiopia
    ('Ethiopia','et','Addis Ababa'),('Ethiopia','et','Afar'),('Ethiopia','et','Amhara'),('Ethiopia','et','Benishangul-Gumuz'),('Ethiopia','et','Dire Dawa'),('Ethiopia','et','Gambela'),('Ethiopia','et','Harari'),('Ethiopia','et','Oromia'),('Ethiopia','et','Sidama'),('Ethiopia','et','Somali'),('Ethiopia','et','South West Ethiopia Peoples'),('Ethiopia','et','Southern Nations'),('Ethiopia','et','Tigray'),
    -- Tanzania  
    ('Tanzania','tz','Arusha'),('Tanzania','tz','Dar es Salaam'),('Tanzania','tz','Dodoma'),('Tanzania','tz','Geita'),('Tanzania','tz','Iringa'),('Tanzania','tz','Kagera'),('Tanzania','tz','Katavi'),('Tanzania','tz','Kigoma'),('Tanzania','tz','Kilimanjaro'),('Tanzania','tz','Lindi'),('Tanzania','tz','Manyara'),('Tanzania','tz','Mara'),('Tanzania','tz','Mbeya'),('Tanzania','tz','Mjini Magharibi'),('Tanzania','tz','Morogoro'),('Tanzania','tz','Mtwara'),('Tanzania','tz','Mwanza'),('Tanzania','tz','Njombe'),('Tanzania','tz','Pemba North'),('Tanzania','tz','Pemba South'),('Tanzania','tz','Pwani'),('Tanzania','tz','Rukwa'),('Tanzania','tz','Ruvuma'),('Tanzania','tz','Shinyanga'),('Tanzania','tz','Simiyu'),('Tanzania','tz','Singida'),('Tanzania','tz','Songwe'),('Tanzania','tz','Tabora'),('Tanzania','tz','Tanga'),('Tanzania','tz','Zanzibar Central'),('Tanzania','tz','Zanzibar North'),('Tanzania','tz','Zanzibar Urban'),
    -- Ghana
    ('Ghana','gh','Ahafo'),('Ghana','gh','Ashanti'),('Ghana','gh','Bono'),('Ghana','gh','Bono East'),('Ghana','gh','Central'),('Ghana','gh','Eastern'),('Ghana','gh','Greater Accra'),('Ghana','gh','North East'),('Ghana','gh','Northern'),('Ghana','gh','Oti'),('Ghana','gh','Savannah'),('Ghana','gh','Upper East'),('Ghana','gh','Upper West'),('Ghana','gh','Volta'),('Ghana','gh','Western'),('Ghana','gh','Western North'),
    -- Uganda
    ('Uganda','ug','Kampala'),('Uganda','ug','Wakiso'),('Uganda','ug','Mukono'),('Uganda','ug','Jinja'),('Uganda','ug','Mbale'),('Uganda','ug','Gulu'),('Uganda','ug','Lira'),('Uganda','ug','Mbarara'),('Uganda','ug','Kasese'),('Uganda','ug','Masaka'),('Uganda','ug','Hoima'),('Uganda','ug','Soroti'),('Uganda','ug','Kabale'),('Uganda','ug','Arua'),('Uganda','ug','Kitgum'),('Uganda','ug','Moroto'),('Uganda','ug','Kotido'),('Uganda','ug','Bundibugyo'),('Uganda','ug','Bushenyi'),('Uganda','ug','Iganga'),
    -- Canada
    ('Canada','ca','Alberta'),('Canada','ca','British Columbia'),('Canada','ca','Manitoba'),('Canada','ca','New Brunswick'),('Canada','ca','Newfoundland and Labrador'),('Canada','ca','Northwest Territories'),('Canada','ca','Nova Scotia'),('Canada','ca','Nunavut'),('Canada','ca','Ontario'),('Canada','ca','Prince Edward Island'),('Canada','ca','Quebec'),('Canada','ca','Saskatchewan'),('Canada','ca','Yukon'),
    -- United States (Top 20 states)
    ('United States','us','California'),('United States','us','Texas'),('United States','us','Florida'),('United States','us','New York'),('United States','us','Pennsylvania'),('United States','us','Illinois'),('United States','us','Ohio'),('United States','us','Georgia'),('United States','us','North Carolina'),('United States','us','Michigan'),('United States','us','New Jersey'),('United States','us','Virginia'),('United States','us','Washington'),('United States','us','Arizona'),('United States','us','Tennessee'),('United States','us','Massachusetts'),('United States','us','Indiana'),('United States','us','Maryland'),('United States','us','Missouri'),('United States','us','Colorado')
)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT 
  d.division_name,
  CONCAT(d.code, '-', LOWER(
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(d.division_name,
      ' ', '-'),'''',''), ''',''), 'á','a'), 'é','e'), 'í','i'), 'ó','o'), 'ú','u')
  )),
  c.id
FROM data d
JOIN snapshot_countries c ON c.name = d.country_name
ON CONFLICT (country_id, slug) DO NOTHING;
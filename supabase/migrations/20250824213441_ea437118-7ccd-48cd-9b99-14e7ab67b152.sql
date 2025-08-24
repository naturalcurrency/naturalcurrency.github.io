-- Continue adding administrative divisions - Latin America batch

-- Brazil - Add all states
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'brazil' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['São Paulo','Rio de Janeiro','Minas Gerais','Bahia','Paraná','Rio Grande do Sul','Pernambuco','Ceará','Pará','Santa Catarina','Goiás','Maranhão','Espírito Santo','Paraíba','Amazonas','Mato Grosso','Rio Grande do Norte','Alagoas','Piauí','Mato Grosso do Sul','Rondônia','Sergipe','Amapá','Acre','Roraima','Tocantins','Brasília']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Argentina - Add all provinces
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'argentina' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Buenos Aires','Buenos Aires City','Córdoba','Santa Fe','Mendoza','Tucumán','Entre Ríos','Salta','Misiones','Chaco','Corrientes','Santiago del Estero','San Juan','Jujuy','Río Negro','Neuquén','Formosa','Chubut','San Luis','Catamarca','La Rioja','La Pampa','Santa Cruz','Tierra del Fuego']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Mexico - Add all states
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'mexico' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Mexico City','State of Mexico','Jalisco','Veracruz','Puebla','Guanajuato','Chiapas','Nuevo León','Michoacán','Oaxaca','Chihuahua','Guerrero','Tamaulipas','Baja California','Sinaloa','Coahuila','Hidalgo','Sonora','San Luis Potosí','Tabasco','Yucatán','Querétaro','Morelos','Durango','Zacatecas','Quintana Roo','Tlaxcala','Aguascalientes','Nayarit','Campeche','Baja California Sur','Colima']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Chile - Add all regions
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'chile' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Santiago Metropolitan','Valparaíso','Biobío','Araucanía','Los Lagos','Maule','O''Higgins','Antofagasta','Coquimbo','Los Ríos','Tarapacá','Aysén','Atacama','Magallanes','Arica y Parinacota','Ñuble']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Venezuela - Add all states
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'venezuela' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Caracas','Miranda','Zulia','Carabobo','Lara','Aragua','Anzoátegui','Bolívar','Táchira','Falcón','Portuguesa','Barinas','Apure','Sucre','Monagas','Yaracuy','Trujillo','Mérida','Nueva Esparta','Guárico','Cojedes','Delta Amacuro','Amazonas','Vargas','Federal Dependencies']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Guatemala - Add all departments
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'guatemala' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Guatemala','Quetzaltenango','Escuintla','Alta Verapaz','Petén','San Marcos','Huehuetenango','Chimaltenango','Quiché','Baja Verapaz','Izabal','Suchitepéquez','Chiquimula','Sacatepéquez','Jalapa','Retalhuleu','Santa Rosa','Sololá','Totonicapán','Zacapa','El Progreso','Jutiapa']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Uruguay - Add all departments
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'uruguay' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Montevideo','Canelones','Maldonado','Rivera','Salto','Paysandú','Cerro Largo','Tacuarembó','Rocha','Colonia','Soriano','Río Negro','San José','Durazno','Florida','Lavalleja','Artigas','Treinta y Tres','Flores']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Bolivia - Add all departments
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'bolivia' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Santa Cruz','La Paz','Cochabamba','Potosí','Chuquisaca','Oruro','Tarija','Beni','Pando']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Paraguay - Add all departments
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'paraguay' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Central','Alto Paraná','Itapúa','Caaguazú','San Pedro','Caazapá','Paraguarí','Guairá','Misiones','Ñeembucú','Concepción','Amambay','Canindeyú','Presidente Hayes','Cordillera','Boquerón','Alto Paraguay','Asunción']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Costa Rica - Add all provinces
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'costa-rica' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['San José','Alajuela','Cartago','Heredia','Guanacaste','Puntarenas','Limón']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Panama - Add all provinces
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'panama' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Panamá','Chiriquí','Veraguas','Coclé','Los Santos','Herrera','Colón','Darién','Bocas del Toro','Panamá Oeste','Emberá-Wounaan','Guna Yala','Ngäbe-Buglé','Kuna de Madungandí','Kuna de Wargandí']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Nicaragua - Add all departments
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'nicaragua' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Managua','León','Granada','Masaya','Chinandega','Matagalpa','Boaco','Carazo','Rivas','Nueva Segovia','Estelí','Madriz','Jinotega','Chontales','Río San Juan','North Caribbean Coast','South Caribbean Coast']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Honduras - Add all departments
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'honduras' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Cortés','Francisco Morazán','Atlántida','Choluteca','Olancho','El Paraíso','Yoro','Colón','Comayagua','Santa Bárbara','Copán','La Paz','Lempira','Valle','Ocotepeque','Intibucá','Gracias a Dios','Islas de la Bahía']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- El Salvador - Add all departments
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'el-salvador' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['San Salvador','Santa Ana','San Miguel','Sonsonate','La Libertad','Usulután','Ahuachapán','Cuscatlán','La Paz','Chalatenango','Cabañas','Morazán','La Unión','San Vicente']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Cuba - Add all provinces
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'cuba' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Havana','Santiago de Cuba','Holguín','Villa Clara','Granma','Las Tunas','Camagüey','Pinar del Río','Guantánamo','Sancti Spíritus','Ciego de Ávila','Matanzas','Cienfuegos','Mayabeque','Artemisa','Isla de la Juventud']) d
ON CONFLICT (country_id, slug) DO NOTHING;

-- Dominican Republic - Add all provinces
WITH c AS (SELECT id FROM snapshot_countries WHERE slug = 'dominican-republic' LIMIT 1)
INSERT INTO snapshot_administrative_divisions (name, slug, country_id)
SELECT d, LOWER(REPLACE(d,' ', '-')), c.id
FROM c, UNNEST(ARRAY['Distrito Nacional','Santiago','Santo Domingo','San Pedro de Macorís','La Vega','Puerto Plata','San Cristóbal','Duarte','La Romana','Espaillat','Azua','Barahona','Monte Cristi','Valverde','Sánchez Ramírez','Peravia','San Juan','Baoruco','Hato Mayor','Samaná','El Seibo','María Trinidad Sánchez','Dajabón','Monseñor Nouel','La Altagracia','Independencia','Elías Piña','Monte Plata','Hermanas Mirabal','San José de Ocoa','Santiago Rodríguez','Pedernales']) d
ON CONFLICT (country_id, slug) DO NOTHING;
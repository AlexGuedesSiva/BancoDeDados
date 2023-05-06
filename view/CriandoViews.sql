-- View que seleciona todos os estados:
CREATE VIEW view_estados_todos AS
SELECT *
FROM estados;

-- View que seleciona apenas os estados da região Norte:
CREATE VIEW view_estados_norte AS
SELECT *
FROM estados
WHERE regiao = 'Norte';

-- View que seleciona apenas os estados da região Nordeste:
CREATE VIEW view_estados_nordeste AS
SELECT *
FROM estados
WHERE regiao = 'Nordeste';

-- View que seleciona apenas os estados da região Centro-Oeste:
CREATE VIEW view_estados_centro_oeste AS
SELECT *
FROM estados
WHERE regiao = 'Centro-Oeste';

-- View que seleciona apenas os estados da região Sudeste:
CREATE VIEW view_estados_sudeste AS
SELECT *
FROM estados
WHERE regiao = 'Sudeste';

-- View que seleciona apenas os estados da região Sul:
CREATE VIEW view_estados_sul AS
SELECT *
FROM estados
WHERE regiao = 'Sul';

-- View que seleciona apenas os estados com mais de 10 milhões de habitantes:
CREATE VIEW view_estados_populosos AS
SELECT *
FROM estados
WHERE populacao > 10000000;

-- View que seleciona apenas os estados com IDH acima de 0,8:
CREATE VIEW view_estados_idh_alto AS
SELECT *
FROM estados
WHERE idh > 0.8;

-- View que seleciona apenas os estados com área territorial maior que 500.000 km²:
CREATE VIEW view_estados_grandes AS
SELECT *
FROM estados
WHERE area > 500000;

-- View que seleciona apenas os estados que possuem litoral:
CREATE VIEW view_estados_litoral AS
SELECT *
FROM estados
WHERE litoral = 'Sim';
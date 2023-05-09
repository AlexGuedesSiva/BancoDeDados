-- Criar uma função que retorna o número de estados na tabela:
CREATE FUNCTION contar_estados()
  RETURN INTEGER
  IS
    qtd_estados INTEGER;
  BEGIN
    SELECT COUNT(*) INTO qtd_estados FROM estados;
    RETURN qtd_estados;
  END;

-- Criar uma função que retorna a sigla do estado com base no nome:
CREATE FUNCTION obter_sigla_estado(p_nome_estado IN VARCHAR2)
  RETURN VARCHAR2
  IS
    sigla_estado VARCHAR2(2);
  BEGIN
    SELECT sigla INTO sigla_estado FROM estados WHERE nome = p_nome_estado;
    RETURN sigla_estado;
  END;


-- Criar uma função que retorna o nome do estado com base na sigla:
CREATE FUNCTION obter_nome_estado(p_sigla_estado IN VARCHAR2)
  RETURN VARCHAR2
  IS
    nome_estado VARCHAR2(50);
  BEGIN
    SELECT nome INTO nome_estado FROM estados WHERE sigla = p_sigla_estado;
    RETURN nome_estado;
  END;

-- Criar uma função que retorna uma lista de estados ordenados por nome:
CREATE FUNCTION listar_estados_por_nome()
  RETURN SYS_REFCURSOR
  IS
    estados_cursor SYS_REFCURSOR;
  BEGIN
    OPEN estados_cursor FOR
      SELECT * FROM estados ORDER BY nome;
    RETURN estados_cursor;
  END;

-- Criar uma função que retorna o nome do estado com a maior população:
CREATE FUNCTION obter_estado_com_maior_populacao()
  RETURN VARCHAR2
  IS
    nome_estado VARCHAR2(50);
  BEGIN
    SELECT nome INTO nome_estado FROM estados WHERE populacao = (SELECT MAX(populacao) FROM estados);
    RETURN nome_estado;
  END;

-- Criar uma função que retorna a população total de todos os estados:
CREATE FUNCTION obter_populacao_total()
  RETURN INTEGER
  IS
    populacao_total INTEGER;
  BEGIN
    SELECT SUM(populacao) INTO populacao_total FROM estados;
    RETURN populacao_total;
  END;

-- Criar uma função que retorna o nome do estado com a menor área territorial:
CREATE FUNCTION obter_estado_com_menor_area()
  RETURN VARCHAR2
  IS
    nome_estado VARCHAR2(50);
  BEGIN
    SELECT nome INTO nome_estado FROM estados WHERE area = (SELECT MIN(area) FROM estados);
    RETURN nome_estado;
  END;

-- Criar uma função que retorna a média de população dos estados:
CREATE FUNCTION obter_media_populacao()
  RETURN NUMBER
  IS
    media_populacao NUMBER;
  BEGIN
    SELECT AVG(populacao) INTO media_populacao FROM estados;
    RETURN media_populacao;
  END;

-- Criar uma função que retorna uma lista de estados com população acima de um valor mínimo:
CREATE FUNCTION listar_estados_populacao_minima(p_populacao_minima IN INTEGER)
  RETURN SYS_REFCURSOR
  IS
    estados_cursor SYS_REFCURSOR;
  BEGIN
    OPEN estados_cursor FOR
      SELECT * FROM estados WHERE populacao >= p_populacao_minima ORDER BY nome;
    RETURN estados_cursor;
  END;
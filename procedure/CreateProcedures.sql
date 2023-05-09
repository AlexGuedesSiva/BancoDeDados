-- Criar uma procedure para inserir um novo estado na tabela:
CREATE OR REPLACE PROCEDURE inserir_estado
    (nome_estado IN VARCHAR2, uf_estado IN VARCHAR2)
IS
BEGIN
    INSERT INTO estados (nome, uf) VALUES (nome_estado, uf_estado);
    COMMIT;
END;

-- Criar uma procedure para atualizar o nome de um estado na tabela:
CREATE OR REPLACE PROCEDURE atualizar_nome_estado
    (id_estado IN NUMBER, novo_nome_estado IN VARCHAR2)
IS
BEGIN
    UPDATE estados SET nome = novo_nome_estado WHERE id = id_estado;
    COMMIT;
END;

-- Criar uma procedure para atualizar a UF de um estado na tabela:
CREATE OR REPLACE PROCEDURE atualizar_uf_estado
    (id_estado IN NUMBER, nova_uf_estado IN VARCHAR2)
IS
BEGIN
    UPDATE estados SET uf = nova_uf_estado WHERE id = id_estado;
    COMMIT;
END;

-- Criar uma procedure para excluir um estado da tabela:
CREATE OR REPLACE PROCEDURE excluir_estado
    (id_estado IN NUMBER)
IS
BEGIN
    DELETE FROM estados WHERE id = id_estado;
    COMMIT;
END;

-- Criar uma procedure para obter o nome de um estado a partir de sua UF:
CREATE OR REPLACE PROCEDURE obter_nome_estado
    (uf_estado IN VARCHAR2, nome_estado OUT VARCHAR2)
IS
BEGIN
    SELECT nome INTO nome_estado FROM estados WHERE uf = uf_estado;
END;

-- Criar uma procedure para obter a UF de um estado a partir de seu nome:
CREATE OR REPLACE PROCEDURE obter_uf_estado
    (nome_estado IN VARCHAR2, uf_estado OUT VARCHAR2)
IS
BEGIN
    SELECT uf INTO uf_estado FROM estados WHERE nome = nome_estado;
END;

-- Criar uma procedure para obter o número total de estados na tabela:
CREATE OR REPLACE PROCEDURE contar_estados
    (total_estados OUT NUMBER)
IS
BEGIN
    SELECT COUNT(*) INTO total_estados FROM estados;
END;

-- Criar uma procedure para obter uma lista de todos os estados na tabela:
CREATE OR REPLACE PROCEDURE listar_estados
IS
BEGIN
    FOR estado IN (SELECT * FROM estados) LOOP
        DBMS_OUTPUT.PUT_LINE(estado.id || ': ' || estado.nome || ' (' || estado.uf || ')');
    END LOOP;
END;

-- Criar uma procedure para obter o número total de estados em uma determinada região:
CREATE OR REPLACE PROCEDURE contar_estados_regiao
    (regiao_estado IN VARCHAR2, total_estados OUT NUMBER)
IS
BEGIN
    SELECT COUNT(*) INTO total_estados FROM estados WHERE regiao = regiao_estado;
END;

-- Criar uma procedure para obter uma lista de todos os estados em uma determinada região:
CREATE OR REPLACE PROCEDURE listar_estados_regiao
    (regiao_estado IN VARCHAR2)
IS
BEGIN
    FOR estado IN (SELECT * FROM estados WHERE regiao = regiao_estado) LOOP
        DBMS_OUTPUT.PUT_LINE(estado.id || ': ' || estado.nome || ' (' || estado.uf || ')');
    END LOOP;
END;
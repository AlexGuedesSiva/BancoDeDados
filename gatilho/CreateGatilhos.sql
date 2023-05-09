-- Criar um gatilho que insere automaticamente a data de criação de um novo estado:
CREATE TRIGGER tg_insere_data_criacao
BEFORE INSERT ON estados
FOR EACH ROW
BEGIN
  :NEW.data_criacao := SYSDATE;
END;

-- Criar um gatilho que atualiza a data de modificação de um estado sempre que ele é atualizado:
CREATE TRIGGER tg_atualiza_data_modificacao
BEFORE UPDATE ON estados
FOR EACH ROW
BEGIN
  :NEW.data_modificacao := SYSDATE;
END;

-- Criar um gatilho que impede a exclusão de um estado que tenha cidades associadas:
CREATE TRIGGER tg_impede_exclusao_estado
BEFORE DELETE ON estados
FOR EACH ROW
DECLARE
  qtde_cidades INTEGER;
BEGIN
  SELECT COUNT(*) INTO qtde_cidades FROM cidades WHERE estado_id = :OLD.id;
  IF qtde_cidades > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Não é possível excluir este estado pois existem cidades associadas a ele.');
  END IF;
END;

-- Criar um gatilho que adiciona automaticamente o prefixo "EST_" ao nome de um novo estado:
CREATE TRIGGER tg_adiciona_prefixo_nome
BEFORE INSERT ON estados
FOR EACH ROW
BEGIN
  :NEW.nome := 'EST_' || :NEW.nome;
END;

-- Criar um gatilho que calcula automaticamente a população total de um estado e atualiza a tabela de estados:
CREATE TRIGGER tg_atualiza_populacao_estado
AFTER INSERT OR UPDATE OR DELETE ON cidades
DECLARE
  total_populacao INTEGER;
BEGIN
  SELECT SUM(populacao) INTO total_populacao FROM cidades WHERE estado_id = :NEW.estado_id;
  UPDATE estados SET populacao = total_populacao WHERE id = :NEW.estado_id;
END;

-- Criar um gatilho que limita o número máximo de caracteres do nome de um estado:
CREATE TRIGGER tg_limita_caracteres_nome
BEFORE INSERT OR UPDATE ON estados
FOR EACH ROW
BEGIN
  IF LENGTH(:NEW.nome) > 20 THEN
    RAISE_APPLICATION_ERROR(-20002, 'O nome do estado não pode ter mais de 20 caracteres.');
  END IF;
END;

-- Criar um gatilho que adiciona automaticamente um novo registro na tabela de histórico sempre que um estado é atualizado:
CREATE TRIGGER tg_registra_historico_estado
AFTER UPDATE ON estados
FOR EACH ROW
BEGIN
  INSERT INTO historico_estados (estado_id, data_modificacao, usuario) VALUES (:OLD.id, SYSDATE, USER);
END;

-- Criar um gatilho que impede a atualização do código de um estado:
CREATE TRIGGER tg_impede_atualizacao_codigo
BEFORE UPDATE ON estados
FOR EACH ROW
BEGIN
  IF :OLD.codigo <> :NEW.codigo THEN
    RAISE_APPLICATION_ERROR(-20003, 'O código do estado não pode ser alterado.');
  END IF;
END;

-- Criar um gatilho que impede a exclusão de estados com mais de 20 milhões de habitantes:
CREATE OR REPLACE TRIGGER trg_impedir_exclusao
BEFORE DELETE ON estados
FOR EACH ROW
BEGIN
  IF :OLD.populacao > 20000000 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Não é possível excluir estados com mais de 20 milhões de habitantes.');
  END IF;
END;
/

-- Criar um gatilho que atualiza a data de última atualização sempre que um registro é modificado:
CREATE OR REPLACE TRIGGER trg_atualizar_data
BEFORE INSERT OR UPDATE ON estados
FOR EACH ROW
BEGIN
  :NEW.ultima_atualizacao := SYSDATE;
END;

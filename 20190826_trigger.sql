CREATE TABLE teste (
    id        NUMBER(9),
    nome      VARCHAR2(50),
    salario   NUMBER(7, 2)
);

CREATE OR REPLACE TRIGGER verifica_horario BEFORE
    INSERT ON teste
BEGIN
    IF to_number(TO_CHAR(SYSDATE, 'hh24')) NOT BETWEEN 9 AND 22 THEN
        raise_application_error(-20000, 'Insercoes somente em horario comercial.');
    END IF;
END;
/

INSERT INTO teste VALUES (
    1,
    'Joao',
    1000
);

CREATE OR REPLACE TRIGGER valida_salario BEFORE
    INSERT ON teste
    FOR EACH ROW
BEGIN
    IF :new.salario < 0 THEN
        raise_application_error(-20001, 'Salario somente maior ou igual a 0');
    END IF;
END;
/

INSERT INTO teste VALUES (
    2,
    'Anderson',
    - 1000
);

INSERT INTO teste VALUES (
    2,
    'Anderson',
    9000
);

SELECT * FROM teste;

CREATE TABLE log_teste (
    log_data   DATE,
    evento     VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER auditoria_teste AFTER
    INSERT OR UPDATE OR DELETE ON teste
DECLARE
    log_evento log_teste.evento%TYPE;
BEGIN
    IF inserting THEN
        log_evento := 'Inserido';
    ELSIF updating THEN
        log_evento := 'Atualizado';
    ELSIF deleting THEN
        log_evento := 'Removido';
    END IF;

    INSERT INTO log_teste VALUES (
        SYSDATE,
        log_evento
    );

END;
/

INSERT INTO teste VALUES (
    3,
    'Mario',
    2000
);

SELECT * FROM log_teste;

UPDATE teste
SET
    salario = 2500
WHERE
    id = 3;

SELECT * FROM log_teste;

DELETE FROM teste
WHERE
    id = 2;

SELECT * FROM log_teste;

SELECT * FROM teste;

SPOOL of;
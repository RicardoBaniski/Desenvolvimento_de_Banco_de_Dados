--CREATE USER RICARDO IDENTIFIED BY 123;
--GRANT CONNECT, RESOURCE TO RICARDO;

CREATE TABLE usuario (
    id_usuario    NUMBER(6),
    tipo          VARCHAR2(30),
    nome          VARCHAR2(30),
    sobrenome     VARCHAR2(30),
    apartamento   NUMBER(4),
    bloco         NUMBER(3)
);




/*  EXERCÍCIO 01 */

SELECT * FROM USUARIO;

SET SERVEROUTPUT ON;

DECLARE
    n INTEGER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO n
    FROM
        user_tab_columns
    WHERE
        upper(table_name) LIKE upper('usuario');

    IF ( n > 0 ) THEN
        dbms_output.put_line('TABELA ENCONTRADA, USUÁRIO INSERIDO COM SUCESSO!!!');
        INSERT INTO usuario VALUES (
            111,
            'TESTE1',
            'TESTE1',
            'TESTE1',
            11,
            1
        );

    ELSE
        dbms_output.put_line('TABELA NÃO ENCONTRADA!!!');
    END IF;

END;
/

SELECT * FROM USUARIO;





/* EXERCÍCIO 02*/

SELECT * FROM usuario;

SET SERVEROUTPUT ON;

DECLARE
    n INTEGER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO n
    FROM
        user_tab_columns
    WHERE
        upper(table_name) LIKE upper('USUARIO');

    IF ( n > 0 ) THEN
        dbms_output.put_line('TABELA ENCONTRADA, USUÁRIO EXCLUÍDO COM SUCESSO!!!');
        DELETE FROM usuario
        WHERE
            id_usuario = 111;

    ELSE
        dbms_output.put_line('TABELA NÃO ENCONTRADA!!!');
    END IF;

END;
/
SELECT * FROM USUARIO;





/* EXERCÍCIO 03*/

SELECT * FROM USUARIO_2;

DECLARE
    v_count NUMBER(1);
BEGIN
    SELECT
        COUNT(*)
    INTO v_count
    FROM
        all_tables
    WHERE
        owner = upper('RICARDO')
        AND table_name = upper('USUARIO');

    IF v_count = 0 THEN
        EXECUTE IMMEDIATE 'create table USUARIO ( id_usuario      NUMBER(6), 
                                                    tipo            VARCHAR2(30), 
                                                    nome            VARCHAR2(30), 
                                                    sobrenome       VARCHAR2(30),
                                                    apartamento     NUMBER(4),
                                                    bloco           NUMBER(3))';
    ELSE
        EXECUTE IMMEDIATE 'create table USUARIO_2 ( id_usuario      NUMBER(6), 
                                                    tipo            VARCHAR2(30), 
                                                    nome            VARCHAR2(30), 
                                                    sobrenome       VARCHAR2(30),
                                                    apartamento     NUMBER(4),
                                                    bloco           NUMBER(3))';                                               
    END IF;
END;
/
SELECT * FROM USUARIO_2;




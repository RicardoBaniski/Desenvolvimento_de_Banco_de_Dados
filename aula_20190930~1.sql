/* Com usuário SYSTEM */
--CREATE USER rbaniski IDENTIFIED BY 123;
--grant connect, resource to rbaniski;

CREATE
  TABLE pessoa
  (
    id_pessoa NUMBER(8),
    nm_pessoa VARCHAR2(30),
    dt_nasc   DATE,
    sexo      CHAR(1),
    id_signo  NUMBER(2)
  );
  
CREATE
  TABLE signo
  (
    id_signo NUMBER(1),
    nm_signo VARCHAR2(30)
  );
  
ALTER TABLE signo ADD CONSTRAINT ID_signo_PK PRIMARY KEY (ID_signo);
ALTER TABLE pessoa ADD CONSTRAINTS ID_signo_FK FOREIGN KEY(Id_signo) REFERENCES
signo(Id_signo);

SELECT
  table_name
FROM
  user_tables;

DESC user_tables;

SELECT
  table_name,
  num_rows
FROM
  user_tables;

DESC user_tab_columns;

SELECT
  table_name,
  column_name,
  data_type
FROM
  user_tab_columns
WHERE
  table_name = 'PESSOA';
DESC USER_CONSTRAINTS;

SELECT
  CONSTRAINT_NAME,
  TABLE_NAME,
  CONSTRAINT_TYPE
FROM
  USER_CONSTRAINTS;

DESC user_procedures;

DESC user_triggers;

DECLARE
  p_count INTEGER;
BEGIN
  SELECT
    COUNT(*)
  INTO
    p_count
  FROM
    user_TAB_COLUMNS
  WHERE
    TABLE_NAME    = 'PESSOA'
  AND COLUMN_NAME = 'APELIDO';
  IF (p_count     = 0) THEN
    EXECUTE IMMEDIATE 'ALTER TABLE PESSOA ADD (APELIDO VARCHAR2(30))';
  END IF;
END;
/

SELECT * FROM PESSOA;
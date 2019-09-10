CREATE
  TABLE teste
  (
    id      NUMBER (9),
    nome    VARCHAR2(50),
    salario NUMBER(8,2)
  );
  
CREATE OR REPLACE PROCEDURE insereFixo
IS
BEGIN
  FOR i IN 1..10000
  LOOP
    INSERT
    INTO
      teste VALUES
      (
        i,
        'Nome'
        ||i,
        1000
      );
  END LOOP;
END insereFixo;
/

SELECT
  *
FROM
  teste
WHERE
  ROWNUM <= 100;
ALTER TABLE teste ADD genero CHAR;
CREATE OR REPLACE PROCEDURE insereFixo
IS
BEGIN
  FOR i IN 1..10000
  LOOP
    IF i <= 5000 THEN
      INSERT
      INTO
        teste VALUES
        (
          i,
          'Nome'
          ||i,
          5000,
          'F'
        );
    ELSE
      INSERT
      INTO
        teste VALUES
        (
          i,
          'Nome'
          ||i,
          1000,
          'M'
        );
    END IF;
  END LOOP;
END insereFixo;
/

EXEC insereFixo();



CREATE OR REPLACE PROCEDURE insereVariavel
  (
    qtde NUMBER
  )
IS
BEGIN
  FOR i IN 1..qtde
  LOOP
    INSERT
    INTO
      teste VALUES
      (
        i,
        'Nome'
        ||i,
        1000,
        'I'
      );
  END LOOP;
END insereVariavel;
/



CREATE OR REPLACE PROCEDURE insereVariavel
  (
    qtde    NUMBER,
    salario NUMBER
  )
IS
BEGIN
  FOR i IN 1..qtde
  LOOP
    IF mod
      (
        i,2
      )
      = 0 THEN
      INSERT
      INTO
        teste VALUES
        (
          i,
          'Nome'
          ||i,
          salario,
          'M'
        );
    ELSE
      INSERT
      INTO
        teste VALUES
        (
          i,
          'Nome'
          ||i,
          salario,
          'F'
        );
    END IF;
  END LOOP;
END insereVariavel;
/



CREATE OR REPLACE PROCEDURE atualizaSalario
  (
    pid      NUMBER,
    psalario NUMBER
  )
IS
BEGIN
  UPDATE
    teste
  SET
    salario = psalario
  WHERE
    id = pid;
END atualizaSalario;
/

EXEC atualizaSalario(50,1250);

SELECT
  *
FROM
  teste
WHERE
  id=50;
CREATE OR REPLACE PROCEDURE aumenta_salario(
    pid      NUMBER,
    psalario NUMBER)
IS
  valor NUMBER(8,2);
BEGIN
  IF psalario < 1000 THEN
    valor    := psalario + 50;
  ELSE
    valor := psalario + 200;
  END IF;
  UPDATE
    teste
  SET
    salario = valor
  WHERE
    id = pid;
END aumenta_salario;
/

EXEC aumenta_salario(40,2000);

SELECT
  salario
FROM
  teste
WHERE
  id = 40;
SELECT
  *
FROM
  teste;



CREATE OR REPLACE PROCEDURE atualiza_cargo(
    pid   NUMBER,
    cargo NUMBER)
IS
  valor NUMBER(8,2);
BEGIN
  IF cargo    = 1 THEN
    valor    := 100;
  elsif cargo = 2 THEN
    valor    := 2000;
  ELSE
    valor := 3000;
  END IF;
  UPDATE
    teste
  SET
    salario = valor
  WHERE
    id = pid;
END atualiza_cargo;
/

EXEC atualiza_cargo(20,3);

SELECT
  *
FROM
  teste
WHERE
  id = 20;
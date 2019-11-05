/* Procedures: 
    Ligar ator com filme, definindo um cachê base em 100 mil e nome do personagem "a definir".
    Atualizar o nome de um personagem para um ator.
    Atualizar o cachê de um ator, não permitindo valor negativo.
    Exibir o cachê médio de um determinado ator.
    Exibir o cachê total dos atores de um determinado filme.
    Contar o total de atores em um filme.
    Pelo id, Exibir o titulo do filme, o nome dos atores e seus respectivos personagens.
	
	Enviar para diego.cardoso@opet.edu.br
*/

create table Filme(id_filme number(11),titulo_filme varchar2(50), ano_filme number(4));
create table Ator(id_ator number(11),nome_ator varchar2(50),idade_ator number(2));
create table Ator_Filme(id_filme number(11), id_ator number(11),personagem_ator varchar2(50),cache_ator number(8,2));

insert into Filme values(1,'Test',2001);
insert into Ator values(1,'Afonso',27);
insert into Ator values(2,'Ana',23);
insert into Ator_Filme values(1,1,'Rocky',100000);
insert into Ator_Filme values(1,2,'Rebecca',200000);

select * from filme;
select * from Ator_Filme;
select * from Ator;

set serveroutput on;

create or replace procedure teste_proc
is
    total number(11);
    CURSOR cAtor is select * from Ator;
begin
    total := 0;
    FOR reg_ator IN cAtor LOOP
        total := total + 1;
    END LOOP;
    dbms_output.put_line('Total dos atores:'||total);
end;
/

create or replace procedure teste_proc2
is
    CURSOR cAtor is select * from Ator;
begin
    FOR reg_ator IN cAtor LOOP
        dbms_output.put_line(reg_Ator.nome_ator);
    END LOOP;
end;
/
exec teste_proc();
exec teste_proc2();


CREATE OR REPLACE PROCEDURE TESTE_FINAL
IS
CURSOR CID_FILME IS SELECT * FROM FILME F 
    INNER JOIN ATOR_FILME AF 
        ON AF.ID_FILME=F.ID_FILME 
    INNER JOIN ATOR A
        ON A.ID_ATOR=af.id_ator;
BEGIN 
FOR REG_ID IN CID_FILME LOOP
    FOR REG_ATOR IN CID_ATOR LOOP
        dbms_output.put_line(REG_ID.CID_FILME + REG_ATOR.CID_ATOR);
    END LOOP;
END;
/

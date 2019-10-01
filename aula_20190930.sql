/* Tables que o usu�rio possui privil�gios */
--select table_name from all_tables;

/* Nosso usu�rio */
--select table_name from user_tables;

/* Administrativas */
--select table_name from dba_tables;

/* O que est� sendo executado neste momento */
--select * from v$session;

/*  */
--desc v$session;

/* Usu�rios e seus respectivos processos */
--select username, terminal from v$session;
--select username, terminal, action from v$session;

/* Tabela Coringa */
--desc dual;
--select sysdate from dual;
--select username from dual;
--select 7*48 from dual;

/* A tabela DUAL pode ser utilizada para realiza��o de testes */
--select substr('oracle nao erra',8,8) from dual;
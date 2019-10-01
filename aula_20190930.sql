/* Tables que o usuário possui privilégios */
--select table_name from all_tables;

/* Nosso usuário */
--select table_name from user_tables;

/* Administrativas */
--select table_name from dba_tables;

/* O que está sendo executado neste momento */
--select * from v$session;

/*  */
--desc v$session;

/* Usuários e seus respectivos processos */
--select username, terminal from v$session;
--select username, terminal, action from v$session;

/* Tabela Coringa */
--desc dual;
--select sysdate from dual;
--select username from dual;
--select 7*48 from dual;

/* A tabela DUAL pode ser utilizada para realização de testes */
--select substr('oracle nao erra',8,8) from dual;
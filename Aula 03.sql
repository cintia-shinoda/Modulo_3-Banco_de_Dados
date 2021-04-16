                         -- AULA 03 - 09/04/2021 --

/* 
            -- KAHOOT! SHIFT AULA 02:  --
            
01. 
R.:

02.
R.:

03.
R.:

04.
R.:

05.
R.:

06.
R.:

07.
R.:

08.
R.:

09.
R.:

10.
R.:

11.
R.:

*/


--------------------------------------------------------------------------------

/*               -- CORREÇÃO DO EXERCÍCIO DA AULA 02 --

create table CATEGORIA (
    COD_CATEGORIA number constraint PK_CAT_CODCAT primary key,
    CATEGORIA varchar(255)
);

create table MATERIA_PRIMA (
    COD_MATERIA_PRIMA number constraint PK_MATPRI_MATPRI primary key,
    MATERIA_PRIMA varchar(255)
);

create table PRODUTO (
    COD_PRODUTO number constraint PK_PRO_CODPRO primary key,
    COD_CATEGORIA number constraint FK_PRO_CODCAT references CATEGORIA(COD_CATEGORIA),
    PRODUTO varchar(255)
);

create table ITEM_PRODUTO (
    COD_PRODUTO number,
    COD_MATERIA_PRIMA number,
    QUANTIDADE number,
    constraint PK_ITEPRO_CODPRO_CODMAT primary key (COD_PRODUTO, COD_MATERIA_PRIMA),  -- chave primária composta
    constraint FK_ITEPRO_CODPRO foreign key (COD_PRODUTO) references PRODUTO(COD_PRODUTO),
    constraint FK_ITEPRO_CODMATPRI foreign key (COD_MATERIA_PRIMA) REFERENCES MATERIA_PRIMA(COD_MATERIA_PRIMA)
);

*/


--------------------------------------------------------------------------------
               
    -- ALTERAÇÃO E EXCLUSÃO DE OBJETOS (DDL - DATA DEFINITION LANGUAGE) --

/*
- User Constraints
- ALTER, DROP, RENAME e TRUNCATE
- Sequence
- Exercícios




-- USER CONSTRAINTS --
    - é possível consultar todas as definições das constraints cadastradas no Oracle
    por meio das tabelas:
        - DBA_CONSTRAINTS
        - ALL_CONSTRAINTS
        - USER_CONSTRAINTS
    - as 3 tabelas possuem exatamente as mesmas colunas.
    o que difere uma da outra é o nível de abrangência dos objetos.
    
    SELECT
        CONSTRAINT_NAME,
        TABLE_NAME,
        CONSTRAINT_TYPE,
        SEARCH_CONDITION
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'ALUNO';
    
    
-- ALTER. DROP, RENAME e TRUNCATE


*/













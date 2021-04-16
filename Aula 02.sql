                         -- AULA 02 - 26/03/2021 --

/* 
            -- KAHOOT! SHIFT AULA 01: CONCEITOS INTRODUTÓRIOS --

01. Qual o seriado preferido do professor?
R.: Black Mirror

02. Qual a definição de dados?
R.: Dado é uma unidade básica ou uma representação de informação.

03. Qual das alternativas melhor define o conceito de informação?
R.: A informação pode ser entendida como um conjunto de dados.

04. Qual o significado da sigla SQL, em inglês?
R.: Structured Query Language

05. Através da linguagem SQL é possível:
R.: Todas as alternativas estão corretas.
- Consultaros dados de um SGBD.
- Atualizar, inserir e deletar registro em um SGBD.
- Criar estruturas de tabelas em um SGBD.

06. O SQL pode ser dividido em subconjuntos de comandos, sendo eles:
R.: DML, DDL e DCL.
 - Data Manipulation Language
 - Data Definition Language
 - Data Control Language

07. O SQL é a linguagem padrão dos SGBDRs e...
R.: Dependendo do fornecedor podem existir funções específicas.

08. O conjunto DML, Data Manipulation Language, contempla os comandos:
R.: INSERT, UPDATEE, DELETE e SELECT.

09. O conjunto DDL, Data Definition Language, contempla os comandos:
R.: CREATE, ALTER, DROP e TRUNCATE.

10. O conjunto DCL, Data Control Language, contempla os comandos:
R.: GRANT e REVOKE.

11. Quais são os significados dos 3 Vs do Big Data?
R.: Volume, Velocidade e Variedade.
*/


--------------------------------------------------------------------------------
              
              -- CRIAÇÃO DE OBJETOS (DDL - DATA DEFINITION LANGUAGE) --
/*

- Tipos de Objetos
- Tipos de Dados
- Criação de Tabelas e Constraints
- Exercícios



-- TIPOS DE OBJETOS: SCHEMA OBJECTS (objetos de esquema) --
    - TABLES (TABELAS): organiza os dados em formato bidimensional (colunas e linhas).
    
    - INDEXES (ÍNDICES): estruturas opcionais e lógicas (fisicamente independentes dos dados)
    Podem acelerar o acesso às linhas da tabela.
    
    - PARTITIONS (PARTIÇÕES): permitem decompor as tabelas e os índices que são muito grandes,
    facilitando o gerenciamento dos objetos e melhorando a performance das consultas.
    
    - VIEWS (VISUALIZAÇÕES): representações lógicas de uma ou mais tabelas. São consultas
    armazenadas. (o resultado (view) é armazenado (view materializada) x armazenamento do bloco de código.
    
    - SEQUENCES (SEQUÊNCIAS): objetos que geram números inteiros e sequenciais. Normalmente,
    são utilizados para gerar valores para campos de chave primária.
    
    - PL/SQL: PL (Procedural Language) é uma linguagem de extensão do SQL para o banco Oracle.
    
    
    
-- TIPOS DE OBJETOS: INTEGRITY CONSTRAINTS ("restrições de integridade") --     
    - NOT NULL (não nulo): proíbe inserções ou atualizações de linhas contendo um valor nulo
    (ausência de valor) em uma coluna especificada.
    
    - PRIMARY KEY (chave primária): garante unicidade das linhas, em uma determinada coluna ou
    em uma combinação de colunas, e restringe a inserção de valor nulo.
    
    - UNIQUE KEY (chave única): impede a ocorrência de valores repetidos, 
    mas não proíbe a inserção de valor nulo.
    
    - FOREIGN KEY (chave estrangeira): garante a integridade referencial dos dados. 
    Obriga o relacionamento entre 2 ou mais tabelas que possuem uma ou mais colunas em comum.
    
    - CHECK (verificação): expressão lógica para verificação de regra específica
    (pode ser comparada à condicional IF).
    
    
    
-- TIPOS DE DADOS --
    -- CHARACTERS:
        -- CHAR: tamanho de campo fixo
        -- VARCHAR2: tamanho de campo variável
    -- NUMERICS:
        -- NUMBER(p,s): p = quantidade de números inteiros
                        s = número de decimais
    -- DATES:
        -- DATE: armazena informações de data e hora (ano, mês, dia, hora, minuto e segundo)
        -- TIMESTAMP: extensão do tipo DATE. Armazena os dados de tempo com frações de segundo.





-- CRIAÇÃO DE TABELAS E CONSTRAINTS --
    -- REGRAS PARA NOMES DE OBJETOS --
        os nomes de objetos  no SGBD Oracle deve respeitar as seguintes regras:
        - palavras reservadas (como SELECT, CREATE, UPDATE, TABLE...) não podem ser usadas como nomes de objtos.
        - todos os nomes devem começar com uma letra de A a Z
        - os nomes podem conter: letras, números, _, $  ou #
        - letras minúsculas são convertidas para letras maiúsculas automaticamente durante a criação do  objeto.


    -- DDL  - Data Definition Language --
       
        - CRIAÇÃO DE TABELA SEM CONSTRAINT -
            CREATE TABLE nome_tabela (
                nome_campo TIPO,
                nome_campo TIPO,
                nome_campo TIPO
            );


        - CRIAÇÃO DE TABELA COM CONSTRAINT NOT NULL -
            CREATE TABLE aluno (
                matricula NUMBER NOT NULL,
                nome VARCHAR(200) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE
            );
            
            
        - NOMEANDO UMA RESTRIÇÃO NOT NULL -
            CREATE TABLE aluno (
                matricula NUMBER CONSTRAINT NN_ALUNO_MATRICULA NOT NULL,
                nome VARCHAR2(200) CONSTRAINT NN_ALUNO_NOME NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE
            );
            
            - A definição NOT NULL deve ser, obrigatoriamente definida no nível da coluna.
            - A alteração de uma coluna NOT NULL, em uma tabela existente, só será realizada se a tabela
            não tiver nenhuma linha inserida ou se todas elas estiverem populadas.
            
            
        - CRIAÇÃO DE TABELA COM CONSTRAINT UNIQUE KEY -
            - essa restrição de integridade impõe que cada valor seja exclusivo em uma coluna (chave exclusiva) 
            ou em um conjunto de colunas (chave exclusiva composta)
            - pode ser definida no nível da coluna ou no da tabela.
            
            - NÍVEL DA COLUNA -
            CREATE TABLE materia (
                codigo NUMBER NOT NULL,
                descricao VARCHAR2(200) UNIQUE
            );
            
            - NOMEANDO UMA RESTRIÇÃO UNIQUE KEY -
            CREATE TABLE materia (
                codigo NUMBER CONSTRAINT NN_MATERIA_CODIGO NOT NULL,
                descricao VARCHAR2(200) CONSTRAINT UK_MATERIA_DESCRICAO UNIQUE
            );
        
            - NIVEL DA TABELA -
            CREATE TABLE materia (
                codigo NUMBER CONSTRAINT NN_MATERIA_CODIGO NOT NULL,
                descricao VARCHAR2(200),
                
                CONSTRAINT UK_MATERIA_DESCRICAO UNIQUE(DESCRICAO)
            );
            
            obs: ao criar uma restrição no nível da tabela, o nome da constraint se torna obrigatório.
            
        
        - CRIAÇÃO DE TABELA COM CONSTRAINT PRIMARY KEY -
            - a chave primária é uma coluna, ou um conjunto de colunas, que identifica
            exclusivamente cada registro de uma tabela.
            - essa restrição também assegura que nenhuma coluna que seja parte da chave primária seja nula.
            - pode ser definida no nível da coluna ou no da tabela.
           
            - NÍVEL DA COLUNA - 
            CREATE TABLE materia (
                codigo NUMBER PRIMARY KEY,
                descricao VARCHAR2(200) UNIQUE
            );
            
            - NOMEANDO UMA RESTRIÇÃO PRIMARY KEY -
            CREATE TABLE materia (
                codigo NUMBER CONSTRAINT PK_MATERIA_CODIGO PRIMARY KEY,
                descricao VARCHAR2(200) CONSTRAINT UK_MATERIA_DESCRICAO UNIQUE
            );
            
            - NÍVEL DA TABELA -
            CREATE TABLE materia (
                codigo NUMBER,
                sigla  CHAR(2),
                descricao VARCHAR2(200) UNIQUE,
                CONSTRAINT PK_MATERIA_CODIGO_SIGLA PRIMARY KEY (CODIGO, SIGLA)
            );
            
        - CRIAÇÃO DE TABELA COM CONSTRAINT CHECK -
            - define uma condição que devee ser atendida a cada registro.
            - podem ser utilizados operadores de comparação (>, <, >=, <=, IN, NOT IN, NOT BETWEEN, BETWEEN, =, <>).
            - pode ser definida no nível da coluna ou no da tabela.
            
            - NÍVEL DA COLUNA -
            CREATE TABLE aluno (
                matricula NUMBER,
                nome VARCHAR2(30),
                sexo CHAR(1) CHECK (SEXO IN('M', 'F'))
            );
            
            - NOMEANDO UMA RESTRIÇÃO CHECK - 
            CREATE TABLE aluno (
                matricula NUMBER,
                nome VARCHAR2(30),
                sexo CHAR(1) CONSTRAINT CK_ALUNO_SEXO CHECK (SEXO IN ('M', 'F')
            );
            obs: embora o Oracle não seja case sensitive em sua sintaxe, os valores 'm'e 'f' não serão aceitos.
            
            - NÍVEL DA TABELA
            CREATE TABLE aluno (
                matricula NUMBER,
                nome VARCHAR2(30),
                sexo CHAR(1),
                CONSTRAINT CK_ALUNO_SEXO CHECK (SEXO IN ('M', 'F'))
            );
            
            
        - CRIAÇÃO DE TABELA COM CONSTRAINT FOREIGN KEY -
            - restrição de integridade referencial que designa uma coluna ou uma combinação de colunas como
            chave estrangeira e estabelece um relacionamento entre a chave primária ou uma chave exclusiva, na mesma
            tabela ou em um tabela diferente.
            - o valor de chave estrangeira deve corresponder ao valor existente na tabela-mãe.
            - as chaves estrangeiras são baseadas nos valores dos dados, sendo uma relação lógica e não física.
            - essa restrição pode ser definida no nível da coluna ou no da tabela.
            
            - NÍVEL DA COLUNA - 
            CREATE TABLE aluno  (
                matricula NUMBER PRIMARY KEY,
                nome VARCHAR2(30),
                sexo CHAR(1) CHECK (SEXO IN('M', 'F'))
            );
            
            CREATE TABLE CELULAR (
                cod_celular NUMBER PRIMARY KEY,
                numero VARCHAR(10) UNIQUE,
                matricula NUMBER(3) REFERENCES ALUNO(MATRICULA)
            );
            
            
            - NOEMANDO UMA RESTRIÇÃO FOREIGN KEY -
            CREATE TABLE celular (
                cod_celular NUMBER CONSTRAINT PK_CELULAR_COD_CELULAR PRIMARY KEY,
                numero VARCHAR2(10) CONSTRAINT UK_CELULAR_NUMERO UNIQUE,
                matricula NUMBER(3) CONSTRAINT FK_CELULAR_ALUNO_MATRICULA REFERENCES ALUNO (MATRICULA)
            );
            obs: lembrando que a tabela ALUNO deve ser criada antes da CELULAR.
            
            - NIVEL DA TABELA -
            CREATE TABLE celular (
                cod_celular NUMBER PRIMARY KEY,
                numero VARCHAR2(70) UNIQUE,
                cpf VARCHAR2(74),
                matricula NUMBER(3)
                CONSTRAINT FK_CELULAR_ALUNO_CPF_MATRICULA FOREIGN KEY (CPF, MATRICULA) REFERENCES ALUNO (CPF, MATRICULA)
            );
*/

-- Exercícios



create table PRIMEIRA_TABELA (
    COLUNA_01 char(1)
);


create table TBL_CLIENTE (
    NOME VARCHAR2(100),
    SEXO CHAR(1),
    RG NUMBER
);

create table ALUNO (
    MATRICULA NUMBER,
    NOME VARCHAR2(200),
    SEXO CHAR(1),
    DATA_NASC DATE
)

drop table ALUNO

create table ALUNO (
    MATRICULA NUMBER NOT NULL,
    NOME VARCHAR2(200) NOT NULL,
    SEXO CHAR(1),
    DATA_NASC DATE
);

DESCRIBE ALUNO

SELECT * FROM ALUNO


insert into ALUNO
    values (1010, 'Cintia', 'F', '19-04-1986')
    
SELECT * FROM ALUNO


-- alterar formato de data
-- alter session set NLS_DATE_FORMAT='DD/MM/YYYY';

-- tentativa de inserir com matrícula NULL
insert into ALUNO
    values(NULL, 'Izumi', 'F', '19-04-1986)
    
insert into ALUNO
    values (1011, 'Izumi', NULL, '19-04-1986')
    
select * from ALUNO


-- exibe todas as constraints
select * from USER_CONSTRAINTS

-- nomeando uma constraint NOT NULL

drop table ALUNO

create table ALUNO (
    MATRICULA NUMBER CONSTRAINT NN_ALUNO_MATRICULA NOT NULL,
    NOME VARCHAR2(200) CONSTRAINT NN_ALUNO_NOME NOT NULL,
    SEXO CHAR(1),
    DATA_NASC DATE
);

select * from USER_CONSTRAINTS



select * from ALUNO



-- unique key

create table MATERIA(
    CODIGO NUMBER NOT NULL,
    DESCRICAO VARCHAR2(200) UNIQUE
);

select * from MATERIA

insert into MATERIA
    values (10, 'BI');
    
insert into MATERIA
    values (11, 'BI');
    
    
drop table MATERIA


create table MATERIA(
    CODIGO NUMBER NOT NULL,
    DESCRICAO VARCHAR2(200) CONSTRAINT UK_MATERIA_DESCRICAO UNIQUE
);


-- CONSTRAINT NO NÍVEL DA TABELA
create table MATERIA(
    CODIGO NUMBER,
    SIGLA CHAR(2),
    DESCRICAO VARCHAR2(200) UNIQUE,
    CONSTRAINT PK_MATERIA_CODIGO_SIGLA PRIMARY KEY (CODIGO, SIGLA
);


-- CONSTRAINT PRIMARY KEY (PK)

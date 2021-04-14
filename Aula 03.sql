

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



----------------------------------------------------------------------
-- ALTER TABLE --

---------------------------------------------DATABASE DDL---------------------------------------------

CREATE DATABASE SUCOS_VENDAS_01;

CREATE DATABASE SUCOS_VENDAS_02
    ON (NAME = SUCOS_VENDAS_DAT, 
    FILENAME = 'C:\TEMP\DATA\SALES_VENDAS_02.MDF', --Nome do arquivo do banco e onde será criado MDF é o nome para o tipo de arquivos de banco de dados do SQL Server
    SIZE = 10, --Tamanho do banco de dados inicial em  MB
    MAXSIZE = 50, --Tamanho máximo do banco em MB
    FILEGROWTH = 5) --Vai aumentar o seu tramanho em 5 em 5 MB
LOG ON (NAME = SUCOS_VENDAS_LOG, 
	FILENAME = 'C:\TEMP\DATA\SALES_VENDAS_02.LDF', --Nome do arquivo de LOG e onde será criado LDF é o nome data para o tipo de arquivos de log
    SIZE = 10, 
    MAXSIZE = 50, 
    FILEGROWTH = 5);

DROP DATABASE SUCOS_VENDAS_01;

---------------------------------------------TABLE DDL---------------------------------------------

CREATE TABLE [TABELA DE VENDEDORES]
( [MATRICULA] varchar(5),
[NOME] varchar(100),
[PERCENTUAL COMISSÃO] float);

ALTER TABLE [TABELA DE VENDEDORES]
ALTER COLUMN [MATRICULA]
VARCHAR(5) NOT NULL

ALTER TABLE [TABELA DE VENDEDORES]
ADD CONSTRAINT PK_VENDEDORES PRIMARY KEY CLUSTERED ([MATRICULA]); 

ALTER TABLE [TABELA DE VENDEDORES]
ADD CONSTRAINT PK_VENDEDORES PRIMARY KEY CLUSTERED ([MATRICULA], [NOME]); --Chave composta



DROP TABLE [TABELA DE VENDEDORES 02];

---------------------------------------------DML---------------------------------------------

INSERT INTO [TABELA DE VENDEDORES]
([MATRICULA], [NOME], [PERCENTUAL COMISSÃO])
VALUES
('00233', 'João Geraldo da Fonseca',  0.10);

UPDATE [TABELA DE VENDEDORES] SET [NOME] = 'José Geraldo da Fonseca Junior'
WHERE [MATRICULA] = '00233';

DELETE FROM [TABELA DE VENDEDORES] WHERE [MATRICULA] = '00233';

SELECT * FROM [TABELA DE VENDEDORES] WHERE [NOME] = 'Cláudia Morais'

SELECT * FROM [TABELA DE VENDEDORES] WHERE YEAR([DATA ADMISSÃO]) >= 2016
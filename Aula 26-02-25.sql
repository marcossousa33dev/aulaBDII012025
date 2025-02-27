#Aula de Banco de Dados II
#Comandos DDL (Data Definition Language - Create e Drop)
#Create database (Criar Banco de Dados)
create database aulaBDII;

#Use database (Selecionar o banco de dados)
use aulaBDII;

#Drop database (Apagar o Banco de Dados)
drop database aulaBDII;

#Create table (Criar tabela(s))
create table tbl_carro(
	chassi      char(17) primary key,
    marca       varchar(20),
    modelo      varchar(20),
    anocarro    integer,
    anomodelo   integer,
    carroceria  varchar(10),
    cor         varchar(15),
    nroportas   integer, 
    transmissao varchar(15),
    motorizacao varchar(10),
    tracao      varchar(10)
);

#Criar tabelas com chaves estrangeira
#Dropar a tabela
drop table tbl_carro;

#Criar a tabela marca
create table tbl_marca(
	codigo    int auto_increment primary key,
    descricao varchar(20)
);

#Criar a tabela modelo
create table tbl_modelo(
	codigo    int auto_increment primary key,
    descricao varchar(20)
);

#Criar a tabela carroceria
create table tbl_carroceria(
	codigo    int auto_increment primary key,
    descricao varchar(20)
);

#Criar a tabela cor
create table tbl_cor(
	codigo    int auto_increment primary key,
    descricao varchar(20)
);

#Criar a tabela transmissao
create table tbl_transmissao(
	codigo    int auto_increment primary key,
    descricao varchar(20)
);

#Criar a tabela motorizacao
create table tbl_motorizacao(
	codigo    int auto_increment primary key,
    descricao varchar(20)
);

create table tbl_carro(
	chassi         char(17) primary key,
    placa          char(08), 
    codmarca       int, #Virar tabela (Matamos)
    codmodelo      int, #Virar tabela (Matamos)
    anocarro       int,
    anomodelo      int,
    codcarroceria  int, #Virar tabela (Matamos)
    codcor         int, #Virar tabela (Matamos)
    nroportas      int, 
    codtransmissao int, #Virar tabela (Matamos)
    codmotorizacao int, #Virar tabela (Matamos)
    tracao         varchar(10),
    constraint foreign key(codmarca) references tbl_marca(codigo), 
    constraint foreign key(codmodelo) references tbl_modelo(codigo),
    constraint foreign key(codcarroceria) references tbl_carroceria(codigo),
    constraint foreign key(codcor) references tbl_cor(codigo),    
    constraint foreign key(codtransmissao) references tbl_transmissao(codigo),
    constraint foreign key(codmotorizacao) references tbl_motorizacao(codigo), 
    unique(placa)
);

#Comandos DML (Data Manipulation Language - Insert, Update, Delete, Select)
#Popular as tabelas auxiliares
-- Inserindo marcas
INSERT INTO tbl_marca (descricao) VALUES 
('Toyota'), ('Honda'), ('Ford'), ('Chevrolet'), ('Volkswagen');

-- Inserindo modelos
INSERT INTO tbl_modelo (descricao) VALUES 
('Corolla'), ('Civic'), ('Focus'), ('Onix'), ('Golf');

-- Inserindo carrocerias
INSERT INTO tbl_carroceria (descricao) VALUES 
('Sedan'), ('Hatch'), ('SUV');

-- Inserindo cores
INSERT INTO tbl_cor (descricao) VALUES 
('Preto'), ('Branco'), ('Prata'), ('Vermelho'), ('Azul');

-- Inserindo transmissões
INSERT INTO tbl_transmissao (descricao) VALUES 
('Manual'), ('Automática');

-- Inserindo motorizações
INSERT INTO tbl_motorizacao (descricao) VALUES 
('1.0'), ('1.6'), ('2.0');

#Popular a tabela de carro
INSERT INTO tbl_carro (
    chassi, placa, codmarca, codmodelo, anocarro, anomodelo, 
    codcarroceria, codcor, nroportas, codtransmissao, codmotorizacao, tracao
) VALUES 
('1HGCM82633A000001', 'ABC-1D23', 1, 1, 2020, 2021, 1, 1, 4, 2, 3, 'Dianteira'),
('1HGCM82633A000002', 'XYZ-9K87', 2, 2, 2021, 2022, 1, 2, 4, 1, 2, 'Dianteira'),
('1HGCM82633A000003', 'LMN-4H56', 3, 3, 2019, 2020, 2, 3, 4, 2, 1, 'Dianteira'),
('1HGCM82633A000004', 'JKL-5T89', 4, 4, 2022, 2023, 2, 4, 4, 2, 2, 'Dianteira'),
('1HGCM82633A000005', 'OPQ-3R12', 5, 5, 2018, 2019, 2, 5, 4, 1, 3, 'Dianteira'),
('1HGCM82633A000006', 'UVW-6M34', 1, 1, 2023, 2024, 3, 1, 4, 2, 3, 'Traseira'),
('1HGCM82633A000007', 'RST-7P90', 2, 2, 2021, 2022, 3, 2, 4, 1, 2, 'Dianteira'),
('1HGCM82633A000008', 'GHI-8L23', 3, 3, 2019, 2020, 3, 3, 4, 2, 1, 'Traseira'),
('1HGCM82633A000009', 'DEF-2W67', 4, 4, 2022, 2023, 1, 4, 4, 2, 2, 'Dianteira'),
('1HGCM82633A000010', 'MNO-9X45', 5, 5, 2018, 2019, 1, 5, 4, 1, 3, 'Traseira');

#Usando a DDL (Data Definition Language) para Alter Table
alter table tbl_carro add renavam char(11); #adiciono
alter table tbl_carro drop renavam; #removo
alter table tbl_carro add renavam char(11) after placa; #posição
alter table tbl_carro modify renavam char(17); #mudar tamanho
alter table tbl_carro modify tracao varchar(10) after chassi;#mudar posição
alter table tbl_carro change column placa placaveiculo char(8); 

#Mudar o nome da tabela
alter table tbl_cor rename to tbl_cores;

#Mostrar as tabelas
show tables;

#Mostrar estrutura da tabela
desc tbl_carro;

#Voltando para a DML (Data Manipulation Language)
#Update
update tbl_carro set placaveiculo = "DXX-8147", anocarro = 2021
where chassi = '1HGCM82633A000001';

#Delete
delete from tbl_carro 
where chassi = '1HGCM82633A000001';

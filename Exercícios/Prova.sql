create database VoeBem;
Use VoeBem;
create table Compainha(
Cod_cia int primary key auto_increment,
nome_comp varchar (30), 
sigla varchar(5)
);

create table Piloto(
codigo_piloto int primary key auto_increment,
nome_piloto varchar(50),
salario numeric(9,2),
gratificacao numeric(7,2),
cod_cia int,
pais varchar (15),
foreign key (cod_cia) references Compainha(cod_cia)
);

create table Aeroporto(
codigo_aeroporto varchar(3) primary key,
nome_aeroporto varchar (100),
cidade varchar (50),
pais varchar (15)
);

create table Voo(
codigo_voo varchar(6) primary key,
aeroporto_origem varchar (3),
aeroporto_destino varchar(3),
hora time,
foreign key (aeroporto_origem) references Aeroporto(cod_aeroporto),
foreign key (aeroporto_destino) references Aeroporto(cod_aeroporto)
);

create table Escala(
Cod_voo varchar(6),
data_voo date primary key,
cod_piloto int,
aviao varchar(30),
foreign key (Cod_voo) references Voo(Cod_voo),
foreign key (cod_piloto) references Piloto(cod_piloto)
);

insert 


insert into Compainha(nome_comp, sigla) values
('TAM linhas aéreas','TAM'),
('GOL linhas aéreas', 'GOL'),
('TAP linhas aéreas', 'TAP');

select * from piloto;

insert into Piloto(nome_piloto, salario, gratificacao, cod_cia, pais) values
(




#A)
create database VoeBem;
Use VoeBem;
create table Compainha(
Cod_cia int primary key auto_increment,
nome_comp varchar (30), 
sigla varchar(5)
);
#B)

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
foreign key (aeroporto_origem) references Aeroporto(codigo_aeroporto),
foreign key (aeroporto_destino) references Aeroporto(codigo_aeroporto)
);

create table Escala(
Codigo_voo varchar(6),
data_voo date primary key,
codigo_piloto int,
aviao varchar(30),
foreign key (Codigo_voo) references Voo(Codigo_voo),
foreign key (codigo_piloto) references Piloto(codigo_piloto)
);

#C

use VoeBem;
insert piloto(email varchar30);


Alter table	Aeroporto modify cidade  cidade_aeroporto;

#D
Alter table	Compainha modify nome_comp varchar(40);

#2
insert into Compainha(nome_comp, sigla) values
('TAM linhas aéreas','TAM'),
('GOL linhas aéreas', 'GOL'),
('TAP linhas aéreas', 'TAP');

insert into Piloto(nome_piloto, salario, gratificacao, cod_cia, pais) values
('Roberto Carlos',5000,2000,1,'Brasil'),
('Rafael Marinho',6000,3000,2,'Brasil'),
('Marcos Jose',4000,1000,3,'Brasil'),
('Daniel Oliveira',4000,1500,1,'Brasil');

insert into voo(codigo_voo,aeroporto_origem, aeroporto_destino, hora ) values
('A200','001','002',07am),
('A100','002','003',12pm),
('A300','003','001',11pm),
('A400','003','002',04am),
('A500','001','003',07am),
('A600','001','002',11am);

insert into Escala(Codigo_voo, data_voo, codigo_piloto, aviao ) values
('A200',2018-05-12,1,'Boeing 385'),
('A100',2018-05-12,4,'Boeing 385'),
('A300',2018-05-13,2,'AirBus 232'),
('A400',2018-06-14,3,'AirBus 123'),
('A500',2018-06-15,1,'AirBus 123'),
('A600',2018-06-17,2,'Boeing 385');

insert into Aeroporto(codigo_aeroporto, nome_aeroporto , cidade, pais ) values
('001', 'Tancredo Neves','confins','Brasil'),
('002','Internacional de São Paulo - Guarulhos', 'Guarulhos','Brasil'),
('003', 'Cesar Bombonato','Uberlândia', 'Brasil');


select * from escala;
#3
#a
select * from p.piloto
from piloto p join compainha c on p.cod_cia=c.cod.cia
where c.sigla='TAM' or c.sigla='TAP';

#b
select a.nome_aeroporto, v.hora
from voo v join aeroporto A on v.aeroporto_destino=a.aeroporto_destino
where codigo_voo='A200';

#c
select v.codigo_voo, v.data_voo, v.hora
from voo v join aeroporto A on v.aeroporto_destino=a.aeroporto_destino
where a.cidade='guarulhos';

#d
select v.aeroporto_destino, v.hora
from voo v join aeroporto A on v.aeroporto_destino=a.aeroporto_destino join aeroporto a2 on v.aeroporto_origem=a2.aeroporto_origem
where v.aeroporto_origem='Uberlândia' and v.hora>=12pm and v.hora>12am;

#E
select count(v.codigo_voo)
from voo v join aeroporto A on v.aeroporto_destino=a.aeroporto_destino join escala E on v.codigo_voo=e.codigo_voo
where a.aeroporto_destino='Uberlândia' and month(e.data_voo)>=5 and month(e.data_voo)<=6;

#F
select p.nome_piloto,c.sigla,v.codigo_voo, e.data_voo, a.aeroporto_destino,
Piloto compainha voo








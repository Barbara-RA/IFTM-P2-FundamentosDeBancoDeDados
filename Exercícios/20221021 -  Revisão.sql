create database Clinica;

create table medico(
codm int primary key auto_increment,
nomem varchar(30),
especialidade varchar(30),
sexo varchar(1),
dt_nasc date
);

create table Paciente(
Codp int primary key auto_increment,
nomep varchar (30),
dt_nasc date,
problema varchar (30),
sexo varchar(1)
);

create table Consulta(
codc int primary key auto_increment,
codm int,
codp int,
data_consulta date,
hora_consulta time,
valor_consulta float,
foreign key (codm) references Medico(codm),
foreign key (codp) references Paciente(codp)
);

insert into medico(nomem, especialidade,sexo,dt_nasc) values
('Claudia Avila', 'Ginecologista', 'F', '1960-08-10'),
('Claudio Felix', 'Oftalmologista', 'M', '1970-01-02'),
('Luciano Fernandes', 'Ginecologista', 'M', '1980-03-04'),
('Manoel Jose', 'Cardiologista', 'M', '1964-11-15'),
('Marcos Paulo', 'Neurologista', 'M', '1975-07-12'),
('Maria Jose', 'Cardiologista', 'F', '1974-12-13'),
('Roberto Carlos', 'Neuropediatra', 'M', '1977-06-05');

insert into paciente(nomep, dt_nasc, problema, sexo) value
('Maria Paula', '1960-08-19','Cardiaco', 'F'),
('Maria do Carmo', '1979-03-10','Hipertensao', 'F'),
('Luiz Inacio', '1950-01-12', 'Diabetes', 'M'),
('Carolina Freitas', '1985-11-05','Miopia', 'F'),
('Luiz Marcelo', '1973-05-15', 'Cardiaco', 'M'),
('Luciano Fernandes', '1980-03-04','Cardiaco', 'M');

insert into consulta(codm, codp,data_consulta,hora_consulta, valor_consulta) values
(1, 2, '2017-06-10', '16:00:00', 150.00),
(3, 1, '2017-06-15', '14:00:00', 180.00),
(3, 2, '2017-06-22', '14:00:00', 150.00),
(1, 1, '2017-06-25', '16:00:00', 150.00),
(4, 5, '2017-06-27', '15:00:00', 130.00),
(2,4, '2017-07-10', '13:00:00', 180.00),
(1, 2, '2017-07-12', '15:00:00', 180.00),
(4, 5, '2017-07-14', '14:00:00', 150.00),
(5, 3, '2017-07-17', '16:30:00', 130.00),
(5, 2, '2017-07-20', '15:00:00', 180.00),
(6, 4, '2017-07-23', '14:00:00', 150.00),
(6, 6, '2017-07-25', '15:00:00', 140.00),
(3, 2, '2017-08-22', '13:00:00', 180.00),
(1, 1, '2017-08-25', '13:00:00', 180.00),
(4, 5, '2018-01-22', '13:00:00', 250.00),
(5, 3, '2018-01-25', '13:00:00', 230.00),
(6, 4, '2019-06-22', '13:00:00', 300.00),
(1, 2, '2019-06-25', '13:00:00', 300.00);

use clinica;
#2a)
select sum(c.valor_consulta)
from medico M join Consulta C on m.codm=c.codm 
where m.sexo='F' and year(c.data_consulta)= 2017 and month(c.data_consulta)=7;

#2b)
select max(valor_consulta),min(valor_consulta), avg(valor_consulta)
from Consulta
where year(data_consulta)= 2017 and month(data_consulta)=6 or month(data_consulta)=7;

#2c)
select count(*), p.nomep
from Consulta c join Paciente p on C.codp=p.codp
where (p.problema)= 'Hipertensao'
group by p.nomep;

#2d)
select count(*)
from Consulta c join Medico m on C.codm=m.codm
where year(data_consulta)= 2017 and m.especialidade= 'neurologista';

#2e)
select sum(c.valor_consulta)
from Consulta c join Medico m on C.codm=m.codm
where year(data_consulta)= 2017 and month(data_consulta)=7 and m.nomem= 'Maria Jose';

#2f)
select p.nomep,m.nomem, c.data_consulta, c.hora_consulta
from Consulta c join Medico m on C.codm=m.codm join Paciente p on p.codp=c.codp
where year(data_consulta)= 2017 and month(data_consulta)=6;
 Use clinica;
 #3a)
select m.nomem, year(c.data_consulta),count(*)
from Consulta c join Medico m on c.codm=m.codm
group by 1,2;

#3b)
select m.especialidade, sum(c.valor_consulta)
from Consulta c join Medico m on c.codm=m.codm
group by m.especialidade
order by c.valor_consulta desc;
use clinica;
#3c)
select month(c.data_consulta),m.nomem, sum(c.valor_consulta)
from Consulta c join Medico m on c.codm=m.codm
group by month(c.data_consulta), m.nomem
order by m.nomem;

#3d)
select m.nomem Nome, year(c.data_consulta) Ano, count(c.codc) Qtd_Consulta, avg(valor_consulta) Media_Vlr
from Consulta c join Medico m on c.codm=m.codm
group by m.nomem, year(c.data_consulta);

#3e)
select problema, count(codp)
from paciente
group by 1;

#3f)
select m.nomem Nome, max(c.valor_consulta) Maior_Vlr_consulta, min(c.valor_consulta) Menor_Vlr_consulta
from Consulta c join Medico m on c.codm=m.codm
where year(c.data_consulta)=2017
group by m.nomem;

#3g)
select m.nomem Nome, count(c.codc) Qtd_consulta
from Consulta c join Medico m on c.codm=m.codm
group by m.nomem
order by m.nomem asc;

#3h)
select m.nomem Nome, count(c.codc) Qtd_consulta, avg(c.valor_consulta) Media_consultas
from Consulta c join Medico m on c.codm=m.codm
where year(data_consulta)=2017
group by m.nomem
having count(*)>1;

#3i)
select m.nomem Medico, year(data_consulta) Ano, sum(c.valor_consulta) Total_consultas
from Consulta c join Medico m on c.codm=m.codm
group by Medico, ano
having avg(c.valor_consulta)>145 and count(c.codc)>1;

#3j)
select m.especialidade, min(valor_consulta), max(valor_consulta)
from Consulta c join Medico m on c.codm=m.codm
group by 1;

#3k)
select m.especialidade Medico, sum(valor_consulta)
from Consulta c join Medico malocacao on c.codm=m.codm
group by 1;

#3l)
select p.nomep Paciente, year(data_consulta) Ano, sum(valor_consulta) Total
from Consulta c join paciente p on c.codp=p.codp
group by p.codp,2;

#3m)
select p.sexo Paciente, count(valor_consulta) Qtd_cons, sum(valor_consulta) Total
from Consulta c join paciente p on c.codp=p.codp
group by 1;





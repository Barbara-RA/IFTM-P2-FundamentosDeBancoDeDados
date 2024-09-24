create database Clinica02;
use Clinica02;
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

create table consulta(
codc int primary key auto_increment ,
codm int,
codp int,
data_consulta date,
hora_consulta time,
valor_consulta float,
foreign key (codm) references Medico(codm),
foreign key (codp) references paciente(codp)
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


select sum(c.valor_consulta)
from consulta c join medico m on c.codm=m.codm
where m.sexo='f' and month(data_consulta)=7 and year(data_consulta)=2017;

select max(c.valor_consulta), min(c.valor_consulta),avg(c.valor_consulta)
from consulta c join medico m on c.codm=m.codm
where year(data_consulta)=2017 and month(data_consulta)=7 or  month(data_consulta)=6 ;

select count(c.codc)
from consulta c join paciente p on c.codp=p.codp
where p.problema='hipertensao';

select count(c.codc)
from consulta c join medico m on c.codm=m.codm
where m.especialidade='neurologista' and year(c.data_consulta)=2017;

select sum(c.valor_consulta)
from consulta c join medico m on c.codm=m.codm
where m.nomem='maria jose' and year(data_consulta)=2017 and month(data_consulta)=7;

select p.nomep, m.nomem, c.data_consulta,c.hora_consulta
from consulta c join medico m on c.codm=m.codm join paciente p on c.codp=p.codp
where month(data_consulta)=6 and year(data_consulta)=2017;

select m.nomem, year(data_consulta), count(codc)
from consulta c join medico m on c.codm=m.codm
group by 1,2;

select m.especialidade, sum(valor_consulta)
from consulta c join medico m on c.codm=m.codm
group by 1
order by 2 desc;

select month(c.data_consulta), m.nomem, sum(c.valor_consulta)
from consulta c join medico m on c.codm=m.codm
group by 1,2;

use clinica02;

select m.nomem, year(c.data_consulta), count(c.codc),avg(c.valor_consulta)
from consulta c join medico m on c.codm=m.codm
group by 1,2
order by 1;

select problema, count(codp)
from paciente
group by 1;

select m.nomem, max(c.valor_consulta),min(c.valor_consulta)
from consulta c join medico m on c.codm=m.codm
where year(c.data_consulta)=2017
group by 1;

select m.nomem, count(c.codp)
from consulta c join medico m on c.codm=m.codm
group by 1
order by 1 asc;

select m.nomem, count(c.codc), avg(c.valor_consulta)
from consulta c join medico m on c.codm=m.codm
where year(c.data_consulta)=2017
group by 1
having count(*)>1;

select m.nomem, year(c.data_consulta), sum(c.valor_consulta)
from consulta c join medico m on c.codm=m.codm
group by 1,2
having avg(c.valor_consulta)>145 and count(c.codc)>1;




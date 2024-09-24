create database Clinica2; -- cria o banco de dados
use Clinica2;/* comentário de bloco
*/

create Table medico (
    codm int auto_increment primary key,
    nomem varchar(50),
    especialidade varchar(30),
    sexo char(1),
    dt_nasc date
);

create table paciente (
    codp int auto_increment primary key,
    nomep varchar(50),
    dt_nasc date,
    problema varchar(50),
    sexo char(1)
);



create table consulta (
    codc int auto_increment primary key,
    codm int,
    codp int,
    dt_consulta date,
    hora_consulta time,
    valor_consulta Numeric(9,2 ),
    foreign key (codm)
        references medico (codm),
    foreign key (codp)
        references paciente (codp)
);


insert into medico( nomem, especialidade, sexo, dt_nasc) values

('Claudia Avila', 'Ginecologista', 'F','1960-08-10'),
('Claudio Felix', 'Oftalmologista', 'M', '1970-01-02'),
('Luciano Fernandes', 'Ginecologista', 'M', '1980-03-04'),
('Manoel Jose', 'Cardiologista', 'M', '1964-11-15'),
('Marcos Paulo', 'Neurologista', 'M', '1975-07-12'),
('Maria Jose', 'Cardiologista', 'F', '1974-12-13'),
('Roberto Carlos', 'Neuropediatra', 'M', '1977-06-05');


insert into paciente ( nomep, dt_nasc, problema, sexo) values
('Maria Paula', '1960-08-19','Cardiaco', 'F'),
('Maria do Carmo', '1979-03-10','Hipertensao', 'F'),
('Luiz Inacio', '1950-01-12', 'Diabetes', 'M'),
('Carolina Freitas', '1985-11-05','Miopia', 'F'),
('Luiz Marcelo', '1973-05-15', 'Cardiaco', 'M'),
('Luciano Fernandes', '1980-03-04','Cardiaco', 'M');


insert into consulta (codm,codp,dt_consulta,hora_consulta,valor_consulta) values
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
(4,5,'2018-01-22','13:00:00',250.00),
(5,3,'2018-01-25','13:00:00',230.00),
(6, 4, '2019-06-22', '13:00:00', 300.00),
(1, 2, '2019-06-25', '13:00:00', 300.00);

use Clinica2;

update consulta
set valor_consulta= valor_consulta*1.1
where month(dt_consulta)=06 and year (dt_consulta)=2019 and codm in(
select codm
from medico m
where m.especialidade='Cardiologista');

SET SQL_SAFE_UPDATES = 0;

use Clinica2;
update consulta c, medico m
set c.valor_conslta=c.valor_consulta*1.1
where c.codm=m.codm and 
month(c.dt_consulta)=6 and year(c.dt_consulta)= 2019 and m.especialidade='Cardiologista';
# errooooooooooo


use empresa;
update tabcargo
set salario=salario*1.15
where nivel='JR';

select * from tabcargo;

update tabfuncionario
set nome='Maria Silveira Pereira'
where nome='Maria Silveira';

update tabdepartamento
set sigla= concat('D',sigla);

delete from tabdepartamento
where nome in ('Marketing','Logistica') ;

use Clinica2;

delete from consulta
where codm IN (
	select codm
    from medico
    where nomem='Luciano Fernandes' AND dt_consulta >'2017-06-30');
    
delete c.*
from consulta c, medico m
where c.codm=m.codm and m.nomem='Luciano Fernandes' 
and c.dt_consulta >'2017-06-30';

Use empresa;
create table TB_DadosEmpresa as
Select f.nome nomef, c.nome nome_cargo, c.nivel, d.nome nome_depto
from tabfuncionario f, tabdepartamento d, tabcargo c
where c.cod_cargo=f.cod_cargo and
d.cod_depto=f.cod_depto;

create temporary table TempDadosEmpresa as
Select f.nome nomef, c.nome nome_cargo, c.nivel, d.nome nome_depto
from tabfuncionario f, tabdepartamento d, tabcargo c
where c.cod_cargo=f.cod_cargo and
d.cod_depto=f.cod_depto;

select * from TempDadosEmpresa;
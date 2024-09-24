use empresa;

insert into tabdepartamento(cod_depto,nome,sigla) values
(4,'Comercial','COM');

insert into tabcargo(cod_cargo,nome,nivel,salario) values
(6,'Analista de Sistemas','Pleno',3500),
(7,'Desenvolvedor','Senior',6500);

Select d.nome
From tabdepartamento d, tabfuncionario f
Where d.cod_depto IN (
Select f.cod_depto
From tabfuncionario
);

select nome, nivel
from tabcargo
where Cod_cargo in (
select Cod_cargo
from tabfuncionario
);

select nome, nivel
from tabcargo
where Cod_cargo not in (
select Cod_cargo
from tabfuncionario
);

select f.nome,f.sexo,d.nome
from tabfuncionario f, tabdepartamento d
where f.Cod_depto=d.Cod_depto;

#Listar o nome dos departamentos que não possuem funcionários
select d.nome, nivel
from tabcargo
where Cod_cargo not in (
select Cod_cargo
from tabfuncionario
);

select f.nome, f.sexo
from tabfuncionario f
where f.cod_cargo=(
select c.cod_cargo
from tabcargo c
where c.nome='Desenvolvedor' and c.nivel='pleno');

select *
from tabfuncionario f
where f.cod_cargo !=(
select c.cod_cargo
from tabcargo c
where c.nome ='Atendente');

select nome, sexo, Data_adm
from tabfuncionario
where data_adm > (
select data_adm
from tabfuncionario
where nome='Gabriel Pereira');

select *
from tabfuncionario
where Data_adm = (
select max(Data_adm)
from tabfuncionario);

select f.*
from tabfuncionario f, tabcargo c
where f.cod_cargo= c.cod_cargo and c.salario =(
select min(salario) 
from tabcargo c);

select f.*
from tabfuncionario f, tabcargo c, tabdepartamento d
where f.cod_depto=d.cod_depto and f.cod_cargo=c.cod_cargo and c.salario = (
select min(c.salario) 
from tabcargo c, tabfuncionario f, tabdepartamento d
where f.cod_depto=d.cod_depto and f.cod_cargo=c.cod_cargo
and d.nome='Informática') 
and f.cod_depto= (select Cod_depto from tabdepartamento 
where nome='informatica');


select f.*
from tabfuncionario f, tabcargo c
where f.cod_cargo=c.Cod_cargo and c.salario =(
select max(c.salario)
from tabcargo c, tabfuncionario f
where f.cod_cargo=c.Cod_cargo and f.sexo='F')
and f.sexo='F';

select d.*
from tabdepartamento d
where exists (
	select*
    from tabfuncionario f
    where d.Cod_depto=f.cod_depto);
    
select c.*
from tabcargo c
where not exists (
	select*
    from tabfuncionario f
    where c.Cod_cargo=f.cod_cargo);
    
insert into
tabdepartamento(cod_depto,nome,sigla) values
(5,'Marketing','MKT'),
(6,'Logística','LOG');

create table funcionario_dep_inf (
cod_func int primary key auto_increment ,
nome varchar(50),
data_adm date,
sexo Char,
cod_cargo int,
foreign key (cod_cargo) references Tabcargo(cod_cargo)
);

insert into funcionario_dep_inf (cod_func, nome, data_adm, sexo, cod_cargo)
select f.cod_func,f.nome,f.data_adm, f.sexo, f.cod_cargo
from tabfuncionario f, tabdepartamento d
Where f.cod_depto=d.cod_depto and d.nome='Informatica';

select* from funcionario_dep_inf;

create table custo_cargo(
cod_cargo int auto_increment,
nome varchar(40),
Nivel varchar(20),
custo_efetivo float,
Primary key(cod_cargo)
);

select* from custo_cargo;

Insert into
custo_cargo(cod_cargo,nome,nivel,custo_efetivo)
Select cod_cargo,nome,nivel,(salario*2.1)
From tabcargo;

SET SQL_SAFE_UPDATES = 0;
update tabcargo 
set nome='Gerente Contabil'
where nome='Contador';

update tabcargo 
set nome='Assistente de Telemarketing', salario=1200
where nome='Atendente';

select* from tabcargo;



    

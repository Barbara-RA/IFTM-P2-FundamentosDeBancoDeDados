Use empresa;
select distinct c.nome
From tabfuncionario f join tabcargo c on f.Cod_cargo=C.Cod_cargo
where year(f.data_adm) in (2009,2008);

select*
from tabfuncionario
order by nome;

select c.nome, f.nome
from tabfuncionario f join tabcargo c on f.cod_cargo=c.Cod_cargo
order by c.nome, f.nome;

select c.nome nome_cargo, f.nome Nome_funcionario
from tabfuncionario f join tabcargo c on f.cod_cargo=c.Cod_cargo
order by 1,2;

select cod_depto, count(*) qtd_func
from tabfuncionario
group by 1;

select f.cod_depto, d.nome, count(*) qtd_func
from tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
group by 1;

select cod_depto, cod_cargo, count(*) qtd_func
from tabfuncionario
group by 1,2
order by cod_depto asc;

select year(Data_adm) ano, count(*) qtd_func
from tabfuncionario
group by 1 asc;

select d.nome, avg(c.salario)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
group by 1;
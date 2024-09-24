use empresa;
select nome, count(*)
from tabcargo
group by nome
having count(*)>1;

Select*
From tabcargo;

select d.nome, count(*) qtd_funcionario
from tabfuncionario f Join tabdepartamento d On f.cod_depto=d.cod_depto
group by d.nome
having count(*)>1;

select d.nome,sum(c.salario)
from tabfuncionario f Join tabdepartamento d On f.cod_depto=d.cod_depto
join Tabcargo c on c.cod_cargo=f.cod_cargo
group by d.nome
having avg(c.salario)>1000;



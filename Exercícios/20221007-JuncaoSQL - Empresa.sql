use empresa;

select f.nome, f.sexo
from tabfuncionario f Inner join tabcargo c
on f.cod_cargo=c.cod_cargo
where c.nome='Desenvolvedor';

select f.nome, d.sigla
from tabfuncionario f inner join tabdepartamento d
on f.cod_depto=d.cod_depto;

select f.nome, f.sexo, c.salario
from tabfuncionario f inner join tabcargo c
on f.Cod_cargo=c.Cod_cargo
where year(f.data_adm)=2009;

select f.nome, f.data_adm, d.nome
from tabfuncionario f inner join tabdepartamento d
on f.cod_depto=d.cod_depto
where f.sexo='F';

select f.*
from tabfuncionario f inner join tabdepartamento d
on f.cod_depto=d.cod_depto
where d.nome='Informatica' or d.nome='financeiro';

select f.*
from tabfuncionario f inner join tabdepartamento d
on f.cod_depto=d.cod_depto
where d.nome in ('Informatica','financeiro');

select f.nome, c.nome, c.salario, d.nome
from tabfuncionario f inner join tabdepartamento d on f.cod_depto=d.cod_depto
inner join tabcargo c on f.cod_cargo=c.cod_cargo
where c.nivel='Jr' and year(f.data_adm)=2008;

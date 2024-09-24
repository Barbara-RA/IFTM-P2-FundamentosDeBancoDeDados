select f.nome
from tabfuncionario f, tabdepartamento d
where f.Cod_depto = d.Cod_depto and d.nome = 'informatica';

select *
from tabfuncionario f Inner Join tabdepartamento d On f.cod_depto = d.cod_depto;

select f.nome, f.data_adm, c.nome, d.nome
From tabfuncionario f, tabcargo c, tabdepartamento d
where f.cod_cargo = c.Cod_cargo and f.cod_depto = d.Cod_depto;

SELECT f.nome, f.data_adm, c.nome, d.nome
FROM tabfuncionario f INNER JOIN tabcargo c ON f.cod_cargo = c.cod_cargo INNER JOIN tabdepartamento d ON f.cod_depto = d.cod_depto;



select Max(c.salario)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
where d.nome='Pessoal';

select	* from tabdepartamento;

select sum(c.salario)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
where d.nome='financeiro';

select count(f.nome)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
where d.nome='informática';

select min(c.salario)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
where d.nome='informática';

select max(c.salario),min(c.salario),avg(c.salario),sum(c.salario)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
where d.nome='informática';

select count(f.nome)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
where f.sexo='F'and d.nome in('Pessoal','Financeiro');

select avg(c.salario)
From tabfuncionario f join tabcargo c on f.Cod_cargo=C.Cod_cargo
where year(f.data_adm)=2008 and month(f.data_adm)<=6;

select count(*)
From tabfuncionario f join tabcargo c on f.Cod_cargo=C.Cod_cargo
where c.salario <2000;







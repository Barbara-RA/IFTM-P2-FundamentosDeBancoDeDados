select d.nome, min(c.salario), max(c.salario)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
group by 1
order by 1;
use empresa;
select year(Data_adm) ano, month(Data_adm) Mes, count(*) qtd_func
From tabfuncionario
group by 1,2
order by 1,2;

select distinct nome,count(nivel) qtd_nivel
From tabcargo
group by nome;

select sum(c.salario) soma,d.nome
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
group by d.nome
order by soma desc;

select d.nome, min(f.Data_adm), max(f.Data_adm)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
group by 1;

select f.sexo,d.nome, count(f.sexo)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
group by 2,1;

select c.nome,sum(c.salario)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
group by c.nome;

select c.nome, c.nivel,sum(c.salario)
From tabfuncionario f join tabdepartamento d on f.Cod_depto=d.Cod_depto
join tabcargo c on f.Cod_cargo=C.Cod_cargo
where d.nome='informática'
group by c.nome,c.nivel;





use empresa;

select min(salario)
from tabcargo
where nome='Desenvolvedor';

select Max(data_adm)
From tabfuncionario
where sexo='F';

insert into tabfuncionario(cod_func,nome,data_adm,sexo,cod_cargo,cod_depto) values (11,'João Pereira',null,'M',3,1);

select count(data_adm)
from tabfuncionario;

select count(*)
from tabfuncionario
where sexo='M';

select sum(c.salario) total_pago
from tabfuncionario f join tabcargo c on f.cod_cargo=c.cod_cargo;

select sum(c.salario) total_pago
from tabfuncionario f join tabcargo c on f.cod_cargo=c.cod_cargo
where c.nome='Desenvolvedor';

Select avg(salario)
from tabfuncionario f join tabcargo c on f.cod_cargo=c.cod_cargo;

Select *
from tabfuncionario f join tabcargo c on f.cod_cargo=c.cod_cargo;

Select avg(salario)
from tabcargo
where nivel='JR';

Select avg(c.salario)
from tabfuncionario f join tabcargo c on f.cod_cargo=c.cod_cargo
where c.nivel='JR';

Select*
from tabfuncionario f join tabcargo c on f.cod_cargo=c.cod_cargo;



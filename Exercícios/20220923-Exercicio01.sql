select Cod_cargo, cod_depto,nome
from tabfuncionario
where year(data_adm)=2008 and sexo='F';

select nome
from tabcargo
where salario >=2000 and salario<=5000;

select nome, salario
from tabcargo
where salario >3000;

Select*
from tabfuncionario
where nome ="Fernando Silva";

Select*
from tabfuncionario
where nome Like'%eira%';

Select*
from tabfuncionario
where nome Like'% Silv%';

Select nome, Data_adm
from tabfuncionario
where nome Like'P%';

Select*
from tabfuncionario
where nome not Like'J%'and nome not Like'G%';

Select nome, sexo
from tabfuncionario
where nome Like'% Silva%';

select Cod_depto, sigla
from tabdepartamento
Where nome In("informatica","financeiro");

Select Cod_func, nome
from tabfuncionario
where sexo not in ('f') and cod_depto in (1,3);

select Cod_cargo, salario
from tabcargo
Where nome In("atendente","contador","desenvolvedor");




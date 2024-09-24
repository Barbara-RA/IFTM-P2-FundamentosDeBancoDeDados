use empresa;
select nome,sexo
From tabfuncionario
where sexo="M";

Select	Cod_cargo,Cod_depto, nome, data_adm
from tabfuncionario
where sexo= "F" and data_adm >= '2008-01-01' and data_adm <='2008-12-31';

Select	nome
from Tabcargo
where salario >=2000 and salario <=5000;

Select	nome, salario
from tabcargo
where salario >=3000;

Select*
from tabfuncionario
where nome ="Fernando Silva Rosa";

select nome, Cod_cargo, data_adm
from tabfuncionario
where data_adm between '2009-01-01' and '2009-12-31';

select nome,sexo, Cod_cargo, data_adm
from tabfuncionario
where data_adm between '2008-01-01' and '2008-12-31'and sexo='F';

Select*
from tabfuncionario
where nome Like'%o %';

select*
from tabfuncionario
where nome Like'J%';

select*
from tabfuncionario
where nome Like'M%';

select*
from tabfuncionario
where nome Like '_____________';
select *from tabfuncionario;

select*
from tabcargo
where nome not like '%dor';

select*
from tabcargo
where nome not like '%dor';

select*
from tabfuncionario
Where nome like '%a %' and nome like '%a';

select*
from tabfuncionario
Where cod_depto In(2,3);

select*
from tabfuncionario
Where cod_cargo Not In(1,2);

select*
from tabcargo
Where nome In("atendente","contador");

select*
from tabdepartamento
Where nome In("financeiro","Pessoal");

select nome
from tabfuncionario
Where sexo not In("F");

select nome, data_adm
from tabfuncionario
Where cod_depto not In(1,2);

select *
from tabfuncionario
Where data_adm is not Null;

select *
from tabfuncionario
Where data_adm like '2008%';

select *
from tabfuncionario
Where data_adm like '%-03-%';

select nome, cod_cargo, data_adm
from tabfuncionario
Where data_adm like '2009%' and sexo='F';

select nome, cod_cargo, data_adm
from tabfuncionario
Where data_adm like '%-02-%';

select nome, cod_cargo, data_adm
from tabfuncionario
Where year(data_adm)= 2009 and sexo='F';

select nome, cod_cargo, data_adm
from tabfuncionario
Where mot (data_adm)= 2009 and  sexo='F;
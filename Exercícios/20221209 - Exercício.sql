use empresa;

# a) Listar o nome e sexo dos funcionarios que ganham mais que R$ 1400
select f.nome, f.sexo
from tabfuncionario f
where f.cod_cargo in (
select c.cod_cargo
from tabcargo c
where c.salario>1400);

#b) Listar as informações dos cargos que possuem ao menos um funcionário

select c.*
from tabcargo c
where c.cod_cargo in(
select f.cod_cargo
from tabfuncionario f
);

#c)Listar as informações dos cargos que não possuem funcionários
select c.*
from tabcargo c
where c.cod_cargo not in(
select f.cod_cargo
from tabfuncionario f
);

#d) Listar o nome, data de admissão e sexo dos funcionários do departamento Financeiro
select f.nome, f.data_adm,f.sexo
from tabfuncionario f
where f.cod_depto in(
select d.cod_depto
from tabdepartamento d
where d.nome='financeiro'
);

#e) Listar os dados dos funcionários do sexo masculino que foram contratados antes da Janete Rosa
select f.*
from tabfuncionario f
where f.data_adm>(
select f.data_adm
from tabfuncionario f
where f.nome='Janete Rosa') and f.sexo='M';

#f)Listar o nome dos departamentos que não fizeram contratações no ano de 2008
select d.nome
from tabdepartamento d
where d.cod_depto not in(
select f.cod_depto
from tabfuncionario f
where year(f.data_adm)=2008);

#G) Listar as informações do cargo de maior salário
select *
from tabcargo
where salario=(
select max(salario)
from tabcargo);

#h) Para funcionário mais antigo da empresa listar: nome do funcionário, o nome do cargo e nível, e nome do seu departamento
select f.nome,c.nome,c.nivel,d.nome
from tabfuncionario f join tabcargo c on f.cod_cargo=c.cod_cargo join tabdepartamento d on f.cod_depto=d.cod_depto
where f.data_adm=(
select max(f.data_adm)
from tabfuncionario f);

#i) Listar os dados de todos os funcionários da empresa, exceto do que foi contratado mais recentemente
select f.*
from tabfuncionario f
where f.data_adm !=(
select min(f.data_adm)
from tabfuncionario f
);

#j) Listar os dados dos departamentos que possuem funcionárias do sexo feminino
select d.*
from tabdepartamento d
where d.cod_depto in(
select f.cod_depto
from tabfuncionario f
where f.sexo='f');

#k) Listar o nome e nível dos cargos dos funcionários do sexo masculino
select c.nome, c.nivel
from tabcargo c
where c.cod_cargo in(
select f.cod_cargo
from tabfuncionario f
where f.sexo='M');

#l) Listar os dados dos cargos que possuem funcionários, mas não possuem funcionários do sexo feminino
select c.*
from tabcargo c
where c.cod_cargo in(
select f.cod_cargo
from tabfuncionario f)
and  c.cod_cargo not in(
select f.cod_cargo
from tabfuncionario f
where f.sexo='f');

#2 
Use clinica02;

#a)Insira ao menos 3 registros de consultas em datas futuras neste ano.
insert into consulta (codm,codp,data_consulta,hora_consulta,valor_consulta) values
(1, 2, '2022-06-10', '08:00:00', 450.00),
(3, 1, '2022-06-15', '12:30:00', 255.00),
(3, 2, '2022-06-22', '15:00:00', 300.00);

#b)Altere a data das consultas da médica Maria Jose do dia 23/07/2017 para o dia 13/08/2017
SET SQL_SAFE_UPDATES = 0;
use clinica02;
update consulta c, medico m set data_consulta='2017-08-13'
where c.codm=m.codm and m.nomem='Maria Jose' and c.data_consulta='2017-07-23';

#c) Crie uma nova tabela com as informações do nome, data de nascimento e sexo dos pacientes que tem problema cardíaco
Create table Pacientes_cardiacos as
select nomep, dt_nasc, sexo
from paciente
where problema='cardíaco';
  
 select *
 from pacientes_cardiacos;

#d) Todas as consultas desse ano deverão ser reajustadas em 5%, dê o comando SQL que faça essa ação.

update consulta 
Set valor_consulta =valor_consulta*1.05
where year(data_consulta)=2022;

#e) Atualize a data e o horário da consulta do paciente Maria do Carmo do dia 20/07/2017 as 15:00hs para o dia 22/07/2017 as 17:00hs.

update consulta 
Set data_consulta ='2017-07-22', hora_consulta='17:00:00'
where year(data_consulta)='2017-07-20' and hour(hora_consulta)='15:00:00';


# f) Crie uma nova tabela DadosConsultas2017_1 com as informações do nome do medico, nome do paciente, data e hora das consultas 
# de todas as consultas do primeiro semestre do ano de 2017

create table DadosConsultas2017_1 as
select m.nomem, p.nomep, c.data_consulta, c.hora_consulta
from medico m join consulta c on m.Codm=c.codm join paciente p on c.codp=p.codp
where (month(c.data_consulta)>=1 and month(c.dt_consulta)<=6) and year(c.data_consulta)=2017;

#g) Apague da tabela DadosConsultas2017_1 os dados das consultas do mês de junho

delete from DadosConsultas2017_1
where month(data_consulta) = 6;

#h) O médico Marcos Paulo não poderá atender as consultas marcadas entre os dias 17/07/2017 e 22/07/2017, dessa forma as consultas registradas 
#para esse período e para esse médico devem ser excluídas.

delete from Consulta c
where c.codm in (select m.codm
from medico m
where nomem = 'Luciano Fernandes')
and data_consulta >'2017-07-17' and data_consulta < '2017-07-22';





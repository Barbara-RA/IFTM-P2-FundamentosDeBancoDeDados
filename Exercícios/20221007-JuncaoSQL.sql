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

select f.nome, c.nome, c.salario, d.nome
from tabfuncionario f inner join tabdepartamento d on f.cod_depto=d.cod_depto
inner join tabcargo c on f.cod_cargo=c.cod_cargo
where c.nivel='Jr' and year(f.data_adm)=2008;

Use academico;

select a.nome, a.mat, c.nome
from Aluno a inner join curso c on a.Cod_curso=c.Cod_curso;

select a.nome, a.mat, c.nome
from Aluno a inner join curso c on a.Cod_curso=c.Cod_curso
where a.entrada like '2016%';

select a.nome, d.nome, h.media
from Aluno a inner join historico h on a.Mat=h.Mat
inner join disciplina d on h.Cod_disc=d.Cod_disc;

select p.nome, d.nome
from professor p inner join alocacao alc on p.Cod_prof=alc.Cod_prof
inner join disciplina d on alc.Cod_disc=d.Cod_disc
inner join turma t on alc.Cod_turma=t.Cod_turma
where t.ano=2016;


select d.nome,dr.nome
from prereq pr inner join disciplina d on pr.Cod_disc=d.Cod_disc
inner join disciplina dr On pr.Cod_disc_req=dr.Cod_disc;

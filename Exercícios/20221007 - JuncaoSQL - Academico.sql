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

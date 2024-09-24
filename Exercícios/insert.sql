Use academico;
desc tabcurso;
insert into tabcurso(cod_curso, nome, sigla) Values (1, "sistemas para Internet", 'TSPI');
insert into tabcurso(cod_curso, nome, sigla) Values (2, "Licenciatura em Computação", 'LCOMP');
select * from tabcurso;

Insert into tabaluno(mat, nome_aluno, entrada, cod_curso) values (1001, "Paulo Silva", "2016_1", 1);
select * from tabaluno;

Insert Into tabaluno(mat, nome_aluno, entrada, cod_curso) values (1002, "Carla Martins", "2016_1", 1), (1003,"Marcos Ferreira", "2017_1",2);

select * from tabaluno


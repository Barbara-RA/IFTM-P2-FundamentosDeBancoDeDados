use academico;
create table Curso(
Cod_curso Int primary key,
nome varchar(30),
sigla varchar(5)
);

create table Aluno(
Mat Int primary key,
nome varchar(30),
entrada varchar(7),
Cod_curso Int,
foreign key (cod_curso) references Curso(Cod_curso)
);

create table Disciplina(
Cod_disc int primary key,
Nome varchar(35),
Sigla varchar(5),
Carga_hor int
);

create table Professor(
Cod_prof int primary key,
Nome varchar(20)
);

create table Turma(
Cod_turma int primary key,
Ano varchar(4),
Sem int(2)
);

Create table Alocacao(
Cod_Alocacao int primary key,
Cod_turma int,
Cod_disc int,
Cod_prof int,
foreign key (Cod_turma) references Turma(Cod_turma),
foreign key (Cod_disc) references Disciplina(Cod_disc),
foreign key (Cod_prof) references Professor(Cod_prof)
);

create table Historico(
Cod_historico int primary key,
Cod_turma int,
Mat int,
Cod_disc int,
Media float,
foreign key (Cod_turma) references Turma(Cod_turma),
foreign key (Mat) references Aluno(Mat),
foreign key (Cod_disc) references Disciplina(Cod_disc)
);

create table PreReq(
Cod_PreReq int primary key,
Cod_disc int,
Cod_disc_req int,
foreign key (Cod_disc) references Disciplina(Cod_disc),
foreign key (Cod_disc_req) references Disciplina(Cod_disc)
);
insert into curso(cod_curso, nome, sigla) values
(1,"Sistemas para Internet","TSPI"),
(2,"Licenciatura em Computação","LCOMP");

insert into Aluno(Mat, nome, entrada, Cod_curso) values
(1001,"Paulo Silva","2016_1",1),
(1002,"Carla Marins","2016_2",1),
(1003,"Marcos Ferreira","2017_1",2);

insert into Disciplina(Cod_disc, Nome, Sigla, Carga_hor) values
(1,"Lógica","Log",105),
(2,"Algoritmos","Alg",80),
(3,"Banco de Dados 1","BD1",75),
(4,"Programação Orientada a Objetos","POO",120);

insert into Professor(Cod_prof, Nome) values
(1,"Clarimundo"),
(2,"Mateus"),
(3,"Cibele");

Alter table Turma change column Ano Ano int;
insert into Turma(Cod_turma, Ano, Sem) values
(44,2016,1),
(46,2016,1),
(47,2016,2),
(48,2017,1);

insert into Alocacao(Cod_Alocacao,Cod_turma, Cod_disc, Cod_prof) values
(1,44,1,1),
(2,46,3,2),
(3,46,2,1),
(4,47,3,3),
(5,48,4,1);

Alter table Historico change column Media Media float(2);
insert into Historico(Cod_historico, Cod_turma, Mat,Cod_disc, Media) values
(1,44,1001,1,6.0),
(2,46,1001,2,5.5),
(3,47,1002,3,7.0);

select *from Historico;

insert into PreReq(Cod_PreReq, Cod_disc, Cod_disc_req) values
(1,2,1),
(2,4,2);

use academico;

select nome
from Disciplina
where Carga_hor >100;

select*
from Aluno
where nome Like '%a %';

select mat,nome
from Aluno
where nome Like '%a';

select mat,nome
from Aluno
where Entrada Like '2016%';

select Media, Cod_disc
from Historico
where Mat =1001;







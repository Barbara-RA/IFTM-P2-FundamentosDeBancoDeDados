Use academico;
create table TabCurso(
cod_curso Int primary Key,
nome varchar(60),
sigla char(6)
);

create table TabAluno(
mat numeric(4) primary key,
nome varchar(60),
entrada char(6),
cod_curso int,
foreign key (cod_curso) references TabCurso(cod_curso)
);

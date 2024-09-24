create database Empresa;
use empresa;
Create table TabCargo(
Cod_cargo Int primary key,
nome varchar(30),
nivel varchar (7),
salario float
);

Create table TabDepartamento(
Cod_depto int primary key,
nome varchar(15),
sigla varchar(5)
);
use empresa;
Create table TabFuncionario(
Cod_func int Primary key,
nome varchar(30),
Data_adm Date,
sexo varchar(1),
foreign key (Cod_cargo) references tab
foreign key (cod_depto) references TabDepartamento(cod_depto)
);




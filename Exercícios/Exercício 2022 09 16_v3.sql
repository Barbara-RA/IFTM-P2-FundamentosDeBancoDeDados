create database Empresa;
use Empresa;
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
Create table TabFuncionario(
Cod_func int Primary key,
nome varchar(30),
Data_adm Date,
sexo varchar(1),
cod_cargo int,
cod_depto int,
foreign key (cod_cargo) references TabCargo(Cod_cargo),
foreign key (cod_depto) references TabDepartamento(cod_depto)
);
use Empresa;
select * from TabCargo;
insert TabCargo(Cod_cargo, nome, nivel,salario) values (1,"Analista de Sistemas","JR",1500),
(2,"Desenvolvedor","JR",2100),
(3,"Desenvolvedor","Pleno",3200),
(4,"Atendente","NA",980),
(5,"Contador","NA",4500);

insert TabDepartamento(Cod_depto, nome,sigla) values (1,"Informática","INF"),
(2,"Financeiro","FIN"),
(3,"Pessoal","RH");

insert TabFuncionario(Cod_func, nome, Data_adm, sexo, cod_cargo, cod_depto) values (1,"Maria Silveira Nogueira",'2008-03-12',"M",1,1),
(2,"Marcos Silva Silveira",'2008-03-20',"F",4,3),
(3,"Gabriel Pereira Silva",'2008-07-05',"M",2,1),
(4,"Carla Junqueira Pereira",'2008-07-10',"M",5,2),
(5,"Janete Rosa Junqueira",'2008-08-15',"F",1,1),
(6,"Fernando Silva Rosa",'2008-10-01',"F",4,3),
(7,"Marília Vieira Silva",'2009-02-03',"M",3,1),
(8,"Patrícia Chaves Vieira",'2009-02-05',"F",2,1),
(9,"João Marques Chaves",'2009-03-01',"F",5,2),
(10,"João Marques",'2008-03-15',"M",3,1);
desc TabFuncionario


Drop database IFTOUR;
create Database IFTOUR;
use IFTOUR;

create table Cliente(
idCliente int primary key auto_increment, 
nome varchar(30), 
telefone varchar(11), 
endereco varchar(100), 
email varchar(100), 
cpf varchar(11)
);

create table Pacote(
idPacote int primary key auto_increment, 
dataInicio date,
dataFim date, 
origem varchar (100), 
destino varchar(100), 
preco float, 
idCliente int,
foreign key	(idCliente) references Cliente(idCliente)
);


create table Consultor(
idConsultor int primary key auto_increment, 
nome varchar(30), 
telefone varchar(11)
);

create table Pagamento (
idPagamento int primary key auto_increment,
quantidadeDeParcelas int,
dataPagamento date
);

create table Venda(
idCompra int primary key auto_increment, 
comissao float, 
dataVenda date, 
valorVenda float, 
idPacote int, 
idPagamento int, 
idConsultor int,
foreign key	(idPacote) references Pacote(idPacote),
foreign key	(idConsultor ) references Consultor(idConsultor ),
foreign key	(idPagamento) references Pagamento(idPagamento)
);

create table Boleto(
idBoleto int primary key auto_increment,
dataEmisao date, 
dataVencimento date, 
valorDesconto float, 
idPagamento int,
foreign key	(idPagamento) references Pagamento(idPagamento)
);

create table cartao(
	idCartao int not null auto_increment,
    numeroDoCartao varchar(100),
    vencimento date,
    nomeTitular varchar(100),
    idPagamento int,
    primary key (idCartao),
    foreign key(idPagamento) references pagamento(idPagamento)
);
create table passagem(
	idPassagem int not null auto_increment,
    origem varchar(100),
    destino varchar(100),
    horario datetime,
    companhiaAerea varchar(100),
    nomePassageiro varchar(100),
    idPacote int,
    primary key(idPassagem),
    foreign key (idPacote) references pacote(idPacote)
);

create table hospedagem(
	idHospedagem int not null auto_increment,
    checkIn datetime,
    checkOut datetime,
    QuantidadePessoas int,
    idPacote int,
    primary key(idHospedagem),
    foreign key (idPacote) references Pacote(idPacote)
);
create table hotel(
	idHotel int not null auto_increment,
    nome varchar(100),
    telefone varchar(100),
    endereco varchar(100),
    primary key(idHotel)
);
create table reserva(
	idReserva int not null auto_increment,
    dataReserva date,
    idHotel int,
    idHospedagem int,
    primary key(idReserva),
    foreign key (idHotel) references hotel(idHotel),
    foreign key (idHospedagem) references hospedagem(idHospedagem)    
);

 insert into Cliente(nome, telefone, endereco, email, cpf) values
("Brenda Duncan","79185386243","Ap #145-7800 Non, Av.","neque.sed.dictum@icloud.edu","17965002171"),
("Graham Vaughan","82785737705","Ap #413-4431 Venenatis Rd.","sem.semper@yahoo.com","34437107899"),
("Cruz Burke","58852325167","645-7465 Tempor Avenue","auctor.vitae@icloud.couk","10416535035"),
("Callie Waller","80972516016","P.O. Box 715, 5029 Odio, St.","orci.luctus@aol.ca","17336741563"),
("Eugenia Patton","80871718623","466-3378 Id St.","dolor@google.net","05576087446"),
("Carol Huber","62662679358","P.O. Box 856, 4354 Hendrerit Rd.","egestas.nunc@hotmail.edu","31491059703"),
("Cathleen Jimenez","29878387834","Ap #664-1082 Turpis Ave","fringilla.cursus@outlook.net","46124945823"),
("Quinn Mccray","57801740699","9261 Pretium Road","lectus.quis.massa@protonmail.edu","36332553261"),
("Amaya Leonard","22872088597","P.O. Box 982, 549 Morbi Rd.","mauris.eu@hotmail.edu","10101805766"),
("Kaseem Whitney","74492984672","566-7061 Quam St.","morbi.neque@icloud.org","17092069318"),
("Forrest Hicks","35183917553","999-5005 Donec Av.","interdum.sed@aol.ca","02872942106"),
("Cairo Frost","03636887299","Ap #504-5023 Dictum Rd.","montes@google.edu","37674167324"),
("Amber Torres","82358544734","208-5717 Duis Rd.","aenean.eget@aol.com","04112209457"),
("Ann Riley","18048411611","P.O. Box 432, 1196 Imperdiet, Road","cum.sociis@icloud.org","00862555238"),
("Allen Deleon","46212336075","706-7342 Mus. St.","odio.sagittis.semper@protonmail.edu","06576998620"),
("Jena Mendoza","34233782176","Ap #646-9664 Sagittis Avenue","nulla.eu.neque@outlook.net","34420948988"),
("Hayes Fulton","20008089521","P.O. Box 131, 6371 Morbi St.","nam.interdum@protonmail.net","18817229390"),
("Ian Flores","24488490455","Ap #862-7232 Pede. Avenue","vitae.aliquam.eros@outlook.edu","18369681931"),
("Brian Miranda","25740765584","778-3484 Consequat Avenue","pharetra.felis.eget@google.org","00599277109"),
("Rowan Jefferson","29822215588","6932 Mattis. Road","facilisis.eget.ipsum@aol.net","33250986326");

insert into pacote(dataInicio, dataFim,origem,destino,preco,idCliente) values
("2022-07-11","2022-03-17","Giarratana","Almere","551.80",6),
("2023-07-20","2023-08-31","Bolsward","Ålesund","440.02",12),
("2022-12-11","2023-01-29","Chiclayo","Amersfoort","578.62",10),
("2023-10-03","2023-06-20","Zwettl-Niederösterreich","Mazatlán","597.85",10),
("2021-12-27","2022-11-19","Frederikstad","Vigo","585.20",17),
("2023-03-19","2022-09-25","Los Patios","Vannes","520.23",12),
("2022-10-10","2023-04-03","Almere","Itanagar","581.46",5),
("2022-03-18","2022-11-01","Chulucanas","Payakumbuh","330.58",9),
("2021-12-25","2023-11-14","San Andrés","Biarritz","379.08",3),
("2022-05-20","2022-01-14","João Pessoa","Albany","372.55",9),
("2022-04-16","2023-05-06","Liernu","Tanjung Pinang","503.54",16),
("2023-06-09","2022-03-05","Okpoko","Mielec","558.44",20),
("2022-05-09","2023-05-17","Marilles","Yurimaguas","313.37",8),
("2023-11-03","2022-03-21","Camiña","Kryvyi Rih","354.91",13),
("2022-11-24","2022-03-04","Belém","Lunel","363.59",5),
("2021-11-27","2022-03-17","Magadan","Kessenich","344.60",9),
("2022-06-29","2022-11-21","Putre","Ribeirão das Neves","547.18",16),
("2023-09-15","2022-11-17","Trollhättan","Khanewal","389.11",4),
("2022-07-10","2023-09-14","Weymouth","Natales","424.06",18),
("2023-06-10","2023-01-25","Lago Ranco","Port Harcourt","406.12",12);

insert into consultor(nome, telefone) values
("Lucas Ilussencio da silva", "34912341234"),
("Barbara Ramos Alves","34945678765"),
("Armando Henrique de Oliveira", "34912347659"),
("Gabriela de Oliveira Ferreira","34945093458"),
("Cibele Mara Fonseca","34909582465");

insert into Pagamento(quantidadeDeParcelas, dataPagamento) values 
(1, "2023-01-01"),
(1, "2023-01-02"),
(1, "2023-01-03"),
(1, "2023-01-04"),
(1, "2023-01-05"),
(1, "2023-01-06"),
(1, "2023-01-07"),
(1, "2023-01-08"),
(1, "2023-01-09"),
(1, "2023-01-10");

insert into Venda(comissao,dataVenda,valorVenda,idPacote,idPagamento,idConsultor) values 
(100.10,"2022-01-01",600.0,1,1,1),
(200.10,"2022-01-01",700.0,15,2,2),
(300.10,"2022-01-01",550.30,2,3,3),
(250.10,"2022-01-01",520.20,10,4,4),
(120.10,"2022-01-01",1040.40,3,5,5),
(100.10,"2022-01-01",600.0,1,6,1),
(200.10,"2022-01-01",700.0,15,7,2),
(300.10,"2022-01-01",550.30,2,8,3),
(250.10,"2022-01-01",520.20,10,9,4),
(120.10,"2022-01-01",1040.40,3,10,5);

insert into boleto(dataemisao, datavencimento,valordesconto,idPagamento) values
("2023-01-01","2023-01-15", 10.0,1),
("2023-01-01","2023-01-15", 10.0,2),
("2023-01-01","2023-01-15", 10.0,3),
("2023-01-01","2023-01-15", 10.0,4),
("2023-01-01","2023-01-15", 10.0,5);

insert into cartao(numeroDoCartao,vencimento,nometitular,idpagamento) values
("1234567812345678","2027-05-01", "Brenda",6),
("1234567812345677","2027-05-01", "Graham",7),
("1234567812345676","2027-05-01", "Cruz",8),
("1234567812345675","2027-05-01", "Callie",9),
("1234567812345674","2027-05-01", "Eugenia",10);

insert into passagem(origem, destino, horario, companhiaaerea, nomepassageiro, idpacote) values
("Non, Av.","Giarratana","2023-05-01 12:00:00","TAM","Brenda",1),
("Venenatis Rd.","Bolsward","2023-05-01 12:00:00","TAM","Graham",2),
("Tempor Avenue","Chiclayo","2023-05-01 12:00:00","TAM","Cruz",3),
("Odio, St.","Zwettl-Niederösterreich","2023-05-01 12:00:00","TAM","Callie",4),
("Id St.","Frederikstad","2023-05-01 12:00:00","TAM","Eugenia",5);

insert into hospedagem(checkin, checkout, quantidadepessoas, idpacote) values
("2023-05-01", "2023-06-01", 1, 1),
("2023-05-01", "2023-06-01", 1, 2),
("2023-05-01", "2023-06-01", 1, 3),
("2023-05-01", "2023-06-01", 1, 4),
("2023-05-01", "2023-06-01", 1, 5);

insert into hotel(nome, telefone, endereco) values 
("Raposo Hotel","34912341234","Rua Raposo, 172"),
("Ibis Hotel","34923455678","Rua Marco Aurelio resende, 80"),
("ABC Hotel","34987655432","Rua Jaco do bandolim, 72"),
("Dell Hotel","34945670987","Rua Cesario Alvim, 765"),
("Sleep Hotel", "34934567890","Rua Alemanha, 101");

insert reserva (dataReserva, idHotel, idHospedagem) values 
("2023-05-01", 1, 1),
("2023-05-01", 2, 2),
("2023-05-01", 3, 3),
("2023-05-01", 4, 4),
("2023-05-01", 5, 5);























































































































































































#Lista o nome do consultor, valor da comissão e valor da venda  onde o comissao é superior a R$200
select c.nome, v.comissao, v.valorVenda
from venda v, consultor c
where v.idConsultor in (
select c.idConsultor
from consultor c
where v.comissao>200);

#Lista as informações do maior valor de venda 
select *
from venda 
where valorVenda=(
select max(valorVenda)
from venda);

#Lista consultor, valor de comissao e  destino dos consultores exceto "Barbara Ramos Alves".
select c.nome,p.destino, v.comissao
from venda v join pacote p on p.idpacote = v.idpacote join consultor c on v.idconsultor = c.idconsultor
where v.idconsultor not in(
select c.idconsultor
from consultor c
where c.nome ='Barbara Ramos Alves');

#Lista o nome do consultor, valor da venda e valor da menor comissão.
select c.nome, v.valorVenda, v.comissao
from venda v join consultor c on v.idconsultor = c.idconsultor
where valorVenda=(
select min(valorVenda)
from venda);

#Lista a data, valor da venda e destino do pacote onde o destino é "Amersfoort"
select v.datavenda, v.valorvenda,p.destino
from venda V join Pacote p on v.idpacote=p.idpacote
where v.idpacote =(
select p.idpacote
from Pacote p
where p.destino="Amersfoort");

#Alterar a o vencimento dos boletos dia 15/01/2023 para o dia 17/01/2023
SET SQL_SAFE_UPDATES = 0;
update boleto set datavencimento='2023-01-17'
where datavencimento='2023-01-15';

select*
from boleto;

#Nova tabela de passagens "Passagens_dados" com o nome do passageiro, horário e origem onde o destino é "Giarratana"
Create table Passagens_dados as
select nomepassageiro, horario, origem
from passagem
where destino='Giarratana';

select*
from Passagens_dados;

#Reajuste da comissão dos consultores em 1,3% quando o valor da venda for maior que R$ 1.000
update venda 
Set comissao =comissao*1.013
where valorVenda>1000;

select*
from venda
where valorVenda>1000;

# O Proprietário do cartão de crédito cujo o primeiro nome é Cruz, decidiu pagar por boleto e solicitou o estorno da cobrança no cartão
delete from cartao
where nometitular= 'Cruz';

select*
from cartao;

#inserir registros de vendas .
insert into Venda(comissao,dataVenda,valorVenda,idPacote,idPagamento,idConsultor) values 
(275.50,"2022-01-03",2755.00,3,5,5),
(355.00,"2022-01-04",3550.00,2,8,3),
(798.30,"2022-01-05",7983.00,2,3,3);

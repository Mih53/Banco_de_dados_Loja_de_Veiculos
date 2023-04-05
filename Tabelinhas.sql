create database locadora_de_veiculos;

use locadora_de_veiculos;

/*drop database locadora_de_veiculos;*/

create table gruposVeiculos(
id int primary key not null auto_increment,
nome varchar(30) not null,
valorDiaria decimal (7,2) not null
);
create table filiais(
id int auto_increment primary key not null,
nome varchar(30) not null,
cidade varchar(50) not null,
estado char(2) not null
);


create table modelosVeiculos(
id int primary key auto_increment not null,
gruposVeiculos_ID int, 
fabricante varchar(30) null,
modelo varchar(30) null,
foreign key(gruposVeiculos_ID) references gruposVeiculos(id)
);

create table veiculos(
placa char(7) primary key not null,
modelosVeiculos_ID int,
filiais_ID int,
numeroChassi varchar(20) not null,
renavam varchar(20) not null,
anoFabricacao year(4) not null,
potenciaMotor varchar (5) not null,
cor varchar(20) not null,
numeroPortas int not null,
equipamentos text null,
foreign key(modelosVeiculos_ID) references modelosVeiculos(id),
foreign key(filiais_ID ) references filiais(id)
);

create table clientes(
cpf char(11) primary key not null,
nome varchar(50) not null, 
telefone varchar(20) not null
);

alter table clientes
add cep char(7),
add Logradouro varchar (30),
add numero int,
add complemento varchar(20),
add bairro varchar(20),
add cidade varchar(20),
add estado char(2);


create table reservas(
id int auto_increment primary key not null,
clientes_Cpf char(11),
filiais_ID_Retirada int,
filiais_ID_Devolucao int,
gruposVeiculos_ID int, 
dataRetiradaPretendida datetime not null,
dataDevolucaoPretendida datetime not null,
foreign key(clientes_Cpf) references clientes(cpf),
foreign key(filiais_ID_Retirada) references filiais(id),
foreign key(filiais_ID_Devolucao) references filiais(id),
foreign key(gruposVeiculos_ID) references gruposVeiculos(id)
);

create table condutores(
locacoes_Reservas_ID int not null,
clientes_Cpf char(11) not null,
nome varchar(50) not null,
cnh varchar(20) not null,
foreign key (locacoes_Reservas_ID) references reservas(id),
foreign key (clientes_cpf) references clientes(cpf)
);

create table locacoes(
reservas_ID int primary key,
veiculos_Placa char(7),
valorTotal decimal(9,2) not null,
qtdDias int not null,
formaPagamento varchar(20),
dataRedirada datetime not null,
dataDevolucao datetime,
valorDiaria decimal(9,2) not null,
foreign key (reservas_ID) references reservas (id),
foreign key (veiculos_Placa) references veiculos (placa)
);

describe gruposVeiculos;
describe modelosVeiculos;
describe veiculos;
describe reservas;
describe filiais;
describe clientes;
describe condutores;
describe locacoes;


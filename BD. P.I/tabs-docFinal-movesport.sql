create database MoveSport;
use MoveSport;

-- TABELA EMPRESA = Empresa Matriz, relaciona com a sua respectiva unidade
create table Empresa (
idEmpresa int primary key auto_increment,
Nome varchar (45),
CNPJ char (8)
); 

-- TABELA UNIDADE DA EMPRESA = 1 empresa tem várias unidades(lojas) e 1 unidade só tem 1 empresa
create table UnidadeEmpresa (
idUnidade int primary key auto_increment,
NomeUnidade varchar (45),
CEP varchar (45),
número int,
fkEmpresa int,
foreign key (fkEmpresa) references Empresa (idEmpresa)
); 

-- TABELA CADASTRO DO FUNCIONÁRIO = 1 funcionário pode ou não ter 1 gerente
create table Cadastro_funcionario (
idUsuario int primary key auto_increment,
nome varchar(45),
cpf char(11),
telefone varchar (45),
localidade varchar (45),
email varchar(45), check (email like '%@%'),
senha varchar(45),
fkGerente int,
foreign key (fkGerente) references Cadastro_funcionario (idUsuario)
); 

-- TABELA ACESSO - 1 funcionario pode trabalhar em 1 ou mais lojas, e 1 loja pode ter 1 ou mais funcionarios 
create table Acesso (
fkUnidadeEmpresa int,
fkCadastroFuncionario int,
foreign key (fkUnidadeEmpresa) references UnidadeEmpresa (idUnidade),
foreign key (fkCadastroFuncionario) references Cadastro_funcionario (idUsuario),
dtIngressao datetime,
status_func varchar (45), 
Acesso_Analytics char (3), check (Acesso_Analytics = 'sim' or Acesso_Analytics = 'não'),
Acesso_Graficos char (3), check (Acesso_Graficos= 'sim' or Acesso_Graficos= 'não')
);

-- TABELA CORREDOR = 1 unidade(loja) tem vários corredores e 1 corredor só esta em 1 unidade
create table Corredor (
idCorredor int primary key auto_increment,
NomeSetor varchar (45),
NumeroCorredor int, check (NumeroCorredor > 0),
fkUnidade int,
foreign key (fkUnidade) references UnidadeEmpresa(idUnidade)
); 



-- TABELA SENSOR =  1 corredor tem 1 ou + sensores e 1 sensor só esta em 1 unico corredor
create table Sensor (
idSensor int primary key auto_increment,
fkCorredor int,
foreign key (fkCorredor) references Corredor (idCorredor),
condicaoEquipamento varchar (45), check (condicaoEquipamento = 'quebrado' or condicaoEquipamento = 'funcionando'),
status_sensor varchar(45), check (status_sensor = 'ativo' or status_sensor = 'inativo')
);

-- TABELA DADOS DO SENSOR = depende do Sensor -> 1 sensor tem vários dados e 1 dado só pertence a 1 único sensor
create table DadosSensor (
	idDadosSensor int auto_increment,
	sinal tinyint, check (sinal = '0' or sinal = '1'),
	dthora datetime default current_timestamp,
	fkSensor int,
	foreign key (fkSensor) references corredor(idCorredor),
    primary key (idDadosSensor, fkSensor)
);

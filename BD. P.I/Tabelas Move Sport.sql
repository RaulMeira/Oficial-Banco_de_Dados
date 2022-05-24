create database MoveSport;

use MoveSport;

-- Administração de Banco de Dados:
	-- Usuario "Cliente" com senha "cliente", acessa o Banco de Dados "movesport"
		-- ele só pode fazer 4 comandos: delete, insert, select e update

-- TABELA EMPRESA = independente e se relaciona com a sua respectiva unidade
create table Empresa (
idEmpresa int primary key auto_increment,
NomeEmpresa varchar (45),
CNPJ char (8)
);

-- TABELA UNIDADE DA EMPRESA = independente da Empresa -> 1 empresa tem várias unidades(lojas) e 1 unidade só tem 1 empresa
create table Unidade (
idUnidade int primary key auto_increment,
NomeUnidade varchar (45),
CEP varchar (45),
número int,
fkEmpresa int,
foreign key (fkEmpresa) references Empresa (idEmpresa)
);

-- TABELA CADASTRO DO FUNCIONÁRIO = independente da Unidade -> 1 unidade(loja) tem vários funcionários e 1 funcionário só trabalha em 1 loja
create table usuario (
id int primary key auto_increment,
nome varchar(45),
cpf varchar(45),
tel varchar (45),
email varchar(45),
senha varchar(45)
);

select * from usuario;

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300)
);

/* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

select * from medida;

-- fkUnidade int,
	-- foreign key (fkUnidade) references Unidade (idUnidade)

-- TABELA CORREDOR = independente da Unidade -> 1 unidade(loja) tem vários corredores e 1 corredor só esta em 1 unidade
create table Corredor (
idCorredor int primary key auto_increment,
Setor varchar (45),
NumeroCorredor int, check (NumeroCorredor > 0),
fkUnidade int,
foreign key (fkUnidade) references Unidade (idUnidade)
); 

-- TABELA SENSOR = independente do corredor -> 1 corredor tem 1 ou + sensores e 1 sensor só esta em 1 unico corredor
create table Sensor (
idSensor int primary key auto_increment,
fkCorredor int,
foreign key (fkCorredor) references Corredor (idCorredor)
);

-- TABELA DADOS DO SENSOR = depende do Sensor -> 1 sensor tem vários dados e 1 dado só pertence a 1 único sensor
create table DadosSensor (
idDadosSensor int auto_increment,
sinal char (1),
check (sinal = 0 or sinal = 1),
dtHora datetime,
fkSensor int,
primary key (idDadosSensor,fkSensor),
foreign key (fkSensor) references Sensor (idSensor)
);

-- mostrando todas as tabelas ligadas, usando apelidos
select * from Empresa join Unidade as un
	on Empresa.idEmpresa = un.fkEmpresa
    join Funcionario as f on un.idUnidade = f.fkUnidade
    join Corredor as c on un.idUnidade = c.fkUnidade
    join Sensor as s on c.idCorredor = s.fkCorredor
    join DadosSensor as ds on s.idSensor = ds.fkSensor;
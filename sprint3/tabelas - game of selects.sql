create database game;
use game;

-- 1 time tem 1 treinador e 1 treinador só pertence a 1 time (1:1)

-- 1 time tem vários jogadores, mas 1 jogador só pertence a 1 time (1:n)

-- 1 time participa de 1 ou mais campeonatos, e 1 campeonato tem 1 ou mais times (n:m)
		-- nisso vem a tabela "temporada"
        
create table timee (
idTime int primary key auto_increment,
pais varchar (45),
nome varchar (45),
fundaçao date
);

insert into timee values 
(null, 'brasil', 'palmeiras', '1914-08-26'),
(null, 'brasil', 'são paulo', '1910-05-02'),
(null, 'brasil', 'corinthians', '1903-03-23'),
(null, 'brasil', 'santos', '1917-04-30'),
(null, 'brasil', 'flamengo', '1920-02-14');

create table campeonato (
idCamp int primary key auto_increment,
nome varchar (45),
tipo varchar (45), check (tipo = 'mata-mata' or tipo = 'pontos corridos')
) auto_increment = 10;

insert into campeonato values
(null, 'brasileirão', 'pontos corridos'),
(null, 'paulista', 'pontos corridos'),
(null, 'copa do brasil', 'mata-mata'),
(null, 'carioca', 'pontos corridos');

create table temporada (
idTemp int auto_increment,
fkTime int,
foreign key (fkTime) references timee (idTime),
fkCamp int,
foreign key (fkCamp) references campeonato (idCamp),
qntd_jogos int,
vitorias int,
derrotas int,
empates int,
campeão char (3), check (campeão = 'sim' or campeão = 'nao'),
primary key (idTemp, fkTime, fkCamp)
) auto_increment = 1000;

insert into temporada values
(null, 1, 11, 15, 14, 0, 1, 'sim'),
(null, 2, 11, 15, 13, 1, 1, 'nao'),
(null, 3, 10, 38, 10, 10, 18, 'nao'),
(null, 1, 10, 38, 36, 1, 1, 'sim'),
(null, 1, 13, 15, 14, 0, 1, 'sim'),
(null, 4, 10, 38, 20, 10, 8, 'nao'),
(null, 5, 12, 10, 10, 0, 0, 'sim'),
(null, 3, 11, 8, 7, 1, 0, 'nao'),
(null, 4, 12, 15, 14, 0, 1, 'nao'),
(null, 5, 10, 15, 14, 0, 1, 'nao'),
(null, 2, 10, 15, 14, 0, 1, 'nao');

select * from timee join temporada on idTime = fkTime;

create table treinador (
idTreinador int primary key auto_increment,
nome varchar (45),
tempo_de_time varchar (45),
times_treinados int,
anos_de_carreira int,
fkTime int,
foreign key (fkTime) references timee (idTime)
) auto_increment = 50;

insert into treinador values 
(null, 'abel', '2 anos', 6, 10, 1),
(null, 'mancini', '1 ano', 15, 19, 2),
(null, 'cuca', '1 mes', 15, 20, 3),
(null, 'felipão', '1 ano', 17, 25, 4),
(null, 'dunga', '1 mes', 12, 18, 5);

create table jogador (
idJogador int primary key auto_increment,
nome varchar (45),
posição varchar (45),
caracteristica varchar (100),
idade int,
seleção char (3), check (seleção = 'sim' or seleção = 'nao'),
fkTime int,
foreign key (fkTime) references timee (idTime)
) auto_increment = 500;

insert into jogador values 
(null, 'neymar', 'atacante', 'craque', 28,'sim',  1),
(null, 'william', 'meia', 'rápido', 33,'sim',  2),
(null, 'vini jr', 'ponta', 'habilidoso', 21,'sim', 3),
(null, 'marquinhos', 'zagueiro', 'tecnico', 25,'sim',  4),
(null, 'dudu', 'atacante', 'craque', 27,'nao', 5),
(null, 'veiga', 'meia', 'finalizador', 24,'sim', 1),
(null, 'fagner', 'lateral', 'violento', 31,'nao', 2),
(null, 'rony', 'atacante', 'genio', 26,'sim', 3),
(null, 'casemiro', 'volante', 'marcador',  29,'sim',4),
(null, 'gabigol', 'atacante', 'matador', 23,'nao', 5);

select min(fundaçao) from timee;
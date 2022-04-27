create database sprint1;
use sprint1;
create table Atleta(
idAtleta int primary key,
nome varchar(40),
modalidade varchar (40),
qntMedalhas int
);
select * from Atleta;

insert into Atleta values
('0122180', 'Raul', 'Futebol', '5'),
('0122170', 'Luan', 'Basquete', '3'),
('0122160', 'Luis', 'Hispismo', '1'),
('0122150', 'Gabriel', 'Futebol', '5'),
('0122140', 'Rafael', 'Hipismo', '2'),
('0122130', 'Gustavo', 'Basquete', '4');
select * from Atleta;









/* CRUD */
desc `studenti`;
select * from `studenti`;

insert into `studenti`(nome, cognome, genere, indirizzo, citta, email, data_nascita)
values('paolo', 'rossi', 'm', 'via dei mille 30', 'torino', 'prossi@gmail.com', '1980-01-01');

insert into `studenti`(nome, cognome, genere, indirizzo, citta, email, data_nascita)
values
('paola', 'verdi', 'f', 'via torino 30', 'torino', 'pverdi@gmail.com', '1982-01-01'),
('marco', 'rossi', 'm', 'via albero 25', 'torino', 'mr@gmail.com', '1983-01-01'),
('bruno', 'bianchi', 'm', 'via garibaldi 30', 'torino', 'bb@gmail.com', '1985-01-01');

insert into `studenti`(cognome, email) values('vecchio', 'vcc@gmail.com');

insert into `studenti`(cognome, email, genere) values('verdi', 'vd@gmail.com', 'm');

alter table `studenti`
modify `regione` varchar(30) default 'piemonte';

insert into `studenti`
values(default, 'marco', 'rossi', 'm', 'via milano 30', 'torino', default, default, 'mrossi@gmail.com', '1980-01-01', default, default);

alter table `studenti`
drop `demo`;

create table `amici`(
	`id` int not null auto_increment,
    `nome` varchar(30),
    `cognome` varchar(30),
    `email` varchar(100) not null unique,
    primary key(`id`)
);

insert into `amici`(`nome`, `cognome`, `email`)
select `nome`, `cognome`, `email` from `studenti`;

select * from `amici`;

create table `parenti`(
	`id` int not null auto_increment,
    `nome` varchar(30),
    `cognome` varchar(30),
    `email` varchar(100) not null unique,
    primary key(`id`)
)
select `nome`, `cognome`, `email` from `studenti`;

select * from `parenti`;

create table `studenti_bk` like `studenti`; /* duplica solo la tabella in quanto contenitore */
select * from `studenti_bk`;

insert into `studenti_bk` 
select * from `studenti`;

desc `studenti`;
desc `studenti_bk`;

create table `studenti_bk2` AS  /* unica istruzione, creami la tabella come studenti */
select * from `studenti`;  /* creazione e popolazione della tabella in un unica query */

desc `studenti`;
desc `studenti_bk2`;

update `studenti`
set `nome` = 'oscar'
where `id` = 5;
select * from `studenti`;

update `studenti`
set `genere` = 'm', `indirizzo` = 'via pippo 9', `citta` = 'torino', `data_nascita` = '1989-10-05'
where `id` = 5;

/* error 1175: edit > preferences > sql editor > scroll in fondo > deflag safe editor */
update `studenti`
set `regione` = 'lombardia', `provincia` = 'mi', `citta` = 'milano'
where `cognome` = 'rossi';

/* se non specifico il filtro ossia l'id si modifica tutta la colonna
update studenti
set data_nascita = '1980-01-01';
 */

/* delete from `studenti`; cancella tutti gli elementi */

delete from `studenti` /* l'id non si resetta */
where `id` = 6;

select * from `studenti`;

delete from `studenti`
where `regione` = 'lombardia';

delete from `studenti`;

insert into `studenti`(cognome, email)
values ('rosi', 'rosi@gmail.com');

truncate table `studenti`; /* fa parte del ddl non dml, elimina la tabella e la ricostruisce, si azzera l'id */

select * from `studenti`;

INSERT INTO `studenti`(nome,cognome,genere,indirizzo,citta,provincia,regione,email,data_nascita) VALUES
('franco','rossi','m','via Tripoli 10','torino','TO','piemonte','franco.rossi@gmail.com','1978-10-01'),
('mario','verdi','m','via Vicenza 17','asti','AT','piemonte','mario.verdi@gmail.com','1981-10-01'),
('paolo','bianchi','m','via Volvera 47','asti','AT','piemonte','paolo.bianchi@gmail.com','1983-10-01'),
('sara','rossi','f','corso Vigevano 301','cuneo','CN','piemonte','sara.rossi@gmail.com','1983-10-01'),
('elisa','verdi','f','corso Francia 18','alessandria','AL','piemonte','elisa.verdi@gmail.com','1987-10-01'),
('marco','bianchi','m','via Siccardi 3','novara','NO','piemonte','marcob@gmail.com','1993-10-01'),
('franca','verdi','f','via MIlano 33','torino','TO','piemonte','fv@icloud.com','1993-10-01'),
('mauro','bruni','m','via Roma 72','torino','TO','piemonte','mb@icloud.com','1988-10-01'),
('osvaldo','rossi','m','via Firenze 5','torino','TO','piemonte','or@icloud.com','1987-01-02'),
('oscar','verdi','m','lungo Dora Siena 34','torino','TO','piemonte','ov@icloud.com','1990-02-03'),
('paola','bianchi','f','Corso Regina 300','torino','TO','piemonte','paolab@icloud.com','1985-03-04'),
('franca','verdi','f','Corso Mortara 231','torino','TO','piemonte','francaverdi@icloud.com','1989-11-05'),
('eleonora','verdi','f','via Bardonecchia 121','torino','TO','piemonte','ele@icloud.com','1989-12-06'),
('enrico','macello','m','via Grosseto 125','asti','AT','piemonte','emacello@gmail.com','1983-10-01'),
('fabio','baggio','m','via Dogliani 7','cuneo','CN','piemonte','fbaggio@gmail.com','1983-10-01'),
('francesco','gamba','m','via Torino 1','alessandria','AL','piemonte','gamba@gmail.com','1987-10-01'),
('marco','demarchi','m','via Napoli 10','novara','NO','piemonte','marcodem@gmail.com','1993-10-01'),
('franca','verdone','f','via Parma 9','torino','TO','piemonte','fverdone@gmail.com','1994-09-01'),
('marco','zippo','m','via Palermo 19','torino','TO','piemonte','zippo@gmail.com','1995-11-01'),
('giorgio','galvani','m','via Reggio 9','cuneo','cn','piemonte','ggalv@icloud.com','1996-02-01'),
('alex','porro','m','via Verona 13','asti','at','piemonte','porroale@gmail.com','1989-10-01'),
('andrea','giorgio','f','via Bava 9','torino','TO','piemonte','giorgia@icloud.com','1998-02-01'),
('paola','valeri','f','via Balbo 65','novara','no','piemonte','valerip@gamil.com','1992-10-09'),
('federico','rossi','m','via Venezia 3','alessandria','al','piemonte','federoss@icloud.com','1994-08-08'),
('irene','storti','f','corso vittorio 30','torino','TO','piemonte','stortii@gmail.com','1999-09-09'),
('samuele','borsa','m','via Pio 9','torino','TO','piemonte','borsamu@gmail.com','1992-02-02'),
('Luigi', 'Verdi', 'M', 'Via Garibaldi 2', 'Asti', 'AT', 'Piemonte', 'luigi.verdi@example.com', '1999-06-03'),
('Martina', 'Bianchi', 'F', 'Via Dante 3', 'Cuneo', 'CN', 'Piemonte', 'martina.bianchi@example.com', '2001-01-23'),
('Giulia', 'Neri', 'F', 'Via Mazzini 4', 'Alessandria', 'AL', 'Piemonte', 'giulia.neri@example.com', '1996-07-15'),
('Giovanni', 'Russo', 'M', 'Via Montegrappa 5', 'Novara', 'NO', 'Piemonte', 'giovanni.russo@example.com', '1997-09-27'),
('Luisa', 'Ferrari', 'F', 'Via Garibaldi 6', 'Vercelli', 'VC', 'Piemonte', 'luisa.ferrari@example.com', '1998-04-10'),
('Simone', 'Rossi', 'M', 'Via Roma 7', 'Torino', 'TO', 'Piemonte', 'simone.rossi@example.com', '1992-11-02'),
('Francesca', 'Verdi', 'F', 'Via Garibaldi 8', 'Asti', 'AT', 'Piemonte', 'francesca.verdi@example.com', '1994-12-18'),
('Alessandro', 'Bianchi', 'M', 'Via Dante 9', 'Cuneo', 'CN', 'Piemonte', 'alessandro.bianchi@example.com', '1990-05-25'),
('Sara', 'Neri', 'F', 'Via Mazzini 10', 'Alessandria', 'AL', 'Piemonte', 'sara.neri@example.com', '1993-08-30'),
('Fabio', 'Russo', 'M', 'Via Montegrappa 11', 'Novara', 'NO', 'Piemonte', 'fabio.russo@example.com', '1989-03-12'),
('Laura', 'Ferrari', 'F', 'Via Garibaldi 12', 'Vercelli', 'VC', 'Piemonte', 'laura.ferrari@example.com', '1991-12-01'),
('Antonio', 'Rossi', 'M', 'Via Roma 13', 'Torino', 'TO', 'Piemonte', 'antonio.rossi@example.com', '1998-05-09'),
('Mario', 'Rossi', 'M', 'Via Roma 1', 'Torino', 'TO', 'Piemonte', 'mario.rossi@esempio.com', '1990-05-15'),
('Giulia', 'Verdi', 'F', 'Via Garibaldi 2', 'Asti', 'AT', 'Piemonte', 'giulia.verdi@esempio.com', '1995-06-12'),
('Lorenzo', 'Bianchi', 'M', 'Corso Italia 3', 'Cuneo', 'CN', 'Piemonte', 'lorenzo.bianchi@esempio.com', '1999-07-18'),
('Alessia', 'Neri', 'F', 'Via Mazzini 4', 'Alessandria', 'AL', 'Piemonte', 'alessia.neri@esempio.com', '1994-08-20'),
('Paolo', 'Rizzo', 'M', 'Via Garibaldi 5', 'Novara', 'NO', 'Piemonte', 'paolo.rizzo@esempio.com', '1998-09-27'),
('Laura', 'Conti', 'F', 'Piazza Vittorio Emanuele II 6', 'Vercelli', 'VC', 'Piemonte', 'laura.conti@esempio.com', '1992-10-08'),
('Federico', 'Galli', 'M', 'Via Monte Napoleone 7', 'Milano', 'MI', 'Lombardia', 'federico.galli@esempio.com', '1997-11-11'),
('Martina', 'Ferrari', 'F', 'Via Manzoni 8', 'Monza', 'MB', 'Lombardia', 'martina.ferrari@esempio.com', '1993-12-19'),
('Simone', 'Marini', 'M', 'Via XX Settembre 9', 'Bergamo', 'BG', 'Lombardia', 'simone.marini@esempio.com', '1991-01-24'),
('Valentina', 'Riva', 'F', 'Corso Garibaldi 10', 'Pavia', 'PV', 'Lombardia', 'valentina.riva@esempio.com', '1996-02-21'),
('Andrea', 'Costa', 'M', 'Piazza del Popolo 11', 'Como', 'CO', 'Lombardia', 'andrea.costa@esempio.com', '2000-03-30'),
('Sara', 'Santoro', 'F', 'Via Sempione 12', 'Torino', 'TO', 'Piemonte', 'sara.santoro@esempio.com', '1998-10-05');
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

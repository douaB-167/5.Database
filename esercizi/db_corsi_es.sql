/*
Usate l'utente root, amministratore
Create un database chiamato Corsi
Assegnate all'utente appjava tutti i privilegi sul database appena creato
*/
drop database corsi;
create database corsi;
grant all on corsi.* to 'appjava'@'localhost';
show create database corsi;
/*
Collegatevi come utente appjava, usate il database Corsi e create le tabelle seguenti:
Corsi, Docenti, Iscrizioni, Studenti
le tabelle fanno riferimento alla struttura del database Corsi descritto nelle slide
l'elenco delle tabelle e rispettive colonne è elencato di seguito:
*/
use corsi;
/*
tabella Docenti
  id tipo intero che si auto incrementa, chiave primaria
  nome tipo stringa max 50 caratteri, obbligatorio
  cognome tipo stringa max 50 caratteri, obbligatorio
  email tipo stringa max 100 caratteri, unico, obbligatorio
*/
create table if not exists docenti(
	id tinyint unsigned auto_increment,
    nome varchar(50) not null, 
    cognome varchar(50) not null,
    email varchar(100) unique not null,
    primary key(id)
);
/*
tabella Corsi
  id tipo intero che si auto incrementa, chiave primaria
  titolo tipo stringa max 100 caratteri, obbligatorio
  prezzo tipo decimal 6 cifre di cui 2 decimali, obbligatorio
  docente_id tipo intero positivo, bastano 255 valori, può essere nullo
*/
create table if not exists corsi(
	id int auto_increment,
    titolo varchar(100) not null,
    prezzo decimal(6,2) not null,
    docente_id tinyint unsigned,
    constraint fk_corsi_docenti
    foreign key(docente_id) references docenti(id)
    on update cascade
    on delete restrict,
    primary key(id)
);
/*
tabella Studenti
  id tipo intero che si auto incrementa, chiave primaria
  nome tipo stringa max 50 caratteri, obbligatorio
  cognome tipo stringa max 50 caratteri, obbligatorio
  genere tipo stringa: elenco di stringhe possibili 'f','m','nb',
  indirizzo tipo stringa max 100 caratteri,
  citta tipo stringa max 30 caratteri,
  provincia tipo stringa fissa di 2 caratteri, valore di default: 'To',
  regione tipo stringa max 30 caratteri, valore di default: 'Piemonte',
  email tipo stringa max 100 caratteri, unico, obbligatorio
  data_nascita tipo data,
  data_registrazione il valore di default deve essere current_timestamp,
*/
create table if not exists studenti(
	id int auto_increment,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    genere enum('f', 'm', 'nb') null,
    indirizzo varchar(100),
    citta varchar(30),
    provincia char(2) default 'to',
    regione varchar(30) default 'piemonte', 
    email varchar(100) not null unique,
    data_nascita date,
    data_registrazione timestamp default current_timestamp,
    primary key(id)
);
/*
tabella Iscrizioni
  id tipo intero che si auto incrementa, chiave primaria
  studente_id tipo intero obbligatorio
  corso_id tipo intero obbligatorio
  prezzo tipo decimal 6 cifre di cui 2 decimali, obbligatorio
  data_iscrizione, il valore di default deve essere current_timestamp
*/
create table if not exists iscrizioni(
	id int auto_increment,
    studente_id int not null,
    corso_id int not null,
    prezzo decimal(6,2) not null,
    data_iscrizione timestamp default current_timestamp,
    constraint fk_iscrizioni_studenti
    foreign key(studente_id) references studenti(id)
    on update cascade
    on delete restrict,
    constraint fk_iscrizioni_corsi
    foreign key(corso_id) references corsi(id)
    on update cascade
    on delete restrict,
    primary key(id)
);
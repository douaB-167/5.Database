select titolo, cognome, nome
from docenti, corsi
where docenti.id = corsi.docente_id;

select titolo, email
from docenti, corsi
where docenti.id = corsi.docente_id
and titolo = 'java';

select titolo, cognome, nome, docenti.id, corsi.docente_id
from docenti, corsi;

select corsi.titolo, studenti.cognome, studenti.nome
from iscrizioni, corsi, studenti
where corsi.id = iscrizioni.corso_id
and studenti.id = iscrizioni.studente_id
and titolo = 'basi di dati'
order by corsi.titolo;

select corsi.titolo, studenti.cognome, studenti.nome, docenti.cognome, docenti.nome
from iscrizioni, docenti, studenti, corsi
where docenti.id = corsi.docente_id
and corsi.id = iscrizioni.corso_id
and studenti.id = iscrizioni.studente_id
order by corsi.titolo;

select 
	c.titolo `Titolo del corso`, ##il vincolo è solo nelle tabelle che bisogna utilizzare il nuovo nome
    s.cognome AS `Cognome studente`,
    s.nome AS `Nome studente`, 
    d.cognome AS `Cognome docente`, 
    d.nome `Nome docente` ##AS opzionale
from 
	iscrizioni i, 
    docenti AS d, 
    studenti s, 
    corsi c
where d.id = c.docente_id
and c.id = i.corso_id
and s.id = i.studente_id
order by c.titolo;

select title, price, price * 1.10 `prezzo con IVA`
from app_java2025.books;

-- FOREIGN KEY
alter table corsi
ADD constraint fk_corsi_docenti
foreign key(docente_id) references docenti(id); -- DEFAULT RESTRICT

alter table docenti
modify id tinyint unsigned;

show create table corsi;

select * from corsi;

delete from docenti where id =1; -- non funziona

alter table corsi
drop foreign key fk_corsi_docenti;

alter table corsi
ADD -- constraint fk_corsi_docenti
foreign key(docente_id) references docenti(id)
on update cascade
on delete set null;

alter table corsi 
drop index fk_corsi_docenti;

select * from corsi;

select * from docenti;

delete from corsi where docente_id =1;

update corsi
set docente_id =3 where docente_id =2;

delete from docenti where id =1; -- così funziona
select * from corsi order by docente_id;
desc corsi;
select * from studenti;

update docenti set id = 3 where id = 2;
select * from corsi;

show create table corsi;
alter table corsi
drop foreign key fk_corsi_docenti;

alter table corsi 
drop foreign key `corsi_ibfk_1`;

alter table corsi
ADD constraint fk_corsi_docenti
foreign key(docente_id) references docenti(id)
on update cascade
on delete cascade;

select * from corsi;

delete from docenti where id = 5;

alter table iscrizioni
add constraint fk_iscrizioni_studenti
foreign key(studente_id) references studenti(id)
on update cascade
on delete restrict;

alter table iscrizioni
add constraint fk_iscrizioni_corsi
foreign key(corso_id) references corsi(id)
on update cascade
on delete restrict;

select * from corsi;

select * from iscrizioni;

select @@foreign_key_checks;
set foreign_key_checks = 0;

truncate table docenti;
truncate table studenti;
truncate table iscrizioni;
truncate table corsi;

-- self foreign key
CREATE TABLE IF NOT EXISTS app_java2025.impiegati (
	id int auto_increment,
	nome varchar(50),
	cognome varchar(50),
	ruolo varchar(50),
	id_responsabile int,
	stipendio decimal(6,2),
    constraint sfk_impiegati
	FOREIGN KEY (id_responsabile) REFERENCES impiegati(id)
    ON UPDATE CASCADE
	ON DELETE SET NULL,
	PRIMARY KEY(id)
);

INSERT INTO app_java2025.impiegati
VALUES (1,'Mario','Rossi','tecnico',NULL,2500.00),
(2,'Elena','Totti','amministrativo',NULL,2600.00),
(3,'Paola','Capra','venditore',NULL,2300.00),
(4,'Marco','Bianchi','amministrativo',2,1600.00),
(5,'Paolo','Verdi','amministrativo',2,1600.00),
(6,'Enrico','Marrone','venditore',3,1300.00),
(7,'Nicola','Testa','venditore',3,1300.00),
(8,'Franco','Barba','tecnico',1,1500.00),
(9,'Mauro','Barba','venditore',3,1300.00); 

drop table corsi.impiegati;

select * from app_java2025.impiegati;
delete from app_java2025.impiegati where id = 2;

SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'corsi'
/* AND TABLE_NAME = 'nome_tabella' */
AND referenced_column_name IS NOT NULL;

use app_java2025;
CREATE TABLE libri2 (
	id int AUTO_INCREMENT,
	titolo varchar(255),
	prezzo decimal(6,2) NOT NULL,
	pagine
    smallint unsigned CHECK (pagine > 0) /* CONSTRAINT chk_pagine CHECK (pagine > 0) */,
	editore_id int,
	PRIMARY KEY (id),
	/* CHECK su due colonne */
	CONSTRAINT chk_prezzo_pagine CHECK ((prezzo > 0) AND (pagine > 0))
);

show create table libri2;

insert into libri2(titolo, prezzo, pagine, editore_id)
values('marcovaldo', 25.50, 100, 50);

alter table libri2
drop constraint libri2_chk_1;

alter table libri2
add constraint chk_editore_id check(editore_id > 30);

insert into libri2(titolo, prezzo, pagine, editore_id)
values('il barone rampante', 0, 100, 31);
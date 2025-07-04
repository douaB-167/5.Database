-- INNER JOIN E OUTER JOIN
use corsi;

select cognome, nome, titolo AS `Titolo del corso`
from docenti AS d #abella di sinistra
INNER JOIN corsi AS c #tabella di destra
ON d.id = c.docente_id
where titolo = "html"
order by `Titolo del corso`; 

select cognome, nome, titolo AS `Titolo del corso`
from docenti AS d #abella di sinistra
LEFT JOIN corsi AS c #tabella di destra
ON d.id = c.docente_id
order by `Titolo del corso`; 

select cognome, nome, titolo AS `Titolo del corso`
from docenti AS d #abella di sinistra
RIGHT JOIN corsi AS c #tabella di destra
ON d.id = c.docente_id
order by `Titolo del corso`; 

select cognome, nome
from docenti AS d #abella di sinistra
LEFT JOIN corsi AS c #tabella di destra
ON d.id = c.docente_id
WHERE c.id IS NULL
order by cognome; 

select titolo
from docenti AS d #abella di sinistra
RIGHT JOIN corsi AS c #tabella di destra
ON d.id = c.docente_id
WHERE d.id IS NULL
order by titolo; 

SELECT cognome, nome, titolo
FROM studenti s
JOIN iscrizioni i 
ON s.id = i.studente_id
JOIN corsi c
ON c.id = i.corso_id
ORDER BY titolo;

SELECT cognome, nome, titolo
FROM studenti s
RIGHT JOIN iscrizioni i 
ON s.id = i.studente_id
RIGHT JOIN corsi c
ON c.id = i.corso_id
ORDER BY cognome;

-- FULL OUTER JOIN, solo gli esclusi
select cognome, nome, titolo
from docenti AS d 
LEFT JOIN corsi AS c
ON d.id = c.docente_id
WHERE c.id IS NULL
UNION
select cognome, nome, titolo
from docenti AS d 
RIGHT JOIN corsi AS c
ON d.id = c.docente_id
WHERE d.id IS NULL
order by cognome; 

# tutti quanti, nessuno esluso
select cognome, nome, titolo
from docenti AS d 
LEFT JOIN corsi AS c
ON d.id = c.docente_id
UNION
select cognome, nome, titolo
from docenti AS d 
RIGHT JOIN corsi AS c
ON d.id = c.docente_id
order by cognome; 

-- SELF JOIN
use app_java2025;
select * from impiegati;

truncate impiegati;

INSERT INTO `impiegati`
VALUES (1,'Mario','Rossi','tecnico',NULL,2500.00),
(2,'Elena','Totti','amministrativo',NULL,2600.00),
(3,'Paola','Capra','venditore',NULL,2300.00),
(4,'Marco','Bianchi','amministrativo',2,1600.00),
(5,'Paolo','Verdi','amministrativo',2,1600.00),
(6,'Enrico','Marrone','venditore',3,1300.00),
(7,'Nicola','Testa','venditore',3,1300.00),
(8,'Franco','Barba','tecnico',1,1500.00),
(9,'Mauro','Barba','venditore',3,1300.00); 

select i.cognome, i.nome, i.ruolo, r.cognome RespC, r.nome RespN
from impiegati r
join impiegati i
on i.id_responsabile = r.id
order by ruolo;

select i.cognome, i.nome, i.ruolo, r.cognome RespC, r.nome RespN
from impiegati i
left join impiegati r
on i.id_responsabile = r.id
order by ruolo;

use corsi;
alter table docenti 
rename column id to docente_id;

select * from docenti;

use corsi;
alter table docenti 
rename column docenti_id to docente_id;

select cognome, nome, titolo
from docenti
join corsi
using(docente_id)
order by titolo;

-- CROSS JOIN
select cognome, nome, titolo
from docenti join corsi;

use app_java2025;

create table prodotti(
	id int auto_increment primary key,
    prodotto varchar(59)
);

insert into prodotti(prodotto)
value ('tazza'),('maglietta'),('penna');

create table colori(
	id int auto_increment primary key,
    colore varchar(59)
);

insert into colori(colore)
value ('giallo'),('verde'),('blu');

select * from prodotti;
select * from colori;

select prodotto, colore
from prodotti
cross join colori;

-- JOIN IN UPDATE E DELETE
use corsi;

UPDATE corsi c 
LEFT JOIN docenti d
ON d.docente_id = c.docente_id
SET prezzo = prezzo * 0.90
where d.docente_id IS NULL;

select prezzo from corsi
where titolo = "Angular";

select * from corsi;

-- delete
select docente_id, cognome, nome from docenti
left join corsi 
using(docente_id)
where corsi.id is null; 

DELETE docenti
FROM docenti
LEFT JOIN corsi
USING(docente_id)
WHERE corsi.id IS NULL; 

use app_java2025;

create table generazione(
	id int auto_increment primary key,
	generazione varchar(20),
	anno_inizio date,
	anno_fine date
);

alter table generazione
rename generazioni;

insert into generazioni(generazione, anno_inizio, anno_fine)
values 
('Boomers', '1946-01-01', '1964-12-31'),
('X', '1965-01-01', '1980-12-31'),
('Millenials', '1981-01-01', '1996-12-31'),
('Z', '1997-01-01', '2012-12-31');

select * from generazioni;

-- EQUI-JOIN
select s.cognome, s.nome, s.data_nascita, g.generazione
from studenti s
join generazioni g
on s.data_nascita
between g.anno_inizio and g.anno_fine
order by s.data_nascita;
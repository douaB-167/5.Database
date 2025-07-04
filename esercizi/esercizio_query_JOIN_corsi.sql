-- USARE SINTASSI JOIN
-- corsi, docenti
/* 1
Seleziona cognome, nome, email dei docenti
e titolo corso che insegnano
e ordina per cognome e nome
*/
use corsi; 

select docenti.cognome, docenti.nome, docenti.email, corsi.titolo
from docenti
join corsi
using(docente_id)
order by docenti.cognome, docenti.nome;
# 9 rows
/* 2
Seleziona il titolo del corso con prezzo inferiore a 200€ (non incluso)
e cognome, nome, email dei docenti che insegnano in quel corso,
ordina per prezzo in modo discendente
*/
select corsi.titolo, docenti.cognome, docenti.nome, docenti.email
from docenti
join corsi
using(docente_id)
where corsi.prezzo < 200
order by corsi.prezzo desc;
# 5 rows
/* 3
Seleziona cognome, nome, email del docente
che insegna nel corso HTML
*/
select docenti.cognome, docenti.nome, docenti.email
from docenti
join corsi 
using(docente_id)
where corsi.titolo = "HTML";
#1 row
/* 4
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
select docenti.cognome, docenti.nome, docenti.email, corsi.titolo
from docenti
left join corsi 
using(docente_id)
order by corsi.titolo, docenti.cognome, docenti.nome;
# 9 rows
/* 5
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I CORSI CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
select docenti.cognome, docenti.nome, docenti.email, corsi.titolo
from docenti
right join corsi 
using(docente_id)
order by corsi.titolo, docenti.cognome, docenti.nome;
# 10 rows
/* 6
Seleziona cognome, nome, email
SOLO DEI DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per cognome e nome
*/
select docenti.cognome, docenti.nome, docenti.email
from docenti
left join corsi 
using (docente_id)
where docenti.docente_id is null
order by docenti.cognome, docenti.nome;
# 0 row
/* 7
Seleziona titolo SOLO DEI CORSI 
CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo
*/
select docenti.cognome, docenti.nome, corsi.titolo
from docenti
right join corsi 
using (docente_id)
where corsi.docente_id is null
order by corsi.titolo;
# 1 row
-- studenti, corsi, iscrizioni
/* 8
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e ordina per titolo, cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email, corsi.titolo
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
order by corsi.titolo, studenti.cognome, studenti.nome;
# 39 rows
/* 9
Seleziona cognome, nome, email, degli studenti
iscritti al corso di Java
e ordina per cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email 
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
where corsi.titolo = "Java"
order by studenti.cognome, studenti.nome;
# 10 rows
/* 10a
Seleziona cognome, nome, email, degli studenti 
iscritti a corsi per i quali hanno pagato più di 200€(compresi)
e ordina per cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
where iscrizioni.prezzo >= 200
order by studenti.cognome, studenti.nome;
# 18 rows
-- 10b Aggiungi il titolo corso alla query precedente
select studenti.cognome, studenti.nome, studenti.email, corsi.titolo
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
where iscrizioni.prezzo >= 200
order by studenti.cognome, studenti.nome;
# 18 rows
/* 11
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE GLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per titolo, cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email, corsi.titolo
from studenti
left join iscrizioni
on studenti.id = iscrizioni.studente_id
left join corsi
on corsi.id = iscrizioni.corso_id
order by corsi.titolo, studenti.cognome, studenti.nome;
# 63 rows
/* 12
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo, cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email, corsi.titolo
from studenti
right join iscrizioni
on studenti.id = iscrizioni.studente_id
right join corsi
on corsi.id = iscrizioni.corso_id
order by corsi.titolo, studenti.cognome, studenti.nome;
# 44 rows
/* 13
Seleziona cognome, nome, email
SOLO DEGLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per cognome e nome
*/
select studenti.cognome, studenti.nome, studenti.email
from studenti
left join iscrizioni
on studenti.id = iscrizioni.studente_id
left join corsi
on corsi.id = iscrizioni.corso_id
where corsi.id is null
order by studenti.cognome, studenti.nome;
# 24 rows
/* 14
Seleziona titolo del corso
SOLO PER I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo
*/
select corsi.titolo
from studenti
right join iscrizioni
on studenti.id = iscrizioni.studente_id
right join corsi
on corsi.id = iscrizioni.corso_id
where iscrizioni.id is null
order by corsi.titolo;
# 5
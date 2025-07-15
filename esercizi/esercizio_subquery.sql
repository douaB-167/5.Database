-- SUBQUERY
-- Scrivete le query richieste usando le subquery
-- RICORDATEVI che dovete conoscere come sono organizzati i dati per capire dove andare a prenderli

-- DB corsi
-- 01 selezionate titolo, prezzo dei corsi che costano meno del prezzo medio totale dei corsi
use corsi;
select avg(prezzo)
from corsi;

select nome_corso titolo, prezzo
from corsi 
where prezzo < (select avg(prezzo) from corsi);

-- 02) Seleziona cognome, nome, email degli studenti non iscritti ad alcun corso
-- e ordina per cognome
select distinct cognome, nome, email 
from studenti 
left join iscrizioni
on studenti.id = iscrizioni.studente_id
where iscrizioni.studente_id is null
order by cognome;
-- 03) contate gli studenti non iscritti ad alcun corso
select 'Studenti non iscritti' studenti, count(*)
from studenti 
left join iscrizioni
on studenti.id = iscrizioni.studente_id
where iscrizioni.studente_id is null;
-- DB gestionale
-- 04) Selezionate nome, cognome, ruolo degli impiegati che lavorano nella città di Milano
use gestionale;
select nome, cognome, ruolo 
from impiegati 
where ufficio_id = any
				(select id from uffici where citta = 'milano');
-- 05) Selezionate cognome, nome, email del cliente che ha eseguito il primo ordine
-- attenzione il primo ordine NON ha necessariamente id = 1
-- aiuto: join + subquery oppure 2 subquery nidificate in query princiaple
select clienti.cognome, clienti.nome, clienti.email
from clienti
join ordini
on clienti.id = ordini.cliente_id
where ordini.data = (select min(ordini.data) from ordini);

-- 06) inserite un ordine di 10 monitor per il cliente "Bruni Carlo" che ha ID = 7
-- con data di oggi, stato di consegna: "da spedire"
-- dovete scrivere due query
-- inserite prima record in tabella ordine
-- inserite il dettaglio nella tabella ordini_dettaglio
-- ricordandovi della funzione last_insert_id()
-- q01
select cognome, nome from clienti;

insert into clienti
insert into ordini(cliente_id, data, consegna)
values (7, '2025-07-15', 'da spedire');

insert into ordini_dettaglio(ordine_id, quantita)
values(last_insert_id(ordine_id), 10)
-- q02


-- 07) selezionate elenco dei corsi con il valore massimo di iscritti
-- ricordatevi dell'operatore ALL, fate riferimento alla slide
select max()
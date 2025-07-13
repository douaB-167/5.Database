use corsi;
-- 1)
-- Conta gli studenti divisi per genere
-- la tabelle risultante mostrerà i seguenti attributi
-- Genere, Quanti
select
	genere,
    count(genere) `quanti`
from studenti
group by genere;
-- 2)
-- Conta gli studenti divisi per regione
-- la tabelle risultante mostrerà i seguenti attributi
-- Regione, Quanti
select 
	regione,
    count(regione) `quanti`
from studenti 
group by regione;
-- 3)
-- Conta quanti studenti ci sono per ogni combinazione di regione e genere.
-- Mostra i risultati ordinati dal gruppo con più studenti a quello con meno 
select 
	regione,
    genere,
    count(*) `quanti`
from studenti
group by regione, genere
order by `quanti` desc;
-- 4)
-- Conta gli studenti divisi per genere solo della provincia di Alessandria
-- la tabelle risultante mostrerà i seguenti attributi
-- Genere, Quanti
select 
	genere,
    count(genere) `quanti`
from studenti 
where provincia = 'AL'
group by genere;
-- 5)
-- Conta il numero di studenti iscritti a ciascun corso.
-- Ordina il risultato in ordine decrescente in base al numero di iscritti per corso.
select 
	titolo,
    count(iscrizioni.studente_id) `numero iscritti`
from corsi
join iscrizioni
on corsi.id = iscrizioni.corso_id
group by corsi.titolo
order by `numero iscritti` desc; 
select * from corsi;
-- 6)
-- Conta quanti corsi tiene ciascun professore.
-- Mostra il cognome e nome del docente insieme al numero di corsi assegnati.
-- Ordina i risultati in ordine decrescente in base al numero di corsi.
select 
	cognome,
    nome,
    count(corsi.id) `numero corsi`
from docenti
join corsi
on docenti.id = corsi.docente_id
group by cognome, nome
order by `numero corsi` desc;
-- Aggiungerei al GROUP BY anche docenti.id =>
-- GROUP BY docenti.id, cognome, nome
-- Se ci sono omonimie?

-- 7)
-- Calcola il valore totale delle iscrizioni per ciascun corso, sommando il prezzo pagato da tutti gli studenti iscritti.
-- Mostra il titolo del corso e la somma totale.
select 
	corsi.titolo,
    sum(iscrizioni.prezzo) `somma totale`
from corsi
join iscrizioni
on corsi.id = iscrizioni.corso_id
group by corsi.titolo;
-- 8)
-- Calcola la media spesa da ogni studente, a quanti corsi è iscritto e il vaolore speso
-- dai un alias leggibile alle colonne prodotte dalle funzioni.
select 
	studenti.cognome,
    studenti.nome,
    count(iscrizioni.corso_id) `corsi iscritti`,
    sum(iscrizioni.prezzo) `spesa totale`,
	avg(iscrizioni.prezzo) `spesa media`
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
group by studenti.nome, studenti.cognome 
order by `spesa totale` desc;
-- ATTENZIONE a come scrivi il GROUP BY
-- Aggiungerei al GROUP BY anche studenti.id =>
-- GROUP BY studenti.id, cognome, nome
-- Se ci sono omonimie?

-- 9) Conta gli studenti divisi per regione e per genere mostrando anche i totali aggregati
-- ricordatevi della funzione grouping() e dell'istruzione with rollup
-- la tabelle risultante mostrerà i seguenti attributi, con le righe in più dei subtotali e del totale
-- Regione, Genere, Quanti
select
	if(grouping(provincia), 'totale', provincia) as Provincia,
	if(grouping(genere), 'totale genere', genere) as Genere,
    count(*) `quanti`
from studenti
group by provincia, genere
with rollup;
-- ATTENZIONE alla consegna: Conta gli studenti divisi per regione e per genere =>
-- if(grouping(regione), 'totale', regione) as Regione,
-- e
-- group by regione, genere

-- 10) Calcola età media degli studenti divisi per regione
-- la tabelle risultante mostrerà i seguenti attributi
-- Regione, `età media`
select
	regione,
    round(avg(timestampdiff(year,data_nascita, curdate()))) `età media`
from studenti
group by regione;
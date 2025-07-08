-- group by
use corsi;
select distinct cognome from studenti;

select cognome
from studenti group by cognome;

select 
	cognome,
	count(cognome) `quanti`
from studenti
group by cognome
order by `quanti` desc;

select
	genere,
    count(genere)
from studenti
group by genere;

select 
	cognome,
    nome,
    count(*) `quanti`
from docenti d 
join corsi c 
using (docente_id)
group by d.docente_id
order by `quanti` desc;

select 
	genere, 
    floor(avg(timestampdiff(year, data_nascita, curdate()))) `età media`,
    count(*) `quanti`
from studenti
where data_nascita IS NOT NULL and genere IS NOT NULL
group by genere
order by `età media`;

select 
	cognome, 
    nome, 
    sum(prezzo) `valore corsi`
from docenti d
join corsi c 
on d.docente_id = c.docente_id
group by d.docente_id
order by `valore corsi` desc;

select 
	cognome,
    nome,
    round(avg(prezzo),2) `Spesa media`,
    count(*) `Iscrizioni`, 
    sum(prezzo) `Totale speso`,
    min(prezzo) `Minimo spese`,
    max(prezzo) `Massimo speso`
from studenti s
join iscrizioni i
on s.id = i.studente_id
where provincia = 'to'
group by s.id
having `Iscrizioni` > 1 #filtra le righe dopo il ragruppamento, where le filtra prima
order by `Iscrizioni` desc;

select 
	provincia,
    genere,
    count(*) `quanti`,
    floor(avg(timestampdiff(year, data_nascita, curdate()))) `età media`
from studenti
where regione = 'piemonte'
group by provincia, genere
having `quanti` > 1
order by provincia, genere;

select 
	regione,
	provincia,
	genere, 
    count(*) `quanti`
from studenti
group by regione, provincia, genere
order by regione, provincia, genere;

-- group by ... with rollup
select 
	provincia,
    genere,
    count(*) `quanti`
from studenti
group by provincia, genere
with rollup; 

select 
	provincia,
    genere,
    count(*) `quanti`
from studenti
where genere is not null
group by provincia, genere
with rollup; 

-- grouping()
select 
	provincia,
    count(*) `quanti`,
    grouping(provincia)
from studenti
group by provincia
with rollup;

select 
	if(grouping(provincia), 'totale', provincia) as Provincia,
	count(*) `quanti`
from studenti
group by provincia
with rollup;

select 
	if(grouping(provincia), 'totale', provincia) as Provincia,
	if(grouping(genere), 'totale genere', genere) as Genere,
	count(*) `quanti`
from studenti
group by provincia, genere
with rollup;

select 
	titolo,
    count(*) `quanti`
from iscrizioni i
join corsi c
on i.corso_id = c.id
group by c.id
order by `quanti` desc;
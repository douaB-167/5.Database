create temporary table studenti_giovani
select 
	studenti.id,
	nome,
    cognome,
    timestampdiff(year, data_nascita, curdate()) `eta`
from studenti
having `eta` <= 30;

select * from studenti_giovani; #è solo visibile dal client che la crea

select 
	nome,
    cognome,
    timestampdiff(year, data_nascita, curdate()) `eta`,
    nome_corso `titolo corso`
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
having `eta` > 30;

drop temporary table studenti_giovani;

select 
	nome,
    cognome,
    `eta`,
    nome_corso `titolo corso`
from studenti_giovani
join iscrizioni
on studenti_giovani.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id;

select
	nome_corso,
	count(*) `quanti`
from studenti_giovani
join iscrizioni
on studenti_giovani.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
group by nome_corso;
-- grouping
-- restituisce true o false
select 
	provincia, 
	genere,
    count(*)
from studenti
group by provincia, genere
with rollup; #produce una riga in più, rappresenta il totale dei gruppi, segue il group by

select 
	provincia, 
	genere,
    count(*) `quanti`,
    grouping(provincia),
    grouping(genere)
from studenti
group by provincia, genere
with rollup;

select 
	if(grouping(genere), 'totale', genere),
    count(*) `quanti`,
    grouping(genere)
from studenti
group by genere
with rollup;
# il totale è il superaggregato degli agregati, se è un superaggregato restituisce true sennò false 

-- view, tabelle logiche
use corsi;

create view studenti_info as
select 
	nome, 
    cognome, 
    email
from studenti;

show tables;
show full tables; #aggiunge l'informazione se è una tabella oppure una vista

rename table studenti_info to vw_studenti_info;

alter view vw_studenti_info as
select 
	nome, 
    cognome, 
    email
from studenti
where provincia = 'to';

select * from vw_studenti_info
where cognome like 'v%';

show create view vw_studenti_info;

drop view vw_studenti_info;

create view vw_studenti_info as
select 
	nome, 
    cognome, 
    email
from studenti;

update vw_studenti_info 
set email = 'ffrrss@icloud.com'
where cognome = 'rossi' and nome = 'franco';

select * from vw_studenti_info
order by cognome, nome;

insert into vw_studenti_info(nome, cognome, email)
values('mauro', 'sacchi', 'mscc@icloud.com');

select * from vw_studenti_info
order by cognome;

select * from studenti;

create view vw_iscritti_info as 
select 
	studenti.cognome, 
    studenti.nome, 
    studenti.email,
    corsi.titolo, 
    iscrizioni.prezzo, 
    iscrizioni.data_iscrizione
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id;

alter view vw_iscritti_info as 
select 
	studenti.cognome, 
    studenti.nome, 
    studenti.genere,
    studenti.email,
    corsi.titolo, 
    iscrizioni.prezzo, 
    iscrizioni.data_iscrizione
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id;

show tables;

# da farlo su root
create user 'look'@'localhost' identified by 'look_corsi!';

GRANT SELECT ON corsi.vw_iscritti_info to 'look'@'localhost';

alter view vw_iscritti_info as 
select 
	studenti.cognome `Cognome`, 
    studenti.nome `Nome`, 
    studenti.genere `Genere`,
    studenti.email `Contatto`,
    corsi.titolo `Corso`, 
    iscrizioni.prezzo `Prezzo pagato`, 
    iscrizioni.data_iscrizione `Data iscrizione`
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id;

select cognome, nome, titolo
from docenti
join corsi 
using(docente_id)
order by titolo;

select cognome, nome, titolo
from docenti
join corsi 
using(docente_id)
where titolo = 'css';

select cognome, nome, titolo
from docenti
join corsi 
using(docente_id)
where cognome = 'rossi' and nome = 'paolo';

-- tabella
-- corsi -> catalogo_corsi
-- attributo
-- titolo -> nome_corso

rename table corsi to catalogo_corsi;

alter table catalogo_corsi rename column titolo to nome_corso;

select cognome, nome, nome_corso
from docenti
join catalogo_corsi 
using(docente_id)
order by nome_corso;

select cognome, nome, nome_corso
from docenti
join catalogo_corsi 
using(docente_id)
where nome_corso = 'css';

select cognome, nome, nome_corso
from docenti
join catalogo_corsi 
using(docente_id)
where cognome = 'rossi' and nome = 'paolo';

create view vw_corsi_info as 
select cognome, nome, nome_corso
from docenti
join catalogo_corsi 
using(docente_id);

select * from vw_corsi_info;

rename table catalogo_corsi to corsi;
alter table corsi rename column nome_corso to titolo;

alter view vw_corsi_info as
select 
	cognome,
    nome,
    titolo nome_corso
from docenti
join corsi catalogo_corsi
using(docente_id);

select cognome, nome, nome_corso from vw_corsi_info;

select cognome, nome, nome_corso from vw_corsi_info
where nome_corso = 'css';

select cognome, nome, nome_corso from vw_corsi_info
where cognome = 'rossi' and nome = 'paolo';

-- query su base table
select cognome, nome, titolo
from docenti
join corsi 
using(docente_id)
where titolo = 'css';

-- query su vista
select cognome, nome, titolo 
from vw_corsi_info
where titolo = 'css';

alter table corsi rename column titolo to nome_corso;

alter view vw_corsi_info as
select 
	cognome,
    nome,
    nome_corso titolo 
from docenti
join corsi catalogo_corsi
using(docente_id);

create view vw_iscrizioni_limitata as
select 
	studenti.nome `Nome`,  
    studenti.cognome `Cognome`, 
    corsi.nome_corso `Titolo`, 
    iscrizioni.data_iscrizione `Data iscrizione`
from studenti
join iscrizioni on studenti.id = iscrizioni.studente_id
join corsi on corsi.id = iscrizioni.corso_id;

select * from vw_iscrizioni_limitata;

-- da fare come admin
GRANT SELECT ON corsi.vw_iscrizioni_limitata to 'look'@'localhost';

create or replace view vw_iscritti_info as 
select 
	studenti.cognome `Cognome`, 
    studenti.nome `Nome`, 
    studenti.genere `Genere`,
    studenti.email `Contatto`,
    corsi.nome_corso `Corso`, 
    iscrizioni.prezzo `Prezzo pagato`, 
    iscrizioni.data_iscrizione `Data iscrizione`
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id;

-- view con check option
create view studenti_v as
select id, nome, cognome, email, provincia
from studenti
where provincia = 'to';

select * from studenti_v;

update studenti_v
set provincia = 'cn'
where id = 7;

alter view studenti_v as
select id, nome, cognome, email, provincia
from studenti
where provincia = 'to'
with check option;

update studenti_v
set provincia = 'cn'
where id = 1;

insert into studenti_v(nome, cognome, email, provincia)
values('paolo', 'picchio', 'pppppicchio@gmail.com', 'to');
# subquery
select stipendio from impiegati where id = 6;
-- 1500.00
-- query interna
select nome, cognome, stipendio 
from impiegati
where stipendio > 1500.00
order by stipendio desc;
-- query esterna
select nome, cognome, stipendio 
from impiegati
where stipendio > (select stipendio from impiegati where id = 6)
order by stipendio desc;

select * from impiegati;

use corsi;
select nome_corso titolo, prezzo
from corsi
where prezzo > (select avg(prezzo) from corsi)
order by prezzo desc;

select nome_corso titolo, prezzo
from corsi
where prezzo = (select max(prezzo) from corsi);

use gestionale;

select max(id) 
from ordini;

select clienti.nome, clienti.cognome, clienti.email, ordini.id
from clienti
join ordini
on clienti.id = ordini.cliente_id
where ordini.id = (select max(id) from ordini);

select max(id) from ordini;

select cognome, nome, email
from clienti
where id = 
		(select cliente_id from ordini
        where id = (select max(id) from ordini)
        );

select nome, cognome, stipendio 
from impiegati
where stipendio > (select avg(stipendio) from impiegati)
order by stipendio desc;

select uffici.nome, avg(stipendio) `stipendio medio`
from impiegati
join uffici
on impiegati.ufficio_id = uffici.id
group by ufficio_id;

-- operatori a più righe ALL, ANY, IN 
select uffici.nome, avg(stipendio) `stipendio medio`
from impiegati
join uffici
on impiegati.ufficio_id = uffici.id
group by ufficio_id
having `stipendio medio` >= all -- operatore a più righe
(select avg(stipendio) `stipendio medio`
from impiegati
join uffici
on impiegati.ufficio_id = uffici.id
group by ufficio_id);

select cognome, nome
from impiegati
where ufficio_id = any
				(select id from uffici where regione = 'piemonte');
		
select impiegati.nome, cognome
from impiegati
join uffici
on impiegati.ufficio_id = uffici.id
where regione = 'piemonte';

select 'Piemonte' regione, count(*) `quanti`
from impiegati
where ufficio_id = any
				(select id from uffici where regione = 'piemonte');
                
-- IN, NOT IN
select distinct nome, cognome
from clienti
join ordini 
on clienti.id = ordini.cliente_id
order by cognome;

select nome, cognome
from clienti
where id in(select distinct cliente_id from ordini);

select nome, cognome
from clienti
left join ordini 
on clienti.id = ordini.cliente_id
where ordini.id is null
order by cognome;

select nome, cognome
from clienti
where id not in(select distinct cliente_id from ordini);

use app_java2025;

-- row(colonna1, colonna2, colonna_n)
select nome, cognome from amici 
where (nome, cognome) = row('franco', 'rossi');

select nome, cognome from amici 
where (nome, cognome) = (select nome, cognome from parenti where id = 15);

-- subquery correlate
use gestionale;
update articoli set rimanenza = 100;
select * from articoli;

select * from ordini_dettaglio;
select descrizione, sum(quantita)
from ordini_dettaglio 
join articoli
on ordini_dettaglio.articolo_id = articoli.id
group by articolo_id;

update articoli 
set rimanenza = rimanenza - (
	select sum(quantita) from ordini_dettaglio 
    where articoli.id = ordini_dettaglio.articolo_id
);

select * from articoli;
-- ifnull funzione di mysql
update articoli 
set rimanenza = rimanenza - 
	ifnull(
		(select sum(quantita) from ordini_dettaglio 
		where articoli.id = ordini_dettaglio.articolo_id), 0
		);
   
-- coalesce() standard SQL   
update articoli 
set rimanenza = rimanenza - 
	coalesce(
		(select sum(quantita) from ordini_dettaglio 
		where articoli.id = ordini_dettaglio.articolo_id), 0
		);
        
select * from clienti;
update clienti set credito = 0;

UPDATE clienti c
SET credito = COALESCE(
	(SELECT SUM(od.prezzo * od.quantita)
	FROM ordini o
	JOIN ordini_dettaglio od ON o.id = od.ordine_id
	WHERE o.cliente_id = c.id), 0
	);

-- exists, not exists
SELECT cognome, nome
FROM clienti c
WHERE EXISTS
(SELECT 1 FROM ordini o WHERE o.cliente_id = c.id);

-- subquery in from 
use corsi;
select * from vw_studenti_info;

select nome, cognome, email
from studenti;

select * from 
	(select nome, cognome, email
	from studenti) as tbl;
    
use gestionale;
select sum(quantita) `q articoli`
from ordini_dettaglio
group by ordine_id;

select max(`q articoli`), min(`q articoli`), avg(`q articoli`)
from (
	select sum(quantita) `q articoli`
	from ordini_dettaglio
	group by ordine_id
	) as tbl; -- nome temporaneo
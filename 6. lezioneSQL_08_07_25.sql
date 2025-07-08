use corsi;

# funzioni di aggregazione
-- avg(colonna)
select * from corsi;
select avg(prezzo) `prezzo medio` from corsi;

-- count(*), count(colonna)
select count(*) `quanti corsi` from corsi;
select * from corsi;
select count(docenti_id) from corsi;

select count(cognome) from studenti;
select count(DISTINCT cognome) from studenti;

select count(*) `totale femmine` from studenti
where genere = 'f';

select count(*) `totale femmine` from studenti
where genere = 'm';

select count(genere) from studenti
where genere is null;

-- sum(colonna)
select sum(i.prezzo) `totale iscrizioni` from iscrizioni i
join corsi c on c.id = i.corso_id
where corso_id = 1;
select sum(i.prezzo) `totale iscrizioni` from iscrizioni i
join corsi c on c.id = i.corso_id
where titolo = 'html';

-- max(colonna), min(colonna)
select max(prezzo) `corso più caro`,
	   min(prezzo) `corsi più eco` 
from corsi;

# funzioni matematiche
-- round(colonna, [numero decimale])
select round(avg(prezzo), 1) `prezzo medio` from corsi;

-- floor(), ceiling()
select floor(155.65), ceiling(55.65);

# funzioni stringa
-- length(colonna)
select cognome, length(cognome) from studenti;

-- concat()
select cognome, nome, concat(cognome, ' ', nome) from studenti;

-- concat_ws(separatore, colonna/e)
select concat_ws(' ', cognome, nome, email, indirizzo) `info complete` from studenti;

-- substring(colonna, start, end
select cognome, substring(cognome, 2, 3) from studenti;

select round(avg(length(concat(cognome, nome)))) `lunghezza media` from studenti;

-- funzioni informative
-- last_insert_id()
insert into docenti(nome, cognome, email)
values ('enrico', 'macello', 'emac@icloud.com');

set foreign_key_checks = 1;
desc docenti;
alter table docenti
modify docente_id tinyint unsigned auto_increment;

select last_insert_id();

select * from docenti;

update corsi set docente_id = last_insert_id()
where id = 9;

select * from corsi;

select * from studenti;

insert into studenti(nome, cognome, email)
values
('isabella', 'bianchi', 'isb@gmail.com'),
('mauro', 'biglia', 'mbiglia@gmail.com'),
('gino', 'verdi', 'gvdi@gmail.com');

select last_insert_id();

insert into studenti(nome, cognome, email)
values
('pino', 'abete', 'pbate@gmail.com');

-- replace() case sensitive
select indirizzo, replace(indirizzo, 'corso', 'Viale') from studenti;
select * from studenti;

-- regexp_replace() indipendentemente da maiuscola o minuscola
select indirizzo, regexp_replace(indirizzo, '(?i)corso', 'Viale') from studenti;

# funzioni di data e ora
-- now()
select now();

-- curdate()
select curdate();

-- curtime()
select curtime();

-- year(), month(), day()
select data_nascita, year(data_nascita) from studenti;
select data_nascita, month(data_nascita) from studenti;

-- monthname(), dayname()
select data_nascita, dayname(data_nascita) from studenti;
select data_nascita, dayofweek(data_nascita) from studenti;

-- minute(), hour(), second()
select data_registrazione, second(data_registrazione) from studenti;

select @@lc_time_names;

set lc_time_names = 'it_IT';

select dayofweek('2025-07-08');

-- date_format()
select data_nascita, date_format(data_nascita, '%d/%m/%Y') from studenti;

select curtime(), time_format(curtime(), '%h:%i %p');

-- str_to_date
update studenti 
set data_nascita = str_to_date(concat_ws('-', '05', '10', '1969'), '%d-%m-%Y')
where id = 51;

select adddate('2025-07-08', 7);
select adddate('2025-07-08', interval 7 month);
select adddate('2025-07-08', interval 7 year);

select datediff(curdate(), '2025-08-15');
select data_nascita, timestampdiff(year, data_nascita, curdate()) `età` from studenti
order by `età`;

alter table studenti add eta tinyint unsigned after data_nascita;

update studenti set eta = timestampdiff(year, data_nascita, curdate());

insert into studenti(cognome, nome, email, data_nascita, eta)
values('cettola', 'franco', 'frcttla@icloud.com', '1978-07-28', timestampdiff(year, data_nascita, curdate()));
select * from studenti;

-- control flow function
-- if
-- case
select * from studenti order by regione;

select 
	cognome, 
    nome, 
    if(provincia = 'to', 'in sede', 'fuori sede') `provenienza`
from studenti
order by `provenienza`;

-- case 
select
	provincia,
	case provincia 
    WHEN 'to' THEN 'Torino'
	WHEN 'at' THEN 'Asti'
	WHEN 'no' THEN 'Novara'
	WHEN 'al' THEN 'Alessandria'
	WHEN 'cn' THEN 'Cuneo'
	WHEN 'bg' THEN 'Bergamo'
	WHEN 'mi' THEN 'Milano'
	ELSE 'non tradotto' END `Provincia completa`
FROM studenti
order by provincia;

use app_java2025;
select * from libri2;

select 
	prezzo,
    case
		when prezzo < 30 then 'economico'
        when prezzo >= 30 then 'caro'
	end `valutazione`
from libri2;

select 
	cognome,
	case
		when genere = 'f' then 'Donna'
		when genere = 'm' then 'Uomo'
	else 'Not binary'
    end `genere`
from studenti;

# funzioni JSON
create table articoli(
	id int auto_increment primary key,
    descrizione varchar(100),
    specifiche JSON
);

desc articoli;

INSERT INTO articoli(descrizione, specifiche)
VALUES(
	'TV SAMSUNG 32" SMART TV',
	'{
		"marca": "SAMSUNG",
		"pesoKg": "5.12",
		"schermo": "LCD",
		"pollici": 32,
		"uscite": ["HDMI", "USB"]
	}'
);

select * from articoli;

# funzioni JSON
-- json_object
insert into articoli(descrizione, specifiche)
values (
	'TV SONY 32" SMART  TV', 
    json_object(
		"marca", "SONY", "pesoKG", 6.5, "schermo", "LED", "pollici", 32, "uscite", "hdmi"
    )
);

-- json_array
insert into articoli(descrizione, specifiche)
values (
	'TV SONY 32" SMART  TV', 
    json_object(
		"marca", "SONY", "pesoKG", 6.5, "schermo", "LED", "pollici", 32,
        "uscite", json_array("hdmi", "hdmi2", "USB", "SCART")
    )
);

-- json_extract
select json_extract(specifiche, '$.pesoKG') from articoli;
select json_extract(specifiche, '$.uscite[1]') from articoli;

insert into articoli(descrizione, specifiche)
values (
	'TV LG 55" SMART  TV', 
    json_object(
		"marca", "LG", "pesoKG", 9.5, "schermo", "OLED", "pollici", 55,
        "uscite", 
        json_array("hdmi", "hdmi2", "USB", "SCART"),
        "misure", json_object("altezza", "50cm", "profondità", "3cm", "larghezza", "42cm")
    )
);

select json_extract(specifiche, '$.misure.altezza') from articoli
where id = 4;

select specifiche -> '$.marca' from articoli;

-- json-set
UPDATE articoli
SET specifiche =
JSON_SET(specifiche,
'$.marca','LG',
'$.uscite',JSON_ARRAY('HDMI','SCART','S/PDIF'),
'$.ingressi',JSON_ARRAY('ETHERNET','USB'))
WHERE id = 1;

-- json_insert
UPDATE articoli
SET specifiche = JSON_INSERT(specifiche,'$.uscite[2]','RGB')
WHERE id = 1;
-- non produce risultato perché la posizione nell'array è occupata

UPDATE articoli
SET specifiche = JSON_INSERT(specifiche,'$.uscite[3]','RGB')
WHERE id = 1;
-- aggiunge il nuovo elemento

-- json_replace
UPDATE articoli
SET specifiche = JSON_REPLACE(specifiche,'$.marca','SAMSUNG')
WHERE id = 1;

UPDATE articoli
SET specifiche = JSON_REPLACE(specifiche,'$.ingressi','USB')
WHERE id = 2;

-- json_remove
UPDATE articoli
SET specifiche = JSON_REMOVE(specifiche,'$.profondita')
WHERE id = 1; -- non produce risultato perché la proprietà non esiste

UPDATE articoli
SET specifiche = JSON_REMOVE(specifiche,'$.uscite[1]')
WHERE id = 1; -- elimina il secondo elemento della proprietà uscite


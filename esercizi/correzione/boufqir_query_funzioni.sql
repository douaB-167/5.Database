use corsi;
-- 1) contate il numero di iscritti al corso di 'Java'
select * from studenti;
select count(*) `numero iscritti` 
from corsi
join iscrizioni
on corsi.id = iscrizioni.corso_id
where titolo = "Java";

-- 2) Calcolate il valore totale dei corsi acquistati
select sum(prezzo) from iscrizioni;

-- 3) Selezionate il prezzo massimo dei corsi
select max(prezzo) from corsi;

-- 4) Selezionate il prezzo medio dei corsi e arrotondatelo a 2 cifre decimali
select round(avg(prezzo), 2) from corsi;

-- 5) Calcolate età media degli studenti, restituendo un valore intero
select round(avg(timestampdiff(year,data_nascita, curdate()))) from studenti;

-- 6) Selezionate gli studenti e l'email creando un attributo in cui rappresentate il nome completo
-- es 'Marco Rossi', 'marco_rossi@gmail.com'
select concat_ws(' ', cognome, nome), email from studenti;
-- 7) sostituite nella tabella studenti gli indirizzi contenenti 'Corso' con 'Viale'
-- replace è case sensitive
select regexp_replace(indirizzo, '(?i)corso', 'Viale') `indirizzo` from studenti;
-- dovevi fare UPDATE
-- UPDATE studenti SET indirizzo = REGEXP_REPLACE(indirizzo, '(?i)corso', 'Viale');

-- 8) selezionare nome,cognome,email, data_nascita degli studenti mostrando della data di nascita solo l'anno
select nome, cognome, email, year(data_nascita) `anno`  from studenti;

-- 9) selezionare nome,cognome,email, data_nascita degli studenti mostrando la data di nascita nel formato italiano
select nome, cognome, email, date_format(data_nascita, '%d/%m/%Y') `data nascita` from studenti;
-- 10)
/*
Seleziona il cognome e il nome di tutti gli studenti.
Aggiungi una colonna chiamata Provenienza in cui deve comparire:
   il valore della colonna regione se lo studente proviene dal Piemonte
   altrimenti la scritta 'altra Regione'
Usa la funzione IF() di MySQL per effettuare questa distinzione.
Ordina il risultato in base alla colonna Provenienza.
*/
select regione from studenti;
select 
	cognome, 
    nome, 
    if(regione = 'piemonte', 'Piemonte', 'altra regione') `provenienza`
from studenti
order by `provenienza`;
-- 11) inserite nella tabella articolo, l'articolo seguente:
-- descrizione: Canon 7d
-- specifiche: marca: canon, modello: 7d, schermo: lcd, peso: 1.5 kg, sensore: CMOS, rapporto: 3:2, fullframe: no, uscite: hdmi mini, mini jack stereo
use app_java2025;
insert into articoli(descrizione, specifiche)
values (
	'Canon 7d', 
    json_object(
		"marca", "canon", 
        "pesoKG", 1.5, 
        "schermo", "lcd", 
        "pollici", 32,
        "modello", "7d",
        "sensore", "CMOS",
        "rapporto", "3:2", 
        "fullframe", "no",
        "uscite", json_array("hdmi mini", "mini jack stereo")
    )
);
-- 12) selezionate dalla tabella articolo la marca, estraendola dalla colonna json
select json_extract(specifiche, '$.marca') `marca`
 from articoli;
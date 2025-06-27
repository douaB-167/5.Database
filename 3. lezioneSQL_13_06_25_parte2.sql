select * from `studenti`;

/* proiezione */
select `cognome`, `nome`, `email`
from `studenti`;

/* selezione */
select * from `studenti`
where `genere` = 'f';

select `cognome`, `nome`, `email`
from `studenti`
where `genere` = 'f';

select * from `studenti`;

select * from `studenti`
order by `cognome`; /* dati ordinati in base al cognome, default ascendente ASC*/

select * from `studenti`
order by `cognome` DESC; /* ordine descrescente */

select * from `studenti`
order by `cognome`desc, `nome` desc, `data_nascita`;

select * from `studenti`
order by `cognome`
limit 0, 10; /* i primi 10 a partire dalla posizione 0 */

select * from `studenti`
order by `cognome`
limit 10, 10; /* i primi 10 dopo l'undicesimo */

select * from `studenti`
where `genere` <> 'f'; /* selezionami tutti gli elementi non equivalenti al valore specificato */

select * from `studenti`
where citta <> 'torino' 
order by citta;

select * from `studenti`
where `data_nascita` >= '1990-01-01' /* l'anno è compreso, con > l'anno non è compreso */
order by `data_nascita`;

select * from `studenti`
where `data_nascita` <= '1989-12-31' /* l'anno è compreso, con < l'anno non è compreso */
order by `data_nascita`;

select * from `studenti`
where `data_nascita` < '1989-12-31' and `genere` = 'f'
order by `data_nascita`;

select * from `studenti`
where `data_nascita` < '1989-12-31' or `genere` = 'f'
order by `data_nascita`;

select * from `studenti`
where `provincia` = 'mi' or `genere` = 'f'
order by `data_nascita`;

select * from `studenti`
where `provincia` = 'mi' or `provincia` = 'bg' or `provincia` = 'at'
order by `provincia`;

select * from `studenti`
where `cognome` = 'verdi' or (`cognome` = 'rossi'
and `provincia` = 'to')
order by `cognome`; /* and ha la precedenza */

select * from `studenti`
where `cognome` = 'rossi'
and `provincia` = 'to' or `cognome` = 'verdi' 
order by `cognome`; 

select * from `studenti`
where `provincia` = 'at' 
or `provincia` = 'al'
or `provincia` = 'cn'
or `provincia` = 'no'
order by `provincia`;

select * from `studenti`
where `provincia` in('at','al','cn','no') /* è un elenco */
order by `provincia`;

select * from `studenti`
where `provincia` not in('at','al','cn','no') /* esclude l'elenco specificato */
order by `provincia`;

select * from `studenti`
where `data_nascita` between '1990-01-01' and '1999-12-31'
order by `data_nascita`;

update `studenti`
set `genere` = null
where `provincia` = 'mi';

select `cognome`, `provincia`, `genere` from `studenti`
where `genere` is null;

select `cognome`, `provincia`, `genere` from `studenti`
where `genere` is not null;

update `studenti`
set `genere` = 'm'
where `provincia` = 'mi';

select * from `studenti`
where `cognome` like 'v%' /* seleziona tutti i cognomi che iniziano con la v */
order by `cognome`;

select * from `studenti`
where `cognome` like 'v_____' /* seleziona tutti i cognomi che iniziano con la v e poi ha 5 caratteri */
order by `cognome`;

select * from `studenti`
where `cognome` like '%v%' /* seleziona tutti i cognomi che contengono la v */
order by `cognome`;

select * from `studenti`
where `cognome` like '%a' /* seleziona tutti i cognomi che finiscono con a */
order by `cognome`;

select * from `studenti`
where `email` like '%@gmail.com' /* seleziona tutti i cognomi che finiscono con @gmail.com */
order by `cognome`;

select * from `studenti`
where `nome` like 'paol_';

select * from `studenti`
where `indirizzo` like 'via %';

select * from `studenti`
where `nome` regexp '^mar'; /* inizia con */

select * from `studenti`
where `nome` regexp 'co$'; /* finisce con */

select * from `studenti`
where `nome` regexp 'mar|ara|ola'; /* comprende */

select * from `studenti`
where `nome` regexp '^(mar|ara)|ola'; /* deve iniziare per mar o ara e deve contenere ola */

select * from `studenti`
where `nome` regexp '^(mar|ara)|co$'; /* deve iniziare per mar o ara e deve concludersi con co */

select * from `studenti`
where `nome` regexp '[mcp]a'; /* combina con una di quelle lettere con quella di fuori */

select * from `studenti`
where `cognome` regexp '[abcdefghilm]a'
order by `cognome`; /* combina con una di quelle lettere con quella di fuori */

select * from `studenti`
where `nome` regexp '^[a-m]'; 

## aggiunto durante la lezione del 27/06/25
select title, price, price * 1.10 
from books;

select title, price, price + price_VAT
from books;

select 30/5;
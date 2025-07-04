use app_java2025;

select state, capital_id
from america
union 
select state, capital_id 
from asia
union
select state, capital_id
from africa

order by state;

table america
union
table asia
union 
select id, state, capital_id, population
from africa

order by state;
# distinct valore di default, tuple duplicate le elimina
# all non lo fa, viene eseguito più velocemente
select cognome, nome, data_nascita, 'X' generazione #valore letterale 
from studenti
where data_nascita <= '1980-12-31'
union
select cognome, nome, data_nascita, 'Millenials' generazione #valore letterale 
from studenti
where data_nascita between '1981-01-01' and '1996-12-31'
union
select cognome, nome, data_nascita, 'Z' generazione #valore letterale 
from studenti
where data_nascita >= '1997-01-01'
order by generazione;

select * from amici
union all
select * from parenti;

truncate amici; 
truncate parenti;

select * from studenti;

insert into amici
select id, nome, cognome, email
from studenti
where id <= 15;

select * from amici;

insert into parenti
select id, nome, cognome, email
from studenti
where id >= 10;

select * from parenti;

#fa la differenza, solo righe comuni
select * from parenti
intersect 
select * from amici; 

#righe che ci sono nella seconda ma non nella prima 
select * from parenti
except 
select * from amici; 
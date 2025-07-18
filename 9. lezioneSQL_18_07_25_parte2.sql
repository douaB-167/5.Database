rename table impiegati to impiegati_old;
alter table impiegati_old drop foreign key fk_impiegato_ufficio;
desc impiegati_old;
show index from impiegati_old;
drop index fk_impiegato_ufficio on impiegati_old;

desc impiegati;
show create table impiegati;
select count(*) from impiegati;

explain analyze
select nome, cognome, genere, data_nascita
from impiegati 
where provincia = 'to';

alter table impiegati add index k_prov(provincia);
analyze table impiegati;

/* -> Index lookup on impiegati using k_prov (provincia=''to\''),
 with index condition: (impiegati.provincia = 'to')
(cost=6480 rows=54456)
(actual time=1.27..85.3 rows=27403 loops=1) */
 
explain 
select nome, cognome, genere, data_nascita
from impiegati force index(k_data_nascita)
where data_nascita between '1980-01-01' and '1989-12-31';

analyze table impiegati;

alter table impiegati add index k_data_nascita(data_nascita);
alter table impiegati add index k_year(only_year);

explain
select nome, cognome, genere, data_nascita
from impiegati force index(k_year)
where only_year between '1980' and '1989';

explain
select nome, cognome, genere, data_nascita
from impiegati force index(k_year)
where only_year ='1980';

alter table impiegati drop index k_year;

explain
select nome, cognome, genere, stipendio
from impiegati
where provincia = 'to'
and stipendio > (select avg(stipendio) from impiegati)
order by stipendio desc;

alter table impiegati add index k_prov_stip_DESC(provincia, stipendio DESC);
analyze table impiegati;
show index from impiegati;
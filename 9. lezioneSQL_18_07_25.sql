use gestionale;

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to';

alter table clienti
add index k_prov(provincia);
#create index k_prov
#on clienti(provincia);

desc clienti;
show index from clienti;

select distinct provincia from clienti;
select count(distinct provincia) from clienti;

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to'
and credito > 100;

select count(distinct provincia) from clienti;
select count(distinct credito) from clienti;

alter table clienti add key k_prov_credito(provincia, credito);

show index from clienti;

drop index k_prov_credito on clienti;
#alter table clienti drop index k_prov_credito;

alter table clienti add key k_credito_prov(credito, provincia);

explain
select cognome, nome, email, credito
from clienti use index(k_credito_prov)
where provincia = 'to'
and credito > 100;

analyze table clienti;
show index from clienti;
drop index k_credito_prov on clienti;
alter table clienti add key k_prov_credito(provincia, credito);

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to'
and credito > 100;

explain
select cognome, nome, email, credito
from clienti use index(k_prov_credito)
where provincia = 'to';

drop index k_prov on clienti;

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to'
order by cognome;

explain
select provincia, credito
from clienti use index(k_credito)
where credito > 100;

alter table clienti add index k_credito(credito);

analyze table clienti;

drop index k_credito on clienti;

analyze table clienti;

alter table clienti add index k_cogn(cognome);

drop index k_cogn on clienti;

alter table clienti add index k_prov_cogn_cred(provincia, cognome, credito);
analyze table clienti;

explain
select cognome, nome, email, credito
from clienti
where provincia = 'to'
order by cognome;
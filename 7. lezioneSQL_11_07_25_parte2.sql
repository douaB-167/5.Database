use corsi;
create user 'look'@'localhost' identified by 'look_corsi!';

GRANT SELECT ON corsi.vw_iscritti_info to 'look'@'localhost';
select * from vw_iscritti_info;

select 
	titolo,
	count(*) `quanti`
from vw_iscritti_info
group by titolo
order by `quanti` desc;

select 
	titolo,
	count(*) `quanti`
from vw_iscritti_info
where genere = 'm'
group by titolo
order by `quanti` desc;

select 
	count(*) `quanti`
from vw_iscritti_info
where titolo = 'html'
order by `quanti` desc;

select * from vw_iscritti_info
order by cognome;

select * from vw_iscrizioni_limitata;
UPDATE articoli a
SET rimanenza = 100 -
	IFNULL((
		SELECT SUM(quantita)
		FROM ordini_dettaglio od
		WHERE od.articolo_id = a.id
		), 0);
        
select a.id, 100 - (
	select sum(quantita)
    from ordini_dettaglio od
    where od.articolo_id = a.id) rimanenza_effettiva
from articoli a;

UPDATE articoli a
LEFT JOIN (
	SELECT articolo_id, SUM(quantita) AS totale
	FROM ordini_dettaglio
	GROUP BY articolo_id
) AS od_sum
ON a.id = od_sum.articolo_id
SET a.rimanenza = 100 - IFNULL(od_sum.totale, 0);

explain analyze
select articoli.id, totale
from articoli
left join(
	select articolo_id, sum(quantita) as totale
    from ordini_dettaglio
    group by articolo_id
    ) tbl
on articoli.id = tbl.articolo_id;
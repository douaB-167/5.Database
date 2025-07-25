use app_java2025;
CREATE table posts(
 id INT AUTO_INCREMENT PRIMARY KEY,
 titolo VARCHAR(100),
 testo TEXT,
 data_pubblicazione DATE
);
INSERT INTO posts
  (titolo, testo, data_pubblicazione)
VALUES
  ('Gestione di un form in React', 'Le applicazioni Web spesso devono inviare dati dal browser al server back-end. Certamente, il modo più utilizzato per farlo è attraverso un form HTML, utilizzando input di testo, pulsanti di opzione, caselle di controllo, selezioni e così via. Questo rimane vero in React. Stai cercando come gestire i moduli in React? Se è così, questo articolo è perfetto per te. Buona lettura.', '2019-01-01'),
  ('Quale framework JavaScript dovresti imparare per ottenere un lavoro nel 2019?', 'Ti stai chiedendo quale framework o libreria JavaScript dovresti usare per ottenere un lavoro nel 2019? In questo post, esaminerò un confronto tra i framework JavaScript più popolari disponibili oggi. Entro la fine di questo post, sarai pronto per scegliere il framework giusto per aiutarti a ottenere un lavoro di sviluppatore front-end nel 2019.', '2019-03-02'),
  ('Costruire un componente modale React accessibile', 'Modal è un overlay sulla pagina web, ma ha alcuni standard da seguire. Le pratiche di authoring WAI-ARIA sono gli standard stabiliti dal W3C. Ciò consente a bot e lettori di schermo di sapere che si tratta di un modale. Non rientra nel flusso regolare della pagina. Creeremo una fantastica modalità di reazione usando i componenti React.', '2019-01-15'),
  ('Redux Vs. Mobx – Cosa dovrei scegliere per la mia app Web?', 'La gestione dello stato è un problema difficile da risolvere nelle applicazioni di grandi dimensioni. Redux e Mobx sono entrambe librerie esterne comunemente utilizzate per risolvere problemi di gestione dello stato.', '2019-02-20'),
  ('Componenti stateful e stateless in reazione', 'Oggi esamineremo quali componenti con stato e senza stato sono in React, come puoi distinguere e il complesso processo per decidere se rendere i componenti con stato o meno.', '2019-03-29');
  
select * from posts;

alter table posts add fulltext index ftk_titolo_testo(titolo, testo);

-- match(titolo, testo), against('')

select titolo, testo, data_pubblicazione
from posts 
where match(titolo, testo) against('react redux');

select titolo, testo, data_pubblicazione,
match(titolo, testo) against('react redux') peso
from posts 
where match(titolo, testo) against('react redux');

SELECT titolo, testo, data_pubblicazione, MATCH(titolo, testo)
AGAINST('"gestione dello stato è un problema"')
FROM posts
WHERE MATCH(titolo, testo) AGAINST('"gestione dello stato è un problema"');

select titolo, testo, data_pubblicazione,
match(titolo, testo) against('react -redux +stato' in boolean mode) peso
from posts 
where match(titolo, testo) against('react -redux +stato' in boolean mode);
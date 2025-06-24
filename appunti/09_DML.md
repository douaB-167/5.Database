# DML
## Creazione, lettura, aggiornamento e eliminazione dei record (CRUD)
Una volta creata la struttura del nostro db ci ritroveremo, ovviamente, con una serie di tabelle vuote.  
Prima di aggiungere record a una tabella bisogna conoscere il tipo di dati previsto per ogni campo.  
Quando si inseriscono i dati bisogna usare le virgolette gli apici per i dati tipo stringa (compresa la data), senza virgolette o apici per i dati di tipo numerico.  
Non si inseriscono i valori per i campi definiti con l'auto_increment.  
  
## Consistenza dei dati
La consistenza dei dati è una proprietà fondamentale nei database che garantisce che i dati rispettino regole e vincoli predefiniti, mantenendo uno stato valido e coerente.  
In altre parole, **i dati devono sempre essere corretti e rispettare le regole definite dal database**  
    <pre>
        CREATE TABLE studenti{
            id INT PRIMARY KEY,
            nome VARCHAR(50),
            eta TINYINT UNSIGNED CHECK (eta >= 18) --> vincolo di consistenza
        };
    </pre>
La consistenza fa parte delle proprietà ACID (Atomicità, Consistenza, Isolamento, Durabilità), fondamentali per garantire la corretta esecuzione delle transazioni nei db relazionali.  
  
## INSERT INTO
INSERT INTO è l'istruzione utilizzata per inserire nuovi record in una tabella. Ha due parti  
**INSERT INTO** seleziona la tabella e i campi per i quali effettuare l'inserimento  
**VALUE/VALUES** elenca i valori dei campi da inserire  
    <pre>
        INSERT INTO tableName(field1, field3)
        VALUES (value1, value3);
    </pre>
E' possibile inserire più record con un solo INSERT separando l'elenco dei valori di ogni record con la: ,.  
Altra sintassi per singolo recondo con istruzione **SET**:  
    <pre>
        INSERT INTO tableName  
        SET field1 = 'value1', field2 = 'value2';
    </pre>
E' possibile usare il comando INSERT INTO senza l'uso di nomi di campo se si inserisce un recond rispettando l'ordine dei campi della tabella  
    <pre>
        INSERT INTO tableName
        VALUE(value1, value2, value3);
    </pre>
in questo caso devono essere inseriti i valori di tutti i campi, anche i valori AUTO_INCREMENT o TIMESTAMP (passare DEFAULT per inserimento automatico).  
Per i campi che accettano i valori nulli potete passare null.  
    <pre>
        INSERT INTO studente
        VALUES(default, 'fabio', 'rossi', 'fbr@gmail.com', null, default);
    </pre>
  
## Mostrare i record di una tabella 
E' possibile visualizzare i record di una tabella utilizzando l'istruzione **SELECT**.  
Per visualizzare tutti i record da una tabella si usa il carattere jolly *.  
Dobbiamo anche utilizzarev l'istruzione **FROM** per identificare la tabella che vogliamo interrogare:  
    <pre>SELECT * FROM tableName;</pre>
Di solito si visualizzano campi specifici, piuttosto che l'intera tabella.  
Dopo l'istruzione SELECT elencare i campi che interessano, separati da una virgola.  
    <pre>SELECT fieldName, fieldName2 FROM tableName;</pre>
  
## INSERT INTO ... SELECT 
L'istruzione INSERT INTO ... SELECT consente di inserire automaticamente dati in una tabella copiandoli da un'altra.  
    <pre>
        INSERT INTO amici(nome, cognome)  
        SELECT nome, cognome  
        FROM studenti;
    </pre>
  
## CREATE TABLE ... SELECT
Si possono creare delle tabelle già popolate di dati mediante l'uso congiunto delle istruzioni **CREATE TABLE** e **SELECT**.  
**CREATE TABLE** crea la nuova tabella  
**SELECT** carica i dati prelevandoli da un'altra tabella  
Il suo funzionamento, in pratica, è analogo a quello di **INSERT INTO ... SELECT**.  
    <pre>
        CREATE TABLE parenti (
            id INT AUTO_INCREMENT,
            nome VARCHAR(20),
            cognome VARCHAR(30),
            PRIMARY KEY(id)
        ) SELECT nome, cognome FROM amici;
    </pre>
Questo comportamento è supportato da MySQL e permette di definire la struttura a mano e popolare subito la tabella. Non è STANDARD SQL.  
  
## Duplicare tabelle e suoi contenuti
Se abbiamo necessità di copiare il contenuto di una tabella in un altra tabella, possiamo utilizzare l'istruzione **CREATE TABLE** conbinata con **LIKE** e le istruzioni **SELECT**.  
Per duplicare esattamente una tabella (con indici e chiavi) e i suoi contenuti bisogna usare due istruzioni separate  
    <pre>
        CREATE TABLE studenti_bk LIKE studenti;
        INSERT INTO studenti_bk SELECT * FROM studenti;
    </pre>
Si può usare anche un'istruzione sola: in questo caso gli indici non vengono ricreati, cioè le strutture delle tabelle sono diverse:  
    <pre>
        CREATE TABLE studenti_bk2 [AS]
        SELECT * FROM studenti;
    </pre>
  
## Update
Aggiornamento dei record in una tabella.  
Questa istruzione modifica il valore presente in una colonna di un record già esistente.  
Viene utilizzata insieme all'istruzione **SET**:  
    <pre>
        UPDATE tableName
        SET field1 = value1, field2 = value2
        WHERE field3 = value3;
    </pre>
* dopo **UPDATE** indichiamo quale tabella è interessata
* con **SET** specifichiamo quali colonne modificare e quali valori assegnare
* con **WHERE** (opzionale) stabiliamo le condizioni che determinano quali righe saranno interessate dalle modifiche (Attenzione: **se WHERE è omesso, tutti i record saranno aggiornati** per le colonne indicate).  
Per operare simultaneamente su più campi è sufficiente suddividere le coppie chiave/valore con una virgola.  
Quando si inseriscono i dati in una tabella rammentate sempre come sono state definite le colonne per evitare errori di inserimento.  
Se si inserisce un valore troppo lungo, o non compreso dalla definizione della colonna. MySQL restituisce un errore e non effettua alcuna modifica.  
    <pre>
        UPDATE studenti SET genere = 's' WHERE id = 1;
        ERROR 1265 (01000): Data truncated for column 'genere' at row 1
    </pre>
Il campo genere della tabella studenti è un campo definito come:  
    ENUM('f', 'm', 'nb'), accetta quindi solo i valori f, m o nb.  
In questo caso stiamo tentando di inserire un valore non ammesso.  
  
## Eliminazione dei record in una tabella
L'istruzione **DELETE** viene utilizzata per eliminare gruppi di record in una tabella.  
E' necessario utilizzare la parola chiave condizionale **WHERE** per scegliere quali record si desidera eliminare, altrimenti si eliminano tutti i record.  
La sintassi di base per l'istruzione è la seguente:  
    <pre>
        DELETE
        FROM tableName
        WHERE field = value;
    </pre>
  
## Eliminare tutti i record della tabella
Per svuotare una tabella si usa l'istruzione **TRUNCATE**.
    <pre>TRUNCATE [TABLE] tableName;</pre>
Questa soluzione è la più veloce perchè elimina la struttura della tabella per poi ricreare una uguale vuota azzerando il valore di eventuali campi AUTO_INCREMENT.  
Usando **DELETE** si eliminano tutti i record presenti nella tabella specificata record per record:  
    <pre>DELETE FROM tableName;</pre>
Un simile modo di operare, seppur assolutamente funzionante, è poco efficiente perchè dipende dalla quantità di righe presenti in tabella.  
Inoltre usando DELETE il valore di un eventuale AUTO_INCREMENT rimane inalterato; per azzerarlo:  
    <pre>ALTER TABLE tableName AUTO_INCREMENT = 1;</pre>
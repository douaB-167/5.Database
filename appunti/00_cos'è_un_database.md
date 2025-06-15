# Cos'è un database
**Un database è una raccolta organizzata di dati archiviati in un formato facilmente accessibile.**
* I database sono **collezioni di dati** tra loro correlati, utilizzate per rappresentare una porzione del mondo reale. Sono strutturati in modo tale da consentire la gestione efficiente dei dati, permettendo operazioni come inserimento, aggiornamento, ricerca e cancellazione delle informazioni.
* In informatica, il termine database indica una struttura organizzata di dati.  
I database sono archivi dove le applicazioni memorizzano i dati in modo persistente per poterli successivamente leggere, modificare o eliminare.  
OSS: In ambito informatico, la persistenza si riferisce alla capacità di un dato di essere conservato oltre la durata di esecuzione di un singolo programma, garantendo che i dati siano ancora disponibili in seguito.
  
## Dati e informazione
* **Informazione**: dato elaborato con significato e contesto.  
In senso generale, l'informazione è qualsiasi contenuto significativo che possiamo trasmettere, raccogliere o interpretare. Tuttavia, perchè l'informazione diventi utile, deve essere organizzata e strutturata in una forma che ne consenta una facile elaborazione.
* **Dati**: rappresentazioni grezze di fatti, numeri o eventi.  
Un dato è un'unità elementare di informazione, che può essere un numero, una parola, un'immagine, ecc..  
Ad esempio, una stringa di caratteri come "Maria", oppure un numero come "30", sono dati grezzi. Da soli, però, non raccontano molto.  
Per renderli significativi dobbiamo inserirli in un contesto strutturato, ad esempio: "Maria ha 30 anni".  
  
## DB file-server
Sono semplici files, a cui possono facilmente accedere i programmi che li usano per inserire, visualizzare, modificare o cancellare i dati in essi contenuti.
* il sistema accede fisicamente al file;
* più il file è di grandi dimensioni maggiore il tempo di accesso;
* accesso contemporaneo da più utenti rallenta notevolmente il db;
    * MS Access;
    * Filemaler;
    * ...;  
  
## DB client-server
Rappresentanl un servizio che mette a disposizione il software per interagire con i dati.  
Viene gestito e mantenuto dai DBA (Database Administrator)
* Microsoft SQL Server (RDBMS);
* Oracle (RDBMS);
* MySQL (RDBMS);
* DM2 (RDBMS);
* PostgreSql (ORDBMS object-relational database system);
* MongoDB (NoSQL Document Stores);
* Neo4j (NoSQL Graph);
* ...;  
  
## Vantaggi database client-server
1. I clienti non accedono fisicamente al file sul database, inviano solamente la loro query al motore del database ed il server restituisce solamente i dati richiesti;
1. Velocità al crescere delle dimensioni del database il tempo di una query rimane identico, perchè attraverso la LAN viaggiano e continueranno a viaggiare solamente la richiesta (query) ed i dati restituiti, la dimensione del database diventa alla fine irrelevante per il client;
1. Il motore del database è in grado di gestire tutte le connessioni simultanee da parte degli utenti, ed utilizzare al meglio le prestazioni dell'hardware;
1. Sicurezza se su un sistema file-server potrebbe succedere che in determinate situazioni il file arrivi ad essere corrotto (termine tecnico), questo non deve poter succedere, mai e per nessuna ragione, su un sistema client-server;
1. La sicurezza viene garantita anche grazie alle funzioni che i db client-server normalmente offrono. Tutte le tabelle di un sistema gestionale aziendale sono tra loro collegate, la mancanza della gestione delle relazioni può portare a grossi problemi circa l'integrità dei dati.  
  
## Strutture dati e modelli di database
Le strutture dati rappresentano il modo in cui le informazioni vengono organizzate e memorizzate per facilitarne il recupero e la gestione.  
Ogni struttura ha caratteristiche specifiche che la rendono più o meno adatta a determinati scenari applicativi.  
Nei database, le strutture dati vengono implementate attraverso diversi modelli di organizzazione, ognuno pensato per esigenze specifiche.  
  
## Modelli di database più diffusi
Relazionale (RDBMS - Relational Database Management System)
* Organizza i dati in tabelle (righe e colonne)
* Relazioni tra le tabelle tramite chiavi primarie ed esterne
In questo modello, i dati sono organizzati in tabelle (o relazioni), che possono essere pensate come fogli di calcolo.  
Ogni tabella ha delle colonne (campi) e delle righe (record), dove le righe rappresentano entità specifiche e le colonne descrivono attributi delle entità.  
Esempi: MySQL, PstgreSQL, Oracle, SQL Server, ...  
  
## Time Series Database
Le serie temporali sono una struttura in cui i dati vengono organizzati in base a un intervallo di tempo.  
Vengono utilizzate per tracciare cambiamenti e osservare tendenze nel tempo.
* ottimizzato per la memorizzazione di dati temporali
* formato Timestamp + valore
esempi: InfluxDB, TimescaleDB, OpenTSDB
esempio: sensori di temperatura che registrano la temperatura ogni ora:  
{  
    timestamp: "2025-02-21T12:00:00Z",  
    temperatura: 22.5  
}  
  
## Database colonnare
* Memorizza i dati per colonne anzichè per righe
* Vantaggioso per analisi su grandi volumi di dati
esempi: Apache Cassandra, Google Bigtable, Amazon Redshift  
esempio: Analisi di vendite con colonne separate per ogni mese:  
    Prodotto|Gennaio|Febbraio|Marzo  
  
### NoSQL ( Not Only SQL)
* Pensato per scalabilità e flessibilità
* Tipologie:
    * Document-oriented: Archivia dati in documenti JSON o BSON (es. MongoDB, CouchDB);
    * Key-Value Store: Struttura chiave-valore (es. Redis DynamoDB);
    * Wide-Column Store: Variante del database colonnare (es Apache HBase, ScyllaDB); 
    * Graph Database: Gestisce dati con nodi e connessioni (es. Neo4j).
esempio: database documentale MongoDB che memorizza profili utente:  
{  
    "nome": "Mario",  
    "cognome": "Rossi",  
    "email": "mario.rossi@example.com"  
}  
  
## Strumenti
* MySql Community Server 8.4
* Terminale / Shell: ambiente a rigaa di comando per interagire con il database tramite istruzioni SQL
* MySQLWorkBench: ambiente grafico per interagire con il database
* Visual Studio Code o altro editor  
  
## DBMS (Database Management System)
* E' il software per la creazione e la manipolazione di un database.  
E' un software di tipo server (client-server) avente il compito di gestire uno o più database; questo vuol dire che il DBMS deve intervenire, in qualità di intermediario, in ogni operazione svolta sui database dai software che ne fanno utilizzo
* Definisce gli utenti e gli amministratori di un database
* Fornisce meccanismi di sicurezza, protezione e controllo dell'integrità dei dati  
  
## RDBMS (Relational Databse Management System)
* MySQL è un software appartenente alla famiglia dei DBMS. All'interno di questo gruppo di software è possibile identifare dei sotto-insiemi più specifici tra cui, ad esempio, quello dei DBMS NoSQL (MongoDB) e quello dei RDBMS a cui appartiene tra gli altri, appunto, MySQL.
* Gli RDBMS non sono altro che dei sistemi di gestione delle banche dati che operano in aderenza alla teoria relazionale secondo la quale il sistema deve operare sui dati mediante relazioni tra le diverse tabelle in cui questi vengono suddivisi e ordinati
* Nel modello relazionale, infatti, i dati all'interno di un database sono organizzati in differenti tabelle le quali sono in relazione tra loro  
  
## Storage Engine
Gli storage engine rappresentano delle librerie che determinano il modo in cui i dati di una tabella saranno salvati su disco.  
Ciò sarà determinante per valutare le prestazioni, l'affidabilità, le funzionalità offerte dalla tabella stessa, rendendola più o meno adatta a particolari utilizzi.  
In pratica, scegliere un particolare storage engine significa **scegliere il modo in cui i dati vengono gestiti**.  
  
## MyISAM
Si tratta di un motore di memorizzazione veloce. Non supporta le trnasazioni. Non utilizza meccanismi di integrità referenziale.
* Adatto per le ricerche full-text;
* E' più veloce poichè non è necessario tenere conto delle varie relazioni tra le tabelle;
* Esegue il lock sull'intera tabella;
* Ottimo se le tabelle vengono utilizzate principalmente in fase di lettura oppure se il database è relativamente poco complesso
A partire dalla versione 5.5 MySQL, InnoDB è lo Storage Engine di default. Prima era MyISAM.

## InnoDB
Lo scopo di InnoDB è quello di associare maggiore sicurezza (intesa sopratutto come consistenza ed integrità dei dati) a performance elevate. Funzionalità peculiari:
* **Transazioni**: per transazione si intende la possibilità di un DBMS di svolgere più operazioni di modifica dei dati, facendo sì che i risultati diventano persistenti nel database solo in caso di successo di ogni singola operazione. In caso contrario, verranno annullate tutte le modifiche apportate;
* **Integrità referenziale**: conferiscono la possibilità di creare una relazione logica tra i dati di due tabelle, in modo da impedire modifiche all'una che renderebbero incosistenti i dati dell'altra;
* esegue il **lock a livello di riga**.
* **Ricerche full-text** a partire da MySQL 5.6.  
  
## Charset
I character set (insiemi di caratteri) sono i diversi sistemi attraverso i quali i caratteri alfanumerici, i segni di punteggiatura e tutti i simboli rappresentabili su un computer vengono memorizzati in un valore binario.   
In ogni set di caratteri, ad un valore binario corrisponde un carattere ben specifico.  
  
Con MySQL, a partire dalla versione 4.1, possiamo gestire i set di caratteri a livello di server, database, tabella e singola colonna, nonchè di client e di connessione.  
  
Ad ogni set di caratteri sono associate una o più collation, che rappresentano i modi possibili di confrontare le stringhe di caratteri facenti parte di quel character set.  
  
Esempio: una determinata tabella utilizza il utf8 (quello maggiormente usato in Europa Occidentale) e la utf8_general_ci.  
Tale collation è multilingue e "case insensitive" (_ci), cioè non tiene conto della differenza fra maiuscole e minuscole nell'ordinare o confrontare le stringhe.
# SQL - Structured Query Language
SQL è il linguaggio che permette di effettuare le operazioni per estrarre e manipolare i dati da un database.  
E' lo standard tra i sistemi relazionali viene usato in tutti i prodotti DBMS come set di comandi per l'utente della base di dati.  
Tipi di istruzioni SQL:
* **DCL** (Data Control Language): permette di gestire il controllo degli accessi e i permessi per gli utenti;
* **DDL** (Data Definition Language): permette di definire la struttura del database;
* **DML** (Data Manipulation Language): permette di modificare i dati contenuti nel db, con le operazioni di inserimento, variazione e cancellazione;
* **TCL** (Transaction Control Language): queste operazioni gestiscono le transazioni nel database;
* **Query Language**: permette di porre interrogazioni al db.
  
## DCL 
gestire il controllo degli accecci e i permessi per gli utenti.  
CREATE USER 'user'@'host' IDENTIFIED BY 'password';
GRANT ALL ON nomedb.* TO 'user'@'host';  
  
## DDL
permette di definire la struttura del database  
* CREATE DATABASE databaseName; --> crea un nuovo db
* DROP DATABASE databaseName; --> cancella il db
* CREATE TABLE tableName(...); --> crea una nuova tabella nel db
* ALTER TABLE tableName ...; --> modifica la struttura di una tabella
* DROP TABLE tableName ...; --> cancella una tabella dal db
* CREATE INDEX indexName ...; --> crea un indice su una certa tabella
* ALTER TABLE tableName DROP INDEX indexNane ...; --> elimina l'indice specificato
  
## DML
permette di modificare i dati contenuti nel db, con le operazioni di inserimento, variazione e cancellazione
* inserimento:  
  insert into tableName(field1, field2, ...)
  VALUES ('value1', 'value2', '...');
* cancellazione:
  DELETE FROM tableName
  WHERE column_name = some_value;
* aggiornamento:
  UPDATE tableName
  SET column_name = new_value
  WHERE column_name = some_value;
  
## TCL 
gestiscono le transazioni nel database  
* COMMIT; --> rende definitive le operazioni sul db
* ROLLBACK; --> ripristina i dati eliminando le modifiche temporanee
* SAVEPOINT save_point_name(...); --> crea un punto di salvataggio
  
## Query Language
permette di porre interrogazioni al db  
SELECT field(s) FROM table(s) WHERE condition(s);  
  
Attraverso **SELECT** vengono selezionati dei campi (attributi) da una o più tabelle e restituiti all'utente sotto forma di una "nuova tabella" (resultset)  
  
Attraverso la clausola **WHERE** è possibile filtrare il resultset sulla base di alcune regole
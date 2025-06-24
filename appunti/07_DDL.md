# DDL
## Creare un database
Una volta effettuato l'accesso a mysql possiamo eseguire l'istruzione CREATE DATABASE (CREATE SCHEMA) seguita dal nome del db da creare:  
    <pre>CREATE DATABASE databaseName;  </pre>
Se il db è già presente mysql ve lo segnala attraverso un messaggio di errore:  
    <pre>ERROR 1007 (HY000): Can't create database 'databaseName'; database exists</pre>  
Usando la sintassi seguente  
    <pre>CREATE DATABASE IF NOT EXISTS databaseName;  </pre>
mydql verifica l'esistenza del db: se non esiste lo crea, se esiste va da ok ma segnala un warning  
    <pre>Query OK, 1 row affected, 1 warning (0.01 sec)  </pre>
  
In fase di creazione di un db con MySQL è anche possibile specificare charset e collation; ad esempio:  
    <pre>
        CREATE DATABASE IF NOT EXISTS databaseName
        CHARACTER SET utf8
        COLLATE utf8_general_ci;
    </pre>
Specificando questi valori è possibile "sovrascrivere" quelli impostati di default a livello server.  
  
Per visualizzare come è stato create il database  
    <pre>SHOW CREATE DATABASE databaseName;  </pre>
  
Per elencare rispettivamente i set di caratteri disponibili e le "collezioni" disponibili  
    <pre>SHOW CHARACTER SET; SHOW COLLATION;  </pre>
  
## Cancellare un database
Per eliminare un db basta scrivere l'istruzione DROP DATABASE (DROP SCHEMA) seguita dal nome del db da rimuovere.  
    <pre>
        DROP DATABASE databaseName;
        DROM DATABASE IF EXISTS databaseName;
    </pre>
Se si usa l'istruzione opzionale IF EXISTS si evita di ricevere l'errore qualora il database sia già stato eliminato.  
  
## Creare le tabelle
Per creare una tabella usiamo il comando CREATE TABLE tableName().  
Quando creiamo una tabella dobbbiamo definire anche tutti i campi ad essa associati, argomenti della parentesi.  
* Per ogni campo verrà definito il dominio che indica al sistema quale tipo di dati verrà memorizzato nel campo.
* Per ogni campo definiamo anche gli eventuali attributi  
    <pre>
        CREATE TABLE IF NOT EXISTS tableName(
            id INT AUTO_INCREMENT PRIMARY KEY,
            fieldName1 VARCHAR(60) NOT NULL,
            fieldName2 DATE,
            fieldName3 TINYINT,
        )
    </pre>
Verificare se e come è stata creata la tabella:
* Per verificare se la nostra tabella è stata creata si usa l'istruzione che mostra le tabelle presenti:  
    <pre>SHOW TABLES;</pre>
* Per verificare che la struttura della tabella sia corretta:  
    <pre>SHOW CREATE TABLE tableName;</pre>
* Per visualizzare come è stata creata una tabella:
    <pre>DESCRIBE tableName; DESC tableName;</pre>
Rinominare una tabella: 
    <pre>
        ALTER TABLE tableName RENAME newtableName;
        RENAME TABLE tableName TO newtableName;
    </pre>
  
## Modificare le tabelle
L'istruzione ALTER TABLE viene utilizzata per aggiungere, eliminare o modificare le colonne di una tabella esistente.  
Per **aggiungere un campo** a una tabella, utilizzare la seguente sintassi:  
    <pre>
        ALTER TABLE tableName
        ADD fieldName [DATATYPE];
    </pre>
Per **modificare nome e datatype** di un campo di una tabella  
    <pre>
        ALTER TABLE tableName
        CHANGE fieldName newfieldName [DATATYPE];
    </pre>
Per **modificare solo datatype** di un campo di una tabella  
    <pre>
        ALTER TABLE tableName
        MODIFY fieldName [DATATYPE];
    </pre>
Per **modificare solo nome** di un campo di una tabella  
    <pre>
        ALTER TABLE tableName
        RENAME COLUMN oldName TO newName;
    </pre>
Per **cancellare un campo** di una tabella  
    <pre>
        ALTER TABLE tableName
        DROP fieldName;
    </pre>
Potete combinare le istruzioni separandole con una virgola  
    <pre>
        ALTER TABLE tableName
        CHANGE fieldName newfieldName [DATATYPE],
        ADD fieldName3 [DATATYPE] AFTER fieldName2,
        DROP fieldName4;
    </pre>
Per **aggiungere una campo** in una data posizione  
    <pre>
        ALTER TABLE tableName
        ADD fieldName2 [DATATYPE]
        AFTER fieldName;
    </pre>
Usando FIRST al posto di AFTER si aggiunge il campo in prima posizione, FIRST non vuole il nome del campo.  
Per **spostare un campo** in una tabella  
    <pre>
        ALTER TABLE tableName
        MODIFY fieldName2 [DATATYPE]
        AFTER fieldName;
    </pre>
Per **spostare un campo in prima posizione**  
    <pre>
        ALTER TABLE tableName
        MODIFY fieldName2 [DATATYPE]
        FIRST;
    </pre>
se il campo è una chiave primaria non dovete indicarlo nel datatype altrimenti ricevete un errore di mysql.  
Aggiungere alla tabella la **primary key** (se non già impostata):
    <pre>
        ALTER TABLE tableName
        ADD PRIMARY KEY (field1[, field2, ...]);
    </pre>
Aggiungere alla tabella la **primary key** aggiungendo un campo nuovo apposito:  
    <pre>
        ALTER TABLE tableName
        ADD id INT AUTO_INCREMENT PRIMARY KEY;
    </pre>
**Eliminare la primary key**  
    <pre>
        ALTER TABLE tableName
        DROP PRIMARY KEY
    </pre>
Attenzione, per eliminare la primary key di un campo id con auto_increment, bisogna prima eliminare l'attributo auto_increment  
    <pre>
        ALTER TABLE tableName
        MODIFY id INT;
    </pre>
  
## Duplicare tabelle
Se abbiamo necessità di duplicare una tabella possiamo utilizzare l'istruzione CREATE TABLE combinata con l'istruzione LIKE.  
Per duplicare una tabella possiamo scrivere:  
    <pre>CREATE TABLE tableNameCopy LIKE tableName;</pre>
Questa istruzione duplica solo la struttura della tabella.
  
## Cancellare una tabella dal database MySQL
Vediamo l'operaizone inversa alla creazione di tabelle, la loro eliminazione.  
Per eliminare una tabella utilizzeremo il comando DROP TABLE  
    <pre>DROP TABLE tableName;</pre>
L'eliminazione di una tabella, come per il database, è un'operazione irreversibile  
E' possibile eliminare più di una tabella contemporaneamente  
    <pre>DROP TABLE tableName, tableName2, tableName3;</pre>
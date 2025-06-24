# Attributi
## Per i campi numerici
Si tratta di un istruzione ulteriore che viene passata al DBMS in fase di creazione (o modifica) di una tabella.  
* **AUTO_INCREMENT**: aumenta automaticamente il valore di una colonna aggiungendo 1 al valore massimo già registrato nella tabella. E' opportuno utilizzarlo in combinazione con NOT NULL. Può essere applicato a tutti i tipi numerici interi;
* **UNSIGNED**: un campo contrassegnato con UNSIGNED non accetta valori negativi;
* **ZEROFILL**: viene utilizzato per memorizzare i numeri con degli zeri davanti nel caso in cui la lunghezza sia inferiore a quella massima prevista.  
Se per esempio di dichiara un campo INT ZEROFILL e si desidera memorizzare il valore "1234", esso verrà visualizzato come "00000001234" con M(11) - sempre UNSIGNED
  
## AUTO_INCREMENT (sequence)
In MySQL, una sequenza è un elenco di interi generati nell'ordine crescente, vale a dire 1,2,3,...  
Impostare l'attributo AUTO_INCREMENT in una colonna, tipicamente una colonna chiave primaria, crea automaticamente una sequenza in MySQL.  
Le seguenti regole vengono applicate quando si utilizza l'attributo AUTO_INCREMENT:
* Ciascuna tabella ha **ha solo una colonna** AUTO_INCREMENT il cui tipo di dati è **intero**;
* La colonna AUTO_INCREMENT **deve essere indicizzata**, il che significa che può essere:
    * PRIMARY KEY o UNIQUE
* La colonna AUTO_INCREMENT deve avere un vincolo NOT NULL.  
  Quando si imposta l'attributi AUTO_INCREMENT in una colonna, MySQL aggiunge automaticamente il vincolo NOT NULL alla colonna implicitamente.
  
## Per i campi di tipo stringa
L'unico vincolo/opzione che può essere utilizzato per i campi destinati ad ospitare dati stringa è BINARY il quale può essere utilizzato con CHAR o VARCHAR qualora questi campi siano destinati ad ospitare dati binari (pur non rendendosi necessario utilizzare un campo della famiglia BLOB)  
CHAR(n) BINARY e VARCHAR(n) BINARY differiscono dal tipo di dato BINARY e VAR BINARY per la codifica e la collation utilizzata  
  
## Attributi universali (sia per campi numerici sia per quelli testuali)
Possono essere utilizzati tanto con campi numerici quanto con campi di tipo stringa
* **DEFAULT**: può essere utilizzato con tutti i tipi di dati ad eccezzione di TEXT e BLOB.  
  Serve per indicare un valore di default per il campo qualora venga lasciato vuoto;
* NULL / NOT NULL: può essere utilizzato con tutti i tipi di campi e serve per definire se un dato campo può avere un valore NULL oppure no.
  
## Vincoli
* **CHECK**(exoression): consente di imporre un vincolo al dato da inserire
* **FOREIGN KEY**: consente di imporre un vincolo riferito alla chiave esterna
  
## Attributi/Indici
* **UNIQUE**: con UNIQUE si imposta una regola di unicità, questo signiica che nessun dato contenuto nella colonna può essere ripetuto: ogni dato deve, quindi, essere unico e se si cerca di inserire un dato duplicato si riceve un errore. Può essere nullo.
* **PRIMARY KEY**: può essere utilizzato con tutti i tipi di dati (numerici e stringa) ed è una sorta di variante di UNIQUE che consente di creare un indice primario sulla tabella (campo chiave).
* **INDEX**[KEY] (colonne): è utilizzato per creare un'indice nella tabella ai fini di migliorare le performances di accesso ai dati.
  
## INDEX
* Servono ad ottimizzare le performance del database.
* Un indice è una struttura dati ausiliaria che consente di recuperare più contenuto (full table scan), tramite una selezione più mirata.
* devono essere usati consapevolmente per non ottenere l'effetto contrario ovvero rallentare il db.
# DCL
gestisce il controllo degli accessi e i permessi per gli utenti:  
Istruzione CREATE USER: crea l'utente e assegna una password  
    CREATE USER 'user'@'host' IDENTIFIED BY 'password';  
password: passwod associata all'utente che stiamo creando.  
La password va scritta "in chiaro".  
## GRANT
assegna i permessi e/o privilegi  
    GRANT --istruzioni_consentite  
    ON databaseName.*  
    TO 'user'@'host';  
**istruzioni_consentite**: CREATE, SELECT, UPDATE, DELETE, ALTER, DROP, ...  
    Per dare all'utente permessi completi utilizzare la parola chiave ALL.  
**database.***: nome del database sul quale l'utente potrà eseguire le istruzioni consentite  
    Per tutte le tabelle del db.*. Si può specificare il nome di una o più tabelle. Per tutti i db: *.*  
**user**: specifica il nomer dell'utente che vogliamo creare o al quale vogliamo assegnare nuovi permessi.  
**host**: specifica il/gli host da cui è ammessa la connessione. Se voglio indicare più IP devo usare la wild card %: 130.192.200.%  
## REVOKE
    REVOKE --istruzioni_revocate  
    ON databaseName.*  
    FROM 'user'@'host';  
per la quale valgono le stesse regole sopra viste per GRANT.  
  
Per eliminare tutti i privilegi:  
    REVOKE ALL PRIVILEGES, GRANT OPTION --istruzioni_revocate  
    FROM 'user'@'host';  
Quest'ultima sintassi elimina ogni permesso dell'utente su qualunque db del sistema.  
## Cambiare/aggiornare la password MySQL degli utenti 
Per cambiare una normale password utente devi digitare:  
* Cambio password per l'utente (da root):  
    ALTER USER 'userName'@'host' IDENTIFIED BY 'newpass';
* Cambiare la propria password:  
    ALTER USER USER() IDENTIFIED BY 'newpass';  
  
### Verificare i permessi utente
Verificare i privilegi di uno specifico utente:  
    SHOW GRANTS FOR 'user'@'localhost';  
Verificare i privilegi dell'utente attualmente loggato a MySQL:  
    SHOW GRANTS FOR CURRENT_USER;  
  
### Eliminare un utente da MySQL
    DROP USER 'user'@'localhost';  
questo comando rimuove l'utente e i suoi permessi.  
Visualizzare elenco utenti mysql (solo utente root)  
    SELECT user, host FROM mysql.user;  
  
## Accesso al DBMS
Da terminale accedere a MySQL utilizzando le credenziali dell'utente creato:  
    mysql -u userName -p  
Vi verrà chiesto di inserire la password (quella assegnata all'utente)  
  
A questo punto dovete prendere possesso del db per poterci lavorare:  
L'istruzione **USE** più nome del database assegnato (senza ; a chiusura del comando)  
    use databaseName  
Da terminale potete accedere anche direttamente al db per i quali avete i privilegi.  
Dovete passare a mysql tutti i parametri (tranne la password) più il nome del database:  
    mysql -u userName -p databaseName  
Non dovete più usare USE, siete nel db e potete lavorarci.
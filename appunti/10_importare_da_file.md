# Importare dati da file
Sintassi per importare dati presenti in altri file, come file di testo o csv.
    <pre>
        LOAD DATA
            [LOW_PRIORITY | CONCURRENT] [LOCAL]
            INFILE 'file_name'
            INTO TABLE tbl_name
            [{FIELDS | COLUMNS}
                [TERMINATED BY 'string']
                [[OPTIONALLY] ENCLOSED BY 'char']
                [ESCAPED BY 'char']
            ]
            [LINES
                [STARTING BY 'string']
                [TERMINATED BY 'string']
            ]
            [IGNORE number {LINES | ROWS}]
    </pre>
Potreste non avere i privilegi necessari per usare questo comando.  
Devono essere rispettate alcune condzioni:
* la tabella in cui importate i dati deve già esistere
* gli attributi devono essere dello stesso tipo
verificare il valore della variabile che consente l'operazione:  
    <pre>SHOW GLOBAL VARIABLES LIKE 'local_infile';</pre>
se 'OFF' impostare il valore ad ON  
    <pre>SET GLOBAL local_infile = 'ON';</pre>
Per il client MySQLWorkbench occorre configurare la connessione al server e aggiungere la riga seguente:  
    <pre>OPT_LOCAL_INFILE = 1</pre>
al box "Others" del tab "advanced"
Da terminale bisogna aggiungere i parametri --local-infile -u [user] -p
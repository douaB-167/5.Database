/* 1:
Inserisci i seguenti 5 prodotti nella tabella "Products":
ATTENZIONE eventuali errori nel testo sono voluti, dovrete più avanti eseguire degli update! 
1) PRD00001, Pasta integrale, Pasta di grano duro 100% ingrale, 500Kg, 1.49, 100,
2) PRD00002, Olio extravergine, Olio extravergine d\oliva 750ml, 6.90, 50,
3) PRD00003, Biscotti al cacao, Biscotti secchi con gocce di cioccolato, 2.75, 80,
4) PRD00004, Passata di pomodoro, Passata di pomodoro biologica, 700g, 1.29, 120,
5) PRD00005, Riso basmati, Riso basmati confezione da 1kg, 3.10, 60;
*/
-- istrizione SQL di seguito
select * from `products`;
desc `products`;

alter table `products`
modify `desciption` text(100) default null;

insert into `products`
values
('PRD00001', 'Pasta integrale', 'Pasta di grano duro 100% ingrale, 500Kg', 1.49, 100),
('PRD00002', 'Olio extravergine', 'Olio extravergine d\oliva 750ml', 6.90, 50),
('PRD00003', 'Biscotti al cacao', 'Biscotti secchi con gocce di cioccolato', 2.75, 80),
('PRD00004', 'Passata di pomodoro', 'Passata di pomodoro biologica, 700g', 1.29, 120),
('PRD00005', 'Riso basmati', 'Riso basmati confezione da 1kg', 3.10, 60);

/* 2:
Inserisci i seguenti 10 ordini nella tabella "Orders"
1) 2025-06-01, 25.38, shipped, Via Roma 12, Milano, 101),
2) 2025-06-02, 47.20, delivered, Corso Italia 45, Torino, 102),
3) 2025-06-03, 15.90, to ship, Via Verdi 8, Firenze, 103),
4) 2025-06-03, 83.70, shipped, Piazza Garibaldi 20, Napoli, 104),
5) 2025-06-04, 9.99, elivered, Via Mazzini 5, Bologna, 101),
6) 2025-06-05, 29.50, to ship, Via Cavour 3, Venezia, 102),
7) 2025-06-06, 12.75, shipped, Via Amendola 14, Bari, 103),
8) 2025-06-07, 65.00, delivered, Corso Garibaldi 101, Genova, 104),
9) 2025-06-07, 19.80, to ship, Via Marconi 22, Palermo, 101),
10) 2025-06-08, 34.60, shipped, Via Leopardi 9, Verona, 102);
*/
-- istrizione SQL di seguito
select * from `orders`;

alter table `orders`
modify `shipping` enum('delivered', 'shipped', 'to ship') default null;

alter table `orders`
modify `customer_id` int default null;

alter table `orders`
drop index `customer_id`; /* per rimuovere l'attributo index */

desc `orders`;

insert into `orders`
values 
(default, '2025-06-01', 25.38, 'shipped', 'Via Roma 12, Milano', 101),
(default, '2025-06-02', 47.20, 'delivered', 'Corso Italia 45, Torino', 102),
(default, '2025-06-03', 15.90, 'to ship', 'Via Verdi 8, Firenze', 103),
(default, '2025-06-03', 83.70, 'shipped', 'Piazza Garibaldi 20, Napoli', 104),
(default, '2025-06-04', 9.99, 'delivered', 'Via Mazzini 5, Bologna', 101),
(default, '2025-06-05', 29.50, 'to ship', 'Via Cavour 3, Venezia', 102),
(default, '2025-06-06', 12.75, 'shipped', 'Via Amendola 14, Bari', 103),
(default, '2025-06-07', 65.00, 'delivered', 'Corso Garibaldi 101, Genova', 104),
(default, '2025-06-07', 19.80, 'to ship', 'Via Marconi 22, Palermo', 101),
(default, '2025-06-08', 34.60, 'shipped', 'Via Leopardi 9, Verona', 102);

/* 3:
Inserisci i seguenti 8 clienti nella tabella "Customers"
1) Luca, Bianchi, 3201234567, luca.bianchi@email.it, Via Dante 10, Milano, MI, Lombardia, 20121, 2025-05-01),
2) Giulia, Rossi, 3479876543, giulia.rossi@email.it, Corso Venezia 22, Torino, TO, Piemonte, 10121, 2025-05-03),
3) Marco, Verdi, 3391122334, marco.verdi@email.it, Via Mazzini 18, Bologna, BO, Emilia-Romagna, 40121, 2025-05-05),
4) Elena, Neri, 3284455667, elena.neri@email.it, Piazza Duomo 1, Firenze, FI, Toscana, 50122, 2025-05-07),
5) Paolo, Ricci, 3339988776, paolo.ricci@email.it, Via Garibaldi 55, Napoli, NA, Campania, 80134, 2025-05-10),
6) Sara, Moretti, 3315566778, sara.moretti@email.it, Via Cavour 16, Venezia, VE, Veneto, 30121, 2025-05-12),
7) Davide, Ferrari, 3491122334, davide.ferrari@email.it, Via Manzoni 8, Genova, GE, Liguria, 16121, 2025-05-15),
8) Chiara, Gallo, 3278899001, chiara.gallo@email.it, Via Roma 77, Palermo, PA, Sicilia, 90133, 2025-05-18);
*/
-- istrizione SQL di seguito
select * from `customers`;
desc `customers`;

insert into `customers`
values 
(default, 'Luca', 'Bianchi', '3201234567', 'luca.bianchi@email.it', 'Via Dante 10', 'Milano', 'MI', 'Lombardia', '20121', '2025-05-01'),
(default, 'Giulia', 'Rossi', '3479876543', 'giulia.rossi@email.it', 'Corso Venezia 22', 'Torino', 'TO', 'Piemonte', '10121', '2025-05-03'),
(default, 'Marco', 'Verdi', '3391122334', 'marco.verdi@email.it', 'Via Mazzini 18', 'Bologna', 'BO', 'Emilia-Romagna', '40121', '2025-05-05'),
(default, 'Elena', 'Neri', '3284455667', 'elena.neri@email.it', 'Piazza Duomo 1', 'Firenze', 'FI', 'Toscana', '50122', '2025-05-07'),
(default, 'Paolo', 'Ricci', '3339988776', 'paolo.ricci@email.it', 'Via Garibaldi 55', 'Napoli', 'NA', 'Campania', '80134', '2025-05-10'),
(default, 'Sara', 'Moretti', '3315566778', 'sara.moretti@email.it', 'Via Cavour 16', 'Venezia', 'VE', 'Veneto', '30121', '2025-05-12'),
(default, 'Davide', 'Ferrari', '3491122334', 'davide.ferrari@email.it', 'Via Manzoni 8', 'Genova', 'GE', 'Liguria', '16121', '2025-05-15'),
(default, 'Chiara', 'Gallo', '3278899001', 'chiara.gallo@email.it', 'Via Roma 77', 'Palermo', 'PA', 'Sicilia', '90133', '2025-05-18');

/* 4:
Inserisci i seguenti record

Tabella: "America":
1) Brasile', 1, 216000000, 
1) Messico', 2, 129000000, 
1) Canada', 3, 39000000;   

Tabella: "Africa":
1) Nigeria', 4, 223000000, 
1) Egitto', 5, 111000000,  
1) Sudafrica', 6, 61000000;

Tabella: "Asia":
1) Cina', 7, 1410000000,   
1) India', 8, 1400000000,  
1) Giappone', 9, 125000000;

*/
-- istrizione SQL di seguito
select * from `america`;
desc `america`;

alter table `america`
modify `capital_id` tinyint unsigned not null unique;

insert into `america`
values 
(default, 'Brasile', 1, 216000000),
(default, 'Messico', 2, 129000000),
(default, 'Canada', 3, 39000000);

alter table `africa`
modify `capital_id` tinyint unsigned not null unique;

insert into `africa`
values
(default, 'Nigeria', 4, 223000000), 
(default, 'Egitto', 5, 111000000),  
(default, 'Sudafrica', 6, 61000000);

alter table `asia`
modify `capital_id` tinyint unsigned not null unique;

insert into `asia`
values
(default, 'Cina', 7, 1410000000),   
(default, 'India', 8, 1400000000),  
(default, 'Giappone', 9, 125000000);

/* 5:
Inserisci i seguenti 7 libri nella tabella "Books"
1) 9788801234567, La coscienza di Zeno, 15.00, 18.30, 250, 1),
2) 9788804567890, Il nome della rosa, 20.00, 24.40, 512, 2),
3) 9788867890123, I promessi sposi, 18.50, 22.57, 600, 1),
4) 9788876543210, Se questo è un uomo, 14.00, 17.08, 180, 3),
5) 9788898765432, Il Gattopardo, 22.00, 26.84, 350, 2),
6) 9788812345678, La storia, 19.00, 23.18, 430, 3),
7) 9788823456789, Cristo si è fermato a Eboli, 16.50, 20.13, 300, 1);
*/
-- istrizione SQL di seguito
alter table `books`
modify `pages` smallint unsigned default null;

desc `books`; 

select * from `books`;

insert into `books`
values
('9788801234567', 'La coscienza di Zeno', 15.00, 18.30, 250, 1),
('9788804567890', 'Il nome della rosa', 20.00, 24.40, 512, 2),
('9788867890123', 'I promessi sposi', 18.50, 22.57, 600, 1),
('9788876543210', 'Se questo è un uomo', 14.00, 17.08, 180, 3),
('9788898765432', 'Il Gattopardo', 22.00, 26.84, 350, 2),
('9788812345678', 'La storia', 19.00, 23.18, 430, 3),
('9788823456789', 'Cristo si è fermato a Eboli', 16.50, 20.13, 300, 1);

/* 6:
Aggiorna la tabella "Products"
con la descrizione corretta per il prodotto con code = PRD00001
descrizione corretta: 
Pasta di grano duro 100% integrale, 500g
*/
-- istrizione SQL di seguito
select * from `products`;

update `products`
set `desciption` = 'Pasta di grano duro 100% integrale, 500g'
where `code` = ' PRD00001';

/* 7:
Aggiorna la tabella "Books" e imposta i seguenti valori
editor_id: 2
dove l'editor_id' è = 3
*/
-- istrizione SQL di seguito
select * from `books`;

update `books`
set `editor_id` = 2
where `editor_id` = 3;
/* 8:
Aggiorna la tabella "Customers" e imposta i seguenti valori
city: Milano
province: MI
regione: Lombardia
postal_code: 20121
dove la regione è "Campania"
*/
-- istrizione SQL di seguito
select * from `customers`;

update `customers`
set `city` = 'Milano', `province` = 'MI', `region` = 'Lombardia', `postal_code` = '20121'
where `region` = 'Campania';

/* 9:
Cancella dalla tabella "Books" il record il cui codeice ISBN = 9788812345678
*/
-- istrizione SQL di seguito
select * from `books`;

delete from `books`
where `ISBN` = '9788812345678';

/* 10:
Cancella dalla tabella customers i record la cui provincia è = 'MI'
*/
-- istrizione SQL di seguito
select * from `customers`;

delete from `customers`
where `province` = 'MI';
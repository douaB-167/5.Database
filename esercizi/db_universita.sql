create database universita;
use universita;

drop table Studenti;
create table Studenti(
    Id INT primary key auto_increment,
    nome varchar(100) not null,
    cognome varchar(100) not null,
    enrollmentid varchar(10) not null unique, -- matricola
    email varchar(100)
    );

INSERT INTO Studenti (nome, cognome, enrollmentid, email) VALUES
('Mario', 'Rossi', 'MTR001', 'mario.rossi@example.com'),
('Laura', 'Bianchi', 'LRB002', 'laura.bianchi@example.com'),
('Giuseppe', 'Verdi', 'GSV003', 'giuseppe.verdi@example.com'),
('Anna', 'Neri', 'ANN004', 'anna.neri@example.com'),
('Paolo', 'Gialli', 'PLG005', 'paolo.gialli@example.com'),
('Elena', 'Marroni', 'ELM006', 'elena.marroni@example.com'),
('Luca', 'Rosa', 'LCR007', 'luca.rosa@example.com'),
('Sara', 'Blu', 'SRB008', 'sara.blu@example.com'),
('Marco', 'Bruno', 'MRB009', 'marco.bruno@example.com'),
('Chiara', 'Grigio', 'CHG010', 'chiara.grigio@example.com');

select * from Studenti;
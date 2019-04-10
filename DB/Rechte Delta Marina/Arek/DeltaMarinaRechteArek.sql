Mike
Keine
Rechte

create user Mike IDENTIFIED BY 'haslo1';
create user Keine IDENTIFIED BY 'haslo2';
create user Rechte IDENTIFIED BY 'haslo3';

GRANT Select ON Rechnung, Kunde TO Mike;
GRANT Select ON Rechnung, Kunde TO Keine;
GRANT Select ON Rechnung, Kunde TO Rechte;

GRANT ALL PRIVILEGES ON Bestellung TO Mike;
GRANT ALL PRIVILEGES ON Auftrag TO Mike;
GRANT UPDATE, INSERT, DELETE ON Serviceangebot TO Keine;
GRANT UPDATE, DELETE, INSERT ON Lieferant, Ersatzteil, Bestellung, Auftrag TO Rechte;
GRANT UPDATE, DELETE, INSERT ON Lieferant TO Rechte;
GRANT UPDATE, DELETE, INSERT ON Ersatzteil TO Rechte;
GRANT UPDATE, DELETE, INSERT ON Bestellung TO Rechte;
GRANT UPDATE, DELETE, INSERT ON Auftrag TO Rechte;
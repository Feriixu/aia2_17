mysql.exe - u root;

Create User Buchhandlung IDENTIFIED BY ichfetzdich;
Create User Service IDENTIFIED BY Servicegibtesnicht;
Create User Vertrieb IDENTIFIED BY Vertrieb123;

GRANT SELECT on Rechnung, Kunde to Buchhandlung;
GRANT SELECT on Rechnung, Kunde to Service;
GRANT SELECT on Rechnung, Kunde to Vertrieb;

GRANT All PRIVILEGES  ON Auftrag to Buchhandlung;
GRANT All PRIVILEGES ON Bestellung to Buchhandlung;
GRANT UPDATE, INSERT, DELETE on Serviceangebot to Service;
GRANT UPDATE, INSERT, INSERT on Lieferant, Ersatzteil, Bestellung, Auftrag to Vertrieb;
GRANT UPDATE, INSERT INSERT on Lieferant to Vertrieb;
GRANT UPDATE, INSERT INSERT on Ersatzteiltyp to Vertrieb;
GRANT UPDATE, INSERT INSERT on Bestellung to Vertrieb;
GRANT UPDATE, INSERT INSERT on Auftrag to Vertrieb;
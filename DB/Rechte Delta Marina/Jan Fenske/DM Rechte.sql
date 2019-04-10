Create User Buchhandlung IDENTIFIED BY Bücherwurm123;
Create User Service IDENTIFIED BY SuperServiceMan;
CREATE User Vertrieb IDENTIFIED BY VertriebBOI123;

GRANT All PRIVILEGES On Rechnung To Buchhandlung;
GRANT ALL PRIVILEGES On Lieferant TO Vertieb;
Grant ALL PRIVILEGES On Kunde To Service;
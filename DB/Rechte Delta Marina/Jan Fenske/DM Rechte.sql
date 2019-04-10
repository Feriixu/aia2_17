Create User Buchhandlung IDENTIFIED BY Bücherwurm123;
Create User Service IDENTIFIED BY SuperServiceMan;
CREATE User Vertrieb IDENTIFIED BY VertriebBOI123;


GRANT SELECT On Kunde To Buchhandlung;
GRANT SELECT On Kunde To Vertieb;
Grant SELECT On Kunde To Service;

Grant ALL PRIVILEGES On Auftrag To Buchhandlung;
Grant Select On Bestellung To Buchhandlung;
Grant Select On Rechnung To Buchhandlung;

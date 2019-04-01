Insert Into Kunde
(Name, Vorname,Gebdat, Tel, Strasse, Hausnummer, PLZ, Email, AuftragsID)
VALUES
("Maier", "Herbert", 1970.12.31,0223564949,"Lindenstrasse",168, 58697, "Herbert_Maier@t-online.de",1000005);

INSERT INTO Ersatzteil
(ErsatzteilName,LieferantenID)
VALUES
("Motor", 10005);

INSERT INTO Yachttyp
(Segelyacht, Motoryacht,YachttypID)
VALUES
(false,true,1005);

INSERT INTO Lieferant
(Name, Vorname, TelNr)
VALUES
(Lilienthal, Otto, 0511675955);

INSERT INTO Yacht
(Yname, Baujahr,AuftragsID, KundenID)
VALUES
(Bismarck,1936,1000005,1000005);

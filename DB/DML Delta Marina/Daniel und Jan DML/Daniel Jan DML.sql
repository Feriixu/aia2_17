INSERT INTO Kunde
(Name, Vorname,Gebdat, Tel, Strasse, Hausnummer, PLZ, Email, AuftragsID)
Values 
("Mueller","Hans",1940.8.12, 0211783350,"Danielstrasse", 14,40629,"Mueller@t-online.de",1000000),
("Muendtrath", "Mike",2001.12.24, 0211478980,"Benderstrasse",21,40625,"Muendtrath@t-online.de",1000001),
("Direkci","Emre",2000.6.21,021147589,"Erdoganplatz",33,50278,"Erdogan4Life@t-online.de",1000002),
("Karl", "Ludwig",1954.8.19, 021167045, "Ludwigsplatz", 81, 90235,"Ludwigsmail@t-online.de",1000003),
("Guenther","Heinz",1963.3.29, 0211309567, "Guentherstrasse", 20, 10567,"Heinz@t-online.de",1000004);

INSERT INTO Ersatzteil
(ErsatzteilName,LieferantenID)
VALUES
("Schiffsschraube",10000),
("Segel"10001),
("Motor",10002),
("Steuerrad",10003),
("Mast",10004);

INSERT INTO Yachttyp
(Segelyacht, Motoryacht,YachttypID)
VALUES
(false, true,1000),
(true, false,1001),
(false, true,1002),
(true, false, 1003),
(true, false,1004);

INSERT INTO Lieferant
(Name, Vorname, TelNr)
VALUES
(Mueller, Jens, 021178590),
(Heinz, Karl, 0411097656),
(Lilienthal, Otto, 0511675955),
(Tinz, Gisela, 03114756478),
(Kramer,Anne, 0211474445);

INSERT INTO Yacht
(Yname, Baujahr,AuftragsID, KundenID)
VALUES
("Yamato", 1960,1000000,1000000),
("Titanik", 1940,1000001,1000001),
("KOL", 1990,1000002,1000002),
("Arctica", 2010,1000003,1000003),
("Atlantica", 2000,1000004,1000004);









INSERT INTO Kunde
(Vorname ,Nachname ,KontoNr , Adresse ,  Email , TelefonNr , HandyNr)
	VALUES("Mike", "Mueller", 245321, "Hilden",  "mike@web.de", 021145263, 017642356353),
		  ("Lazar", "Peters", 762836, "Düsseldorf", "lazar@web.de", 02116838, 017634343434323),
		  ("Dilan", "Baum", 778933, "Solingen", "dilan@web.de", 02116848, 017653443423),
		  ("Alek", "Dumm", 3434343, "Offenbach", "alek@web.de", 02112323, 01763432323),
		  ("Arek", "Kraki", 4566456, "Berlin", "arek@web.de", 021134343, 017635334768845);
		  
INSERT INTO Auftrag
(KundenNr, AuftragsDatum, Reparatur, Winterlager)
	VALUES(1 , "2000-02-14 ",true, false),
		  (2 , "2000-02-14", false, true),
		  (3 , "2000-02-14",true, false),
		  (4 , "2000-02-14" ,false, true),
		  (5 , "2000-02-14",true , false);	  

INSERT INTO Serviceangebot
(KundenNr, AuftragsNr, Service)
    VALUES(1, 6, "Winterlager"),
		  (2, 7,"Winterlager"),
		  (3, 8,"Färben"),
		  (4, 9,"Inspektion"),
		  (5, 10,"Wartung");
		  
INSERT INTO Jacht
(KundenNr, Farbe, Breite, Groesse, Laenge, Gewicht)
	VALUES(1, "Grün", 2.6 , 3.3 , 4.4 , 1003),
		  (2, "Gelb", 3.3 ,4.5 , 4.6 ,2000 ),
		  (3, "Schwarz", 3.3 , 4.4 ,5.5 ,6.6 , 3000),
		  (4, "Pink", 3.3,4.2,8.5, 5.7,3002),
		  (5,"Blau",3.3,4.9,7.8,4.3,4000);
		  
INSERT INTO Lieferant
(LieferantName, Adresse, Email, TelefonNr, AuftragsNr)
	VALUES("Schlecker", "Düsseldorf", "schlecker@gmx.de", 0175527832, 6),
		  ("SchleckerD", "Düsseldorfss", "schleckers@gmx.de", 0175526467, 7),
		  ("SchleckerH", "Hilden", "schlecker@yahoo.de", 0175527832,8),
		  ("SchleckerB", "Berlin", "schlecker@gmail.de", 0175527832,9),
		  ("SchleckerM", "München", "schleckerM@gmx.de", 0175527832,10);

INSERT INTO Ersatzteil
(KundenNr,  AuftragsNr, JachtNr, ErsatzteilID)
	VALUES(1, 6, 1, 27),
		  (2 ,7 ,2, 13),
		  (3,  8 ,3, 122),
		  (4,  9 ,4, 133),
		  (5,10,5, 98);
		  
INSERT INTO Rechnung
(KundenNr, AuftragsNr, Preis )
	VALUES(1,6, 300),
		  (2,7,400),
		  (3,8,3000),
		  (4,9,4000),
		  (5,10,6000);
		  
		  
INSERT INTO Bestellung
(KundenNr,  AuftragsNr, JachtNr, ErsatzteilID, LieferantName)
	VALUES(1, 6, 1, 27, "Schlecker"),
		  (2 ,7 ,2, 13, "Edeka"),
		  (3,  8 ,3, 122,"Rewe"),
		  (4,  9 ,4, 133,"Schueren" ),
		  (5,10,5, 98,"Kamps");
		  
INSERT INTO Auftragstyp 
(Auftragsname, AuftragstypID)
Values ("YachtPro",6001),
       ("UBootLow",6002);
	   ("Skeetult",6003);
	   ("Blup", 6004);
	   ("SkiSky", 6005)
INSERT INTO Kunden
(KundenID, Name, adresse, telefonNr, email)
Values (1001, "Jans Fags", "feggenstraße 2", 02118364568, "FagsJ@web.de"),
       (1002, "Mikes Blacks", "Bleckenstreet 420", 0211724672, "BlacksM@gmx.de");
       (1003, "Jonah Klots", "DieStraßen-Allee", 02111527823, "Ihackurlife@gmail.com");
	   (1004, "Daniel Manakristall", "Allesistunsersstraße 7", 02115682484, "Kaisa@soviet.sv");
	   (1005, "Murat Medizin", "EiweißohneSchweinfleischPlatz 5", 02111364573, "Breitsein@medizin.med");
INSERT INTO Yachttyp
(YachttypID)
Values (5001),
       (5002);
       (5003);
       (5004);
       (5005);
INSERT INTO Lieferant
(LieferantID, Firmenname)
       (33585, "Motor4U"),
       (65866, "KarstenStahl");
       (67493, "NicksvonNichts");
       (24374, "WirHabenAlles");
       (97164, "DasEineFirma");
INSERT INTO Yacht
(KundenID,YachttypID, YachtID, Farbe)
       (1001, 5001, 7001, "Pink"),
       (1002, 5002, 7002, "Schwarz");
       (1003, 5003, 7003, "Blau");
       (1004, 5004, 7004, "Rot");
       (1005, 5005, 7005, "Gelb");
INSERT INTO Auftrag
(AuftragstypID, YachtID, AuftragsID)
       (6001, 7001, 3001),
       (6002, 7002, 3002);
       (6003, 7003, 3003);
       (6004, 7004, 3004);
       (6005, 7005, 3005);
INSERT INTO Ersatzteiltyp	
(YachttypID, ErsatzteiltypID, Ersatzteilname)
       (5001, 9001, "Motor"),
	   (5002, 9002, "Steuerrad");
       (5003, 9003, "Motor");
       (5004, 9004, "Stühle");
       (5005, 9005, "Fenster");
INSERT INTO Bestellung
(Inhalt, LieferantID, ErsatzteiltypID)
       ("Motor", 33585, 9003),
	   ("Fenster", 24374, 9005);
	   ("Steuerrad", 65866, 9002);
	   ("Stühle", 97164, 9004);
	   ("Motor", 67493, 9003);
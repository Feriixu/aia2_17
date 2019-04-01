CREATE DATABASE IF NOT EXISTS deltamarina;
use deltamarina;
CREATE TABLE IF NOT EXISTS Kunde
(
   Vorname	 VARCHAR(25) NOT NULL,
   Nachname  VARCHAR(25) NOT NULL,
   KontoNr 	 INTEGER NOT NULL,
   Adresse 	 VARCHAR(30) NOT NULL,
   Email 	 VARCHAR(30) NOT NULL,
   TelefonNr INTEGER,
   HandyNr   INTEGER NOT NULL,
   KundenNr  INTEGER AUTO_INCREMENT,
   
   CONSTRAINT Unique_konto_handy
	UNIQUE (KontoNr, HandyNr),

   CONSTRAINT pk_Kunde
	PRIMARY KEY (KundenNr)
);
CREATE TABLE IF NOT EXISTS Auftrag
(
   AuftragsDatum DATE,
   KundenNr INTEGER NOT NULL,
   Reparatur BOOLEAN NOT NULL,
   Winterlager BOOLEAN,
   AuftragsNr INTEGER NOT NULL AUTO_INCREMENT,

   CONSTRAINT pk_Auftrag
	PRIMARY KEY (AuftragsNr),
   
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr)
);
CREATE TABLE IF NOT EXISTS Serviceangebot
(
   ServiceNr INTEGER NOT NULL AUTO_INCREMENT,
   Service VARCHAR(200) NOT NULL,
   KundenNr INTEGER NOT NULL,
   AuftragsNr INTEGER NOT NULL,
   
   CONSTRAINT pk_Serviceangebot
	PRIMARY KEY (ServiceNr),
	
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr),
   FOREIGN KEY (AuftragsNr) REFERENCES Auftrag(AuftragsNr)
);
CREATE TABLE IF NOT EXISTS Jacht
(
   JachtNr INTEGER NOT NULL AUTO_INCREMENT ,
   KundenNr INTEGER NOT NULL,
   Farbe VARCHAR(25),
   Breite DOUBLE,
   CHECK (Breite > 2)
   Groesse DOUBLE,
   Laenge DOUBLE,
   Gewicht DOUBLE,
   CHECK (Gewicht > 1000)
   
   CONSTRAINT pk_Jacht
	PRIMARY KEY (JachtNr),
   
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr)
);

CREATE TABLE IF NOT EXISTS Lieferant
(
   LieferantName VARCHAR(40) NOT NULL,
   LieferantID INTEGER ,
   Adresse VARCHAR(25) NOT NULL,
   Email VARCHAR(30) NOT NULL,
   TelefonNr INTEGER NOT NULL,
   AuftragsNr INTEGER NOT NULL,
   
   CONSTRAINT pk_Lieferant
	PRIMARY KEY (LieferantID),
   
   FOREIGN KEY (AuftragsNr) REFERENCES Auftrag(AuftragsNr)
);
CREATE TABLE IF NOT EXISTS Ersatzteil
(
   KundenNr INTEGER NOT NULL,
   AuftragsNr INTEGER NOT NULL,
   JachtNr INTEGER NOT NULL,
   ErsatzteilID INTEGER NOT NULL,
   ErsatzteilName varchar(40),
   
   CONSTRAINT pk_Ersatzteil
	PRIMARY KEY (ErsatzteilID),
   
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr),
   FOREIGN KEY (AuftragsNr) REFERENCES Auftrag(AuftragsNr),
   FOREIGN KEY (JachtNr) REFERENCES Jacht(JachtNr)
);
CREATE TABLE IF NOT EXISTS Rechnung
(
   RechnungsNr INTEGER AUTO_INCREMENT,
   Preis DOUBLE NOT NULL,
   KundenNr INTEGER NOT NULL,
   AuftragsNr INTEGER NOT NULL,
   
   CONSTRAINT pk_Rechnung
	PRIMARY KEY (RechnungsNr),
	
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr),
   FOREIGN KEY (AuftragsNr) REFERENCES Auftrag(AuftragsNr)
);
CREATE TABLE IF NOT EXISTS Bestellung
(
   BestellungNr INTEGER AUTO_INCREMENT=1000,
   ErsatzteilID INTEGER,
   KundenNr INTEGER NOT NULL,
   AuftragsNr INTEGER NOT NULL,
   JachtNr INTEGER NOT NULL,
   LieferantName VARCHAR(40),
   
   CONSTRAINT pk_Bestellung
    PRIMARY KEY (BestellungNr),
	
   FOREIGN KEY (ErsatzteilID) REFERENCES Ersatzteil(ErsatzteilID),
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr),
   FOREIGN KEY (AuftragsNr) REFERENCES Auftrag(AuftragsNr),
   FOREIGN KEY (JachtNr) REFERENCES Jacht(JachtNr)
);
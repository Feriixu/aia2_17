create database if not exists DeltaMarina;
use DeltaMarina;

create table if not exists Kunde
(
	Vorname varchar(30) not null,
	Nachname varchar(30) not null,
	KundenID integer AUTO_INCREMENT,
	Adresse varchar(30) not null,
	E-mail varchar(30) not null,
	TelefonNr integer not null,
	KontoNr integer not null,
	alterk INTEGER not null,
	
	CONSTRAINTS Unique_konto_telefon
	 UNIQUE (KontoNr,TelefonNr)
	
	CONSTRAINTS pk_Kunde
	primary key (KundenID)
);
create table if not exists Serviceangebot
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
create table if not exists Lieferant
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
create table if not exists Yacht
(
	YachtNr INTEGER NOT NULL AUTO_INCREMENT ,
   KundenNr INTEGER NOT NULL,
   Farbe VARCHAR(25),
   Breite DOUBLE,
   CHECK (Breite > 2)
   Groesse DOUBLE,
   Laenge DOUBLE,
   Gewicht DOUBLE,
   CHECK (Gewicht > 1000)
   
   CONSTRAINT pk_Yacht
	PRIMARY KEY (YachtNr),
   
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr)
);
create table if not exists Auftrag
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
create table if not exists Ersatzteiltyp
(
   KundenNr INTEGER NOT NULL,
   AuftragsNr INTEGER NOT NULL,
   YachtNr INTEGER NOT NULL,
   ErsatzteilID INTEGER NOT NULL,
   ErsatzteilName varchar(40),
   
   CONSTRAINT pk_Ersatzteil
	PRIMARY KEY (ErsatzteilID),
   
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr),
   FOREIGN KEY (AuftragsNr) REFERENCES Auftrag(AuftragsNr),
   FOREIGN KEY (YachtNr) REFERENCES Yacht(YachtNr)
);
create table if not exists Rechnung
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
create table if not exists Bestellung
(
   BestellungNr INTEGER AUTO_INCREMENT=1000,
   ErsatzteilID INTEGER,
   KundenNr INTEGER NOT NULL,
   AuftragsNr INTEGER NOT NULL,
   YachtNr INTEGER NOT NULL,
   LieferantName VARCHAR(40),
   
   CONSTRAINT pk_Bestellung
    PRIMARY KEY (BestellungNr),
	
   FOREIGN KEY (ErsatzteilID) REFERENCES Ersatzteil(ErsatzteilID),
   FOREIGN KEY (KundenNr) REFERENCES Kunde(KundenNr),
   FOREIGN KEY (AuftragsNr) REFERENCES Auftrag(AuftragsNr),
   FOREIGN KEY (YachtNr) REFERENCES Yacht(YachtNr)
);

CREATE DATABASE If NOT EXISTS deltaMarina;
use deltaMarina;

CREATE TABLE IF NOT EXISTS Kunde
(
	kundenID int AUTO_INCREMENT,
	name VARCHAR(255),
	adresse VARCHAR(255),
	telefonNr int,
	email VARCHAR(255),
	PRIMARY KEY (kundenID)
);

CREATE TABLE IF NOT EXISTS YachtTyp
(
	yachtTypID int AUTO_INCREMENT,
	typBezeichnung VARCHAR(255),
	PRIMARY KEY (yachtTypID)
);

CREATE TABLE IF NOT EXISTS Yacht
(
	yachtID int AUTO_INCREMENT,
	kundenID int,
	yachtTypID int,
	PRIMARY KEY (yachtID),
	FOREIGN KEY (kundenID) REFERENCES Kunde(kundenID),
	FOREIGN KEY (yachtTypID) REFERENCES YachtTyp(yachtTypID)
);

CREATE TABLE IF NOT EXISTS AuftragsTyp
(
	auftragsTypID int AUTO_INCREMENT,
	auftragsTypBezeichnung VARCHAR(255),
	PRIMARY KEY (auftragsTypID)
);

CREATE TABLE IF NOT EXISTS Auftrag
(
	auftragID int AUTO_INCREMENT,
	auftragsTypID int,
	auftragInfo VARCHAR(255),
	PRIMARY KEY (auftragID),
	FOREIGN KEY (auftragsTypID) REFERENCES AuftragsTyp(auftragsTypID)
);

CREATE TABLE IF NOT EXISTS Lieferant
(
	lieferantID int AUTO_INCREMENT,
	name VARCHAR(255),
	adresse VARCHAR(255),
	email VARCHAR(255),
	telefonNr VARCHAR(255),
	PRIMARY KEY (lieferantID)
);

CREATE TABLE IF NOT EXISTS Ersatzteil
(
	ersatzteilID int AUTO_INCREMENT,
	yachtTypID int,
	bezeichnung VARCHAR(255),
	PRIMARY KEY (ersatzteilID),
	FOREIGN KEY (yachtTypID) REFERENCES YachtTyp(yachtTypID)
);

CREATE TABLE IF NOT EXISTS Lieferbereitschaft
(
	lieferbereitschaftID int AUTO_INCREMENT,
	lieferantID int,
	ersatzteilID int,
	PRIMARY KEY (lieferbereitschaftID),
	FOREIGN KEY (lieferantID) REFERENCES Lieferant(lieferantID),
	FOREIGN KEY (ersatzteilID) REFERENCES Ersatzteil(ersatzteilID)
);
CREATE DATABASE IF NOT EXISTS sportverein;
use sportverein;

CREATE TABLE IF NOT EXISTS Konto
(
	KontoID INTEGER AUTO_INCREMENT,
	PRIMARY KEY (KontoID)
);

CREATE TABLE IF NOT EXISTS Altersgruppe
(
	AltersgruppeID INTEGER AUTO_INCREMENT,
	PRIMARY KEY (AltersgruppeID)
);

CREATE TABLE IF NOT EXISTS AbteilungsLeiter
(
	AbteilungsLeiterID INTEGER AUTO_INCREMENT,
	Name VARCHAR(255),
	PRIMARY KEY (AbteilungsLeiterID)
);

CREATE TABLE IF NOT EXISTS Mitglied
(
	MitgliedID INTEGER AUTO_INCREMENT,
	Altersgruppe INTEGER,
	KontoID INTEGER,
	Name VARCHAR(255),
	Beitrittsdatum DATE,
	PRIMARY KEY (MitgliedID),
	FOREIGN KEY (Altersgruppe) REFERENCES Altersgruppe(AltersgruppeID),
	FOREIGN KEY (KontoID) REFERENCES Konto(KontoID)
);

CREATE TABLE IF NOT EXISTS Abteilung
(
	AbteilungsID INTEGER AUTO_INCREMENT,
	AbteilungsLeiter INTEGER,
	PRIMARY KEY (AbteilungsID),
	FOREIGN KEY (AbteilungsLeiter) REFERENCES AbteilungsLeiter(AbteilungsLeiterID)
);

CREATE TABLE IF NOT EXISTS Abteilungsliste
(
	AbteilungsID INTEGER,
	MitgliedID INTEGER,
	CONSTRAINT FK_AbteilungsID FOREIGN KEY (AbteilungsID) REFERENCES Abteilung(AbteilungsID),
	CONSTRAINT FK_MitgliedID FOREIGN KEY (MitgliedID) REFERENCES Mitglied(MitgliedID)
);







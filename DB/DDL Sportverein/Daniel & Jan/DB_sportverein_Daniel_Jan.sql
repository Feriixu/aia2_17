CREATE DATABASE IF NOT EXISTS db_sportverein;

CREATE TABLE IF NOT EXISTS Konto
(
	KontoID INTEGER AUTO_INCREMENT,
	PRIMARY KEY (KontoID)
);

CREATE TABLE IF NOT EXISTS Altersstufe
(
	AltersstufenID INTEGER AUTO_INCREMENT,
	PRIMARY KEY (AltersstufenID)
);

CREATE TABLE IF NOT EXISTS AbteilungsLeiter
(
	AbteilungsleiterID	INTEGER AUTO_INCREMENT,
	Name VARCHAR(255),
	PRIMARY KEY (AbteilungsleiterID)
);

CREATE TABLE IF NOT EXISTS Mitglied
(
	MitgliedID INTEGER AUTO_INCREMENT,
	Altersgruppe VARCHAR(255),
	KontoID INTEGER,
	Name VARCHAR(255),
	Beitrittsdatum DATE
	PRIMARY KEY (MitgliedID),
	FOREIGN KEY (AltersstufenID) REFERENCES Altersstufe AlterstufeID,
	FOREIGN KEY (KontoID) REFERENCES Konto KontoID
);

CREATE TABLE IF NOT EXISTS Abteilung
(
	AbteilungsID INTEGER AUTO_INCREMENT,
	AbteilungsLeiter INTEGER,
	PRIMARY KEY (AbteilungsID),
	FOREIGN KEY (AbteilungsleiterID) REFERENCES Abteilungsleiter AbteilungsleiterID
);

CREATE TABLE IF NOT EXISTS Abteilungsbelegung
(
	AbteilungsID INTEGER,
	MitgliedID INTEGER,
	PRIMARY KEY (MitgliedID),
	PRIMARY KEY (AbteilungsID),
	FOREIGN KEY (MitgliedID) REFERENCES Mitglied MitgliedID,
	FOREIGN KEY (AbteilungsID) REFERENCES Abteilung AbteilungsID
);




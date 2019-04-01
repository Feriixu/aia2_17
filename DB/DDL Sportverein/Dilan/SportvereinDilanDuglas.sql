CREATE DATABASE sportverein;
use sportverein;

CREATE TABLE Konto
(
   KontoNR INTEGER AUTO_INCREMENT,
   PRIMARY KEY(KontoNR),
);
CREATE TABLE Altersstufenbereich
(
    AltersgruppenID INTEGER AUTO_INCREMENT,	
	PRIMARY KEY(AltersgruppenID),	
);
CREATE TABLE Abteilungsleiter
(
   AbteilungsleiterNR INTEGER AUTO_INCREMENT,
   Name VARCHAR(255),
   PRIMARY KEY(AbteilungsleiterNR),
);
CREATE TABLE Mitglied
(
    Alt INTEGER,
	Name VARCHAR(255),
	MitgliedsNR INTEGER AUTO_INCREMENT,
	KontoNR INTEGER,
	Beitrittsdatum DATE;
	PRIMARY KEY (MitgliedsNR),
	FOREIGN KEY (KontoNR) REFERENCES Konto(KontoNR),
	FOREIGN KEY (Alt) REFERENCES Altersstufenbereich(AltersgruppenID),
);
CREATE TABLE Abteilung
(
   SportartName VARCHAR(255),
   Ort VARCHAR(255),
   AbteilungsleiterNR INTEGER,
   AbteilungsNR VARCHAR(255) AUTO_INCREMENT,
   Termine DATE,
   PRIMARY KEY(AbteilungsNR),
   FOREIGN KEY (AbteilungsleiterNR) REFERENCES Abteilungsleiter(AbteilungsleiterNR),
);
CREATE TABLE Abteilungsbelegung
(
   MitgliedsNR INTEGER AUTO_INCREMENT,
   AbteilungsNR INTEGER AUTO_INCREMENT,
   PRIMARY KEY(MitgliedsNR),
   PRIMARY KEY(AbteilungsNR),
   FOREIGN KEY(MitgliedsNR) REFERENCES Mitglied(MitgliedsNR),
   FOREIGN KEY(AbteilungsNR) REFERENCES Abteilung(AbteilungsNR),
);

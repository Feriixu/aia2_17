CREATE DATABASE IF NOT EXISTS sportverein;
use sportverein;

CREATE TABLE IF NOT EXISTS Mitglieder
(
   Name VARCHAR(250),
   Nachname VARCHAR(250),
   Adresse VARCHAR(250),
   Plz INTEGER,
   EMail VARCHAR(250),
   HandyNr INTEGER,
   MitgliedNr INTEGER AUTO_INCREMENT,
   AusweisNr INTEGER,
   AltersNr INTEGER,
   PRIMARY KEY (MitgliedNr)
);
CREATE TABLE IF NOT EXISTS Abteilung
(
   AbteilungsNr INTEGER AUTO_INCREMENT,
   AbteilungsRaum INTEGER,
   AbteilungsBezeichner VARCHAR(250),
   MitgliedNr INTEGER,
   PRIMARY KEY (AbteilungsNr),
   FOREIGN KEY (MitgliedNr) REFERENCES Mirglieder(MitgliedNr)
);
CREATE TABLE IF NOT EXISTS Ausweis
(
   Name VARCHAR(250),
   Nachname VARCHAR(250),
   Geburtstag VARCHAR(250),
   Geburtsort VARCHAR(250),
   Staatsangehörigkeit VARCHAR(250),
   Augenfarbe VARCHAR(250),
   Grösse DOUBLE,
   Adresse VARCHAR(250),
   Plz INTEGER,
   MitgliedNr INTEGER,
   AusweisNr INTEGER AUTO_INCREMENT,
   PRIMARY KEY (AusweisNr),
   FOREIGN KEY (MitgliedNr) REFERENCES Mirglieder(MitgliedNr)
);
CREATE TABLE IF NOT EXISTS Sportverein
(
   SportvereinNr INTEGER AUTO_INCREMENT,
   Sportverein VARCHAR(250),
   Mitglieder INTEGER,
   Preis DOUBLE,
   Datum VARCHAR(250),
   PRIMARY KEY (SportvereinNr)
);
CREATE TABLE IF NOT EXISTS Altersgruppe
(
   Name VARCHAR(250),
   Nachname VARCHAR(250),
   AltersNr INTEGER AUTO_INCREMENT,
   DeinAlter INTEGER,
   MitgliedNr INTEGER,
   PRIMARY KEY (AltersNr),
   FOREIGN KEY (MitgliedNr) REFERENCES Mirglieder(MitgliedNr)
);



mysql -u root

create database db_sportverein;

use db_sportverein;

create table mitglied
(
MitgliedNr int,
Altersgruppe varchar(255),
KontoNr int,
Name varchar(255),
Eintragsdatum date,
primary key (MitgliedNr),
foreign key (KontoNr) references Konto (KontoNr),
foreign key (StufeNr) references altersstufe (StufeNr)
);

create table konto
(
KontoNr int,
primary key (KontoNr)
);

create table altersstufe
(
StufeNr int,
primary key (StufedNr)
);

create table abteilungsleiter
(
LeiterNr int,
Name varchar(255),
primary key (LeiterNr)
);

create table abteilung
(
AbteilungsNr int,
Name varchar(255),
Sportart varchar(255),
primary key (AbteilungsNr),
foreign key (LeiterNr) references abteilungsleiter (LeiterNr)
);

create table abteilungsbelegung
(
MitgliedsNr int,
AbteilungsNr int,
primary key (MitgliedsNr),
primary key (AbteilungsNr),
foreign key  (MitgliedsNr) references Mitglied (MitgliedsNr),
foreign key (AbteilungsNr) references Abteilung (AbteilungsNr)
);
drop database KFZ;
create database KFZ;
use KFZ
create table Kunde
(
KundeID int,
Name varchar(255),
Stasse varchar(255),
Hausnummer int,
gebDat date,
primary key(KundeID)
);

create table Auto
(
AutoID int,
AutoTyp varchar(500),
Kennzeichen varchar(255),
KundeID int,
primary key(AutoID),
foreign key(KundeID) references Kunde(KundeID)
);

create table Kilometerstand
(
Stand double,
Datum date,
KilometerstandID int,
AutoID int,
primary key(KilometerstandID),
foreign key(AutoID) references Auto(AutoID)
);

create table Fachgebiet
(
FachgebietID int,
Fachgebietname varchar(255),
primary key(FachgebietID)
);

create table Mechaniker
(
MechanikerID int,
FachgebietID int,
primary key(MechanikerID),
foreign key(FachgebietID) references Fachgebiet(FachgebietID)
);

create table Abrechnung
(
AbrechnungID int,
Rechnungsdatum date,
Betrag double,
primary key(AbrechnungID)
);

create table Reperatur
(
Datum date,
Diagnose varchar(255),
AutoID int,
MechanikerID int,
Reperaturbeginn date,
Reperaturende date,
AbrechnungID int,
ReperaturID int,
primary key(ReperaturID),
foreign key(MechanikerID) references Mechaniker(MechanikerID),
foreign key(AbrechnungID) references Abrechnung(AbrechnungID),
foreign key(AutoID) references Auto(AutoID)
);

-- Sachen einfügen auf Tobis Nacken

insert into Kunde (KundeID, Name, Stasse, Hausnummer, gebDat) values
(1, "Topidini", "Bruchstrasse", 27, 2002-04-08),
(2, "Simonobo", "Odenthaler Weg", 15, 2001-06-22),
(3, "Makki Mak", "Weißenburgstrasse", 15, 2001-02-02),
(4, "Emnae", "Kronprinzenstrasse", 66, 2001-05-14);

insert into Auto (AutoID, AutoTyp, Kennzeichen, KundeID) values
(1, "Dancer", "D-TO-2019", 2),
(2, "Mustang", "Bo-No-80", 3),
(3, "Kaefer", "M-EW-1996", 1),
(4, "LKW_Mit_Getoenten_Scheiblen_Und_Spikes_Vorne", "Error 404", 4);

insert into Kilometerstand (Stand, Datum, KilometerstandID, AutoID) values
(10000, 2008-8-8, 1, 1),
(10000, 2019-5-16, 2, 2),
(10000, 2025-8-8, 3, 3),
(10000, 1966-6-6, 4, 4);

insert into Fachgebiet (FachgebietID, Fachgebietname) values
(1, "Bonoboschäden"),
(2, "Zu wenig DEO"),
(3, "Durchfall"),
(4, "CDU Wähler");

insert into Mechaniker (MechanikerID, FachgebietID) values
(1, 1),
(2, 2),
(3, 3),
(4, 4);

insert into Abrechnung (AbrechnungID, Rechnungsdatum, Betrag) values
(1, 2001-1-10, 500),
(2, 2011-2-11, 3425),
(3, 2024-12-3, 342),
(4, 2019-5-6, 665);

insert into Reperatur (Datum, Diagnose, AutoID, MechanikerID, Reperaturbeginn, Reperaturende, AbrechnungID, ReperaturID) values
(1999-1-3, "Kaputt", 1, 1, 1999-1-2, 1999-1-3, 1, 1),
(1895-9-6, "Reifenwechsel", 2, 2, 1895-5-6, 1895-9-6, 2, 2),
(2007-12-4, "Wartung", 3, 3, 2007-11-4, 2007-12-4, 3, 3),
(2006-4-5, "Radioaustausch", 4, 4, 2006-4-4, 2006-4-5, 4, 4);

--Nummer 1:
insert into Kunde (KundeID, Name, Stasse, Hausnummer, gebDat) values 
(5, "Herr Meier", "unbekannt", null, 1980-10-01);

--Nummer 2:
select count(KundeID)
from Kunde
where gebDat >= 1960-01-01;
create database if not exists KFZWerkstatt;
create table if not exists Mechaniker
(
	MiNr int, 
	PRIMARY key( MiNr)
	FachgebietID int,
	FOREIGN key ( FachgebietID )
	REFERENCES Fachgebiet(FachgebietID)
);

create table if not exists Auto
(
	AutoID int,
	Typ varchar(255),
	Kennzeichen varchar(255),
	Kilometer int,
	AbgelesenAm date,
	PRIMARY key (AutoID)
);

create table if not exists Kunde 
(
	Name varchar(255),
	Adresse varchar(255),
	KundenID int,
	AutoID int, 
	PRIMARY KEY (KundenID),
	FOREIGN KEY (AutoID)
	REFERENCES Auto(AutoID)
);

create table if not exists Reparatur
(
	Diagnose varchar(255),
	KundenID int,
	FOREIGN KEY ( KundenID )
	REFERENCES Kunde(KundenID)
	MiNr int,
	FOREIGN KEY ( MiNR )
	REFERENCES Mechaniker(MiNr),
	AuftragsID int,
	PRIMARY KEY (AuftragsID)
	RechnungID int,
	FOREIGN KEY ( RechnungID )
	REFERENCES Rechnung(RechnungID)
);

create table if not exists Fachgebiet
(
	FachgebietID int,
	PRIMARY key (FachgebietID),
	Fachgebiet varchar(255)
);

create table if not exists Rechnung
(
	RechnungID int,
	PRIMARY key ( RechnungID )
	Kosten int,
	RechnungsDatum date,
	
);
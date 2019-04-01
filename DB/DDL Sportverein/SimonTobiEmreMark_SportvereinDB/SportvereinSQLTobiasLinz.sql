mysql -u root

create database sport;
use sport;
create table Beitrag
(
	Hoehe double,
	BeitragsNR integer,
	primary key (BeitragsNR)
);
create table Konto
(
	KontoNR integer,
	primary key (KontoNR)
);
create table Abteilungsleiter
(
	ATLNR integer,
	Name varchar(255),
	JahreAlt integer,
	primary key (ATLNR)
);
create table Altersstufenbereich
(
	BereichsNR integer,
	primary key (BeitragsNR)
);
create table Mitglied 
(
	JahreAlt integer,
	Name varchar(255),
	MitgliedsNR integer,
	KontoNR integer,
	BeitragsNR integer,
	BereichsNR integer,
	primary key (MitgliedsNR),
	foreign key (KontoNR) references Konto (KontoNR),
	foreign key (BeitragsNR) references Beitrag (BeitragsNR),
	foreign key (BereichsNR) references Altersstufenbereich (BereichsNR)
);
create table Abteilung
(
	SportartName varchar(255),
	Ort varchar(255),
	AbteilungsNR integer,
	ATLNR integer,
	Termine date,
	primary key (AbteilungsNR),
	foreign key (ATLNR) references Abteilungsleiter (ATLNR)
);
create table Abteilungsbelegung
(
	MitgliedsNR integer,
	AbteilungsNR integer,
	primary key (MitgliedsNR),
	primary key (AbteilungsNR),
	foreign key (MitgliedsNR) references Mitglied (MitgliedsNR),
	foreign key (AbteilungsNR) references Abteilung (AbteilungsNR)
);

mysql -u root
create database if not exists DeltaMarina;
use DeltaMarina;
create table Auftragstyp
(
	Name varchar(255),
	check (Name>=A and <=z),
	AuftragstypID integer not null,
	primary key(AuftragstypID)
);
create table Kunde
(
	Name varchar(255),
	check (Name>=A and <=z),
	KundenID integer not null,
	primary key (KundenID)
);
create table Yachttyp
(
	YachttypID integer not null,
	primary key (YachttypID)
);
create table Lieferant
(
	LieferantID integer not null,
	Firmaenname varchar(255),
	check (Firmenname>=A and <=z),
	primary key (LieferantID)
);
create table Yacht
(
	KundenID integer not null,
	YachtID integer not null,
	YachttypID integer not null,
	Farbe varchar(255),
	check (Farbe>=A and <=z),
	primary key (YachtID),
	foreign key (YachttypID) references Yachttyp (YachttypID),
	foreign key (KundenID) references Kunde (KundenID)
);
create table Auftrag
(
	AuftragsID integer not null,
	YachtID integer not null,
	AuftragstypID integer not null,
	Name varchar(255),
	check (Name>=A and <=z),
	primary key (AuftragsID),
	foreign key (YachtID) references Yacht (YachtID),
	foreign key (AuftragstypID) references Auftragstyp (AuftragstypID)
);
create table Ersatzteiltyp
(
	ErsatzteiltypID integer not null,
	YachttypID integer not null,
	Gewicht double,
	check (Gewicht>=A and <=z),
	Ersatzteilname varchar(255),
	check (Ersatzteilname>=A and <=z),
	primary key (ErsatzteiltypID),
	foreign key (YachttypID) references Yachttyp (YachttypID)
);
create table Bestellung
(
	Inhalt varchar(255),
	check (Inhalt>=A and <=z),
	LieferantID integer not null,
	ErsatzteiltypID integer not null,
	primary key (LieferantID, ErsatzteiltypID),
	foreign key (LieferantID) references Lieferant (LieferantID),
	foreign key (ErsatzteiltypID) references Ersatzteiltyp (ErsatzteiltypID)
);
insert into Yachttyp
(YachttypID)
values (1), (2), (3), (4), (5);
insert into Auftragstyp
(AuftragstypID)
values (1), (2), (3), (4), (5);
insert into Kunde
(Name, KundenID)
values
("Herbert Meier", 1),
("John Cena", 2),
("Julian Hoffmann", 3),
("Angelo Merte", 4),
("Alloberto Kruppa", 5);
insert into Lieferant
(Firmenname, LieferantID)
values("Zehennaegelschlucker", 1),
("Careli", 2),
("Jochen Michael Jim Kaevin Renée Joachim Loïc Siebenstecker", 3),
("EA SchlechteDLCs GmbH", 4),
("Üzcubäck Müllümüür", 5);
insert into Yacht
(YachtID, Farbe, YachttypID, KundenID)
values (1, "Blau", 1, 1),
(2, "Lila", 2, 2),
(3, "OmegaDreiFettsaeure", 3, 3),
(4, "Unsichtbar", 4, 4),
(5, "Despacito", 5, 5);
insert into Auftrag
(AuftragsID, Name, YachtID, AuftragstypID)
values (1, "Motor oelen", 1, 1),
(2, "Neu lackieren", 2, 2),
(3, "Verschrotten", 3, 3),
(4, "Klonen", 4, 4),
(5, "Gruen anmalen", 5, 5);

// check (VARIABLE><=XY)

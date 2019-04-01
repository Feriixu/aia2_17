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
values("Herbert Meier", 1),
("John Cena", 2),
("Julian Hoffmann", 3),
("Angelo Merte", 4),
("Alloberto Kruppa", 5);
insert into Lieferant
(Name, LieferantID)
values("Zehennägelschlucker", 1),
("Careli", 2),
("Jochen Michael Jim Kaevin Renée Joachim Loïc Siebenstecher", 3),
("EA schlechteDLCs GmbH", 4),
("Üzcubäck Müllümüür", 5);
insert into Yacht
(Farbe, KundenID, YachttypID, YachtID)
values("Blau", 1, 1, 1),
("Lila", 2, 2, 2),
("OmegaDreiFettsaeuren", 3, 3, 3),
("Unsichtbar", 4, 4, 4),
("Despacito", 5, 5, 5);
insert into Auftrag
(Name, AuftragsID, AuftragstypID, YachtID)
values("Motor oelen", 1, 1, 1),
("Neu lackieren", 2, 2, 2),
("Verschrotten", 3, 3, 3),
("Klonen", 4, 4, 4),
("Gruen anmalen", 5, 5, 5);
insert into Ersatzteiltyp
(ErsatzteiltypID, YachttypID, Gewicht, Ersatzteilname)
values(1, 1, 55.42, "Bleizahnrad"),
(2, 1, 898, "Segelmast"),
(3, 1, 2, "Steuerrad"),
(4, 3, 50, "Turbine"),
(5, 4, 0.4, "ReisenderXY");
insert into Bestellung
(LieferantID, ErsatzteiltypID)
values(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
// check (VARIABLE><=XY)

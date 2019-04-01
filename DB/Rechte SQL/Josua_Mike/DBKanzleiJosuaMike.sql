create database if not exists DBKanzlei;
use DBKanzlei;
create table if not exists Rechnung
(
	RechnungID int AUTO_INCREMENT,
	Name varchar(50),
	Betrag int,
	AnwaltID int,
	primary key(RechnungID),
	foreign key (AnwaltID) references Anwalt(AnwaltID)
 );

create table if not exists Anwalt
(
	AnwaltID int AUTO_INCREMENT,
	Name varchar(50),
	Zulassung varchar(5),
	constraint pk_Anwalt
	primary key(AnwaltID)
);

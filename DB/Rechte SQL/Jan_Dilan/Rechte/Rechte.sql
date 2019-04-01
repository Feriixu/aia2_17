create database if not exists Kanzlei;
use Kanzlei;

create table if not exists Anwalt
(
    Anwalt-ID integer AUTO_INCREMENT,
	Name varchar (50) not null,
	Zulassung varchar (255) not null,
	
	primary key (Anwalt-ID)
);

create table if not exists Rechnung
(
    Rechungs-IF integer not null,
	Name varchar(50) not null,
	Betrag double not null,
	Anwalt-ID integer AUTO_INCREMENT,
	
	foreign key (Anwalt-ID) references Anwalt(Anwalt-ID)
);

Aufgabe 1
Es wird ein User namens safepass erstellt mit dem Passwort ,,Karl“.
Aufgabe 4
Bei c & d ist der Code falsch.

Create User Peter IDENTIFIED BY 'whats7';
Create User Rechnungsstelle IDENTIFIED BY '223intern';
Create User 778 IDENTIFIED BY '778';

Grant SELECT On Rechnung To Peter;
Grant SELECT, UPDATE, Insert on  Rechnung To Rechnungsstelle;
Grant Delete On Anwalt To Rechnungsstelle;
Grant Alter On Rechnung To Rechnungsstelle;

Exit;
mysql.exe - u Peter -p whats7;
Show Grants;

Exit;
mysql.exe -u Rechnungsstelle -p 223intern;
Show Grants;


mysql.exe -u root;

REVOKE Insert On Rechnung From Rechnungsstelle;
Revoke Select On Anwalt From Peter;
Exit;

mysql.exe -u Rechnungsstelle -p 223intern;
Show Grants;
Exit;

mysql.exe -u Peter -p whats7;
Show Grants;
Exit;

mysql.exe -u root;
CREATE USER Weiler IDENTIFIED BY 'true';
GRANT SELECT, Update On Rechnung To Weiler;
DROP User Weiler;

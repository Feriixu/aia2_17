Aufzeichnungen zu Rechteverwaltung


mysql -u root
drop database Kanzlei;
create database Kanzlei;
use Kanzlei;
create table Anwalt
(
AnwaltID integer not null,
Name varchar(255),
Zulassung bool,
primary key(AnwaltID)
) ;
create table Rechung
(
RechnungsID integer not null,
AnwaltID integer not null,
Name varchar(255),
Betrag double,
primary key(RechnungsID),
foreign key(AnwaltID) references Anwalt(AnwaltID)
);

/*
Aufgabe 1:
Hier wird der Benutzer "safepass"
als lokaler Benutzer erstellt, welchem
das Passwort "Karl" zugewiesen wird.
*/
--Aufgabe 2:
create user Peter identified by 'whats7';
create user Rechnungsstelle identified by '223intern';
--create user 778 identified by '778';
/* "Peter" kann sinnvoll sein, insofern "Peter"
existiert und das Passwort nicht vergessen wird.
Rechnungsstelle ist insgesamt sinnvoll.
Der Benutzer 778 ergibt hingegen überhaupt 
keinen Sinn, der Begriff lässt nicht auf
den Endbenutzer schließen und das Passwort 
ist nicht im Ansatz sicher. Dazu ist eine Zahl
als Benutzer nicht zulässig.
*/

--Aufgabe 3:
create user Meyer identified by 'lama';
grant select on Rechung to Meyer;
create user Schmidt identified by 'maulwurf';
grant select, update, insert on Rechung to Schmidt;
grant delete on Anwalt to Schmidt;
grant update on Rechnung to Schmidt;

--Aufgabe 4:
/* In a erhält der Benutzer "Lara" das Recht, 
Daten in der Tabelle "Anwalt"
zu speichern. In b wird dem Benutzer das Recht gegeben,
in der Tabelle Daten zu löschen. In c sollte dem
Benutzer die Erlaubnis genommen werden, in der Tabelle
Daten auszuwählen. Bei d sollte der Benutzer die Er-
laubnis bekommen, in der Tabelle Daten zu
aktualisieren. Das Problem bei c und d ist, dass die 
Schlüsselworte TO und FROM falschherum sind. in c
müsste FROM stehen und in d TO
*/

--Aufgabe 5: 
/* Er wird die Fehlermeldung erhalten, dass 
er in dieser Tabelle keine Rechte hat.
Er wird die Werte nicht ändern können.
*/

--Aufgabe 6:
/* Gute Frage, woher soll ich das wissen?
	Im Normalfall der, der mehr Rechte hat.
	Sollten wir Schmidt und Meyer vergleichen,
	hat Schmidt mehr Rechte. Eindeutig.
*/

--Aufgabe 7:

create user Thompson;
Create user Miller;
grant insert on Rechnung to Thompson;
grant select on Anwalt to Miller;
revoke insert on Rechung from Thompson;
revoke select on Anwalt from Miller;
show grants for Miller;
show grants for Thompson;
--Was wir sehen weiß ich aber nicht.

--Aufgabe 8:
create user Weiler identified by 'true';
grant select, update on Rechnung to Weiler;
drop user Weiler;

--Aufgabe 9:

create user Smith;
show grants for Smith;
drop user Smith;
--grant /*Welche Rechte Smith hatte*/ on /*Tabelle*/ to Miller;

--Aufgabe 10:

/* Hier hat der Hacker die Rechte von Personen 
ausgelesen, diesen Rechte Entzogen und
hat anschließend Thompson gelöscht. Dann hat
er sich ein eigenes Spion-Konto erstellt
und sich alle Rechte gegeben und damit angemeldet.
Er hat die Rechnungen ausgeben lassen und diese
dann gelöscht. Die Kanzlei sollte das Konto löschen.
*/

--Aufgabe 11:

create user Bruno identified by 'Trudy';
grant all privileges on * to Bruno;



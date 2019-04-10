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
Aufgabe 5
Er wird die Tabelle (Rechnungen) nicht updaten dürfen, 
da er für sie keine Update-Rechte besitzt.



Augabe 2
Create User Peter IDENTIFIED BY 'whats7';
Create User Rechnungsstelle IDENTIFIED BY '223intern';
Create User 778 IDENTIFIED BY '778';
Aufgabe 3
Grant SELECT On Rechnung To Peter;
Grant SELECT, UPDATE, Insert on  Rechnung To Rechnungsstelle;
Grant Delete On Anwalt To Rechnungsstelle;
Grant Alter On Rechnung To Rechnungsstelle;
Augabe 6
Exit;
mysql.exe - u Peter -p whats7;
Show Grants;

Exit;
mysql.exe -u Rechnungsstelle -p 223intern;
Show Grants;


mysql.exe -u root;
Augabe 7
REVOKE Insert On Rechnung From Rechnungsstelle;
Revoke Select On Anwalt From Peter;
Exit;

mysql.exe -u Rechnungsstelle -p 223intern;
Show Grants;
Exit;

mysql.exe -u Peter -p whats7;
Show Grants;
Exit;
Augabe 8
mysql.exe -u root;
CREATE USER Weiler IDENTIFIED BY 'true';
GRANT SELECT, Update On Rechnung To Weiler;
DROP User Weiler;
Augabe 9
grant all PRIVILEGES on Anwalt to Peter;
revoke all PRIVILEGES on Anwalt from Smith;
drop user Smith;
Augabe 10
Den Mitarbeitern wurden die Rechte zum bearbeiten der Tabellen entzogen.
Der Angreifer hat sich einen Admin Account namens "spion" erstellt mit dem
er die Rechnungs Tabelle löscht.
Entstandener Schaden: Sämtliche Rechnung gelöscht.
Backup hochladen wenn vorhanden um Schaden rückgängig zu machen.
Augabe 11
create user Bruno identified by 'Trudy';
grant all PRIVILEGES on Rechnungen to Bruno;
grant select on Anwalt to Bruno;



2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
2/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
42/4
Rechteverwaltung
Beispiel
Legen Sie einen lokalen Benutzer an, der Anne heißen soll. Anne soll sich nur über das sehr
sichere Passwort 123 einloggen können.
CREATE USER Anne@localhost IDENTIFIED BY ‘123‘; Im Admin-Account.
(das @localhost sorgt für einen lokalen Benutzer!)
Wechsel Sie in den Account von Anne und lassen Sie sich die Tabelle Kosten anzeigen.
EXIT;
mysql.exe –u Anne –p;
Password: 123
USE NoName;  Hier kommt es zum Fehler. Anne hat keine Rechte.
Anne soll jetzt die Tabell Kosten sehen und Einträge verändern dürfen.
GRANT Select, Update ON Kosten TO Anne@localhost; Im Admin-Account.
Wechseln Sie in den Account von Anne und lassen Sie sich ihre Rechte anzeigen. Danach
versuchen Sie die Tabelle Kosten auszugeben.
(Wechsel wie oben.)
SHOW GRANTS; Die Ausgabe sieht so aus:
(Die erste Zeile ist das Auswählen der Datenbank. In der zweiten Zeile steht das Recht
SELECT und UPDATE auf der Tabelle Kosten in der Datenbank NoName für Anne@localhost.)
USE NoName; Hier gibt es keine Fehlermeldung mehr.
SELECT * FROM Kosten; Wird korrekt angezeigt.
Anne braucht das Update-Recht nicht. Nehmen Sie es ihr wieder weg.
REVOKE Update ON Kosten FROM Anne@loclahost; Im Admin-Account.
Anne soll eine Zeile updaten.
(Wechsel wie oben.)
USE NoName;
UPDATE Kosten SET Betrag=0 WHERE KostenID=1; Zugriff verweigert!
3/4
Rechteverwaltung
Aufgaben
1) Erklären Sie was im folgenden Code passiert:
CREATE USER safepass@localhost IDENTIFIED BY ‘Karl‘;
*
2) Legen Sie folgende lokalen Benutzer an:
a) Peter mit Passwort whats7
b) Rechnungsstelle mit Passwort 223intern
c) 778 mit Passwort 778
Beurteilen Sie danach die Nützlichkeit dieser Benutzer.
*
*
*
**
3) Vergeben Sie folgende Rechte:
a) Select-Recht auf die Tabelle Rechnungen für den Benutzer Meyer.
b) Select-, Update- und Insert-Recht auf die Tabelle Rechnungen für Schmidt.
c) Delete-Recht auf die Tabelle Anwalt für Schmidt
d) Schmidt soll auch die Tabelle Rechnungen ändern dürfen. Schauen Sie
nach welchen Befehl es dafür gibt und geben Sie ihm das Recht.
*
**
*
**
4) Wir wollen die Rechte des Benutzers Lara@localhost ändern.
Erkläre in eigenen Worten was hier passiert.
a) GRANT Insert ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
b) GRANT Delete ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
c) REVOKE Select ON ‘kanzlei‘.‘anwalt‘ TO ‘Lara‘@‘localhost‘;
d) GRANT Update ON ‘kanzlei‘.‘anwalt‘ FROM ‘Lara‘@‘localhost‘;
Bei den Befehlen c) und d) meckert SQL. Warum?
*
*
*
**
**
5) Karl hat den SHOW GRANTS-Befehl eingegeben und erhält folgende Ausgabe:
GRANT USAGE ON *.* TO ‘Karl‘@‘localhost‘
GRANT SELECT, UPDATE ON ‘kanzlei‘.‘anwalt‘ TO ‘Karl‘@‘localhost‘
Danach hat er folgenden Befehl eingeben:
UPDATE Rechnungen SET Betrag=50;
Was wird er als Antwort erhalten? Warum?
**
6) Schauen Sie sich die Rechte von Thompson und Miller an. Wer darf mehr tun?
**
7) Entziehen Sie folgende Rechte:
a) Entziehen Sie Thompson das Insert-Recht in der Tabelle Rechnungen.
b) Nehmen Sie Miller das Select-Recht auf die Tabelle Anwalt weg.
Schauen Sie sich jetzt seine Rechte an. Erklären Sie Ihre Entdeckung!
*
*
**
4
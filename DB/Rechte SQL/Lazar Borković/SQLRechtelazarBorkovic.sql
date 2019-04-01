1.)
Ein neuer user wird erstellt mit dem namen safepass@localhost mit 
dem passwort Karl

2.)
Create USER Peter IDENTIFIELD BY 'whats7'
CREATE USER Rechnungsstelle IDENTIFIELD BY '223intern'
CREATE USER 778 IDENTIFIELD BY '778'

3.)
CREATE USER Mayer
CREATE USER SchmidtRechnung
CREATE USER Schmidt
CREATE TABLE IF NOT EXISTS Mayer
CREATE TABLE IF NOT EXISTS Schmidt
CREATE TABLE IF NOT EXISTS SchmidtRechnung
CREATE TABLE IF NOT EXISTS Anwalt
GRANT SELECT,PRIVILEG ON Tabelle TO Mayer
GRANT SELECT,UPDATE,INSERT ON Tabelle TO SchmidtRechnung
GRANT DELETE ON Anwalt TO Schmidt
GRANT UPDATE ON SchmidtRechnung TO Schmidt

4.)
Der Benutzer bekommt Insert rechte für die tabelle Kanzlei und Anwalt
Der Benutzer bekommt DELETE Rechte für die tabelle Kanzlei und Anwalt
Es werden die Select rechte vom benutzer für die tabelle Kanzlei und >Anwalt entzogen
Der Benutzer bekommt update rechte für die tabelle kanzlei und anwalt

5.)
Er wird die Tabelle (Rechnung) nicht updaten können
da er keine rechte besitzt um es zu updaten 

6.)
SHOW Grant For Thompson
Show grant For Miller

7.)
Revoke insert on rechnung From Thompson
revoke select on Anwalt From Miller

8.)
Create user Weiler  identified by 'true'
grant select, update on Rechnungen to Weiler
drop user Weiler

9.)
grant all PRIVILEGES on Anwalt to Miller
revoke all PRIVILEGES on Anwalt to Miller

10.)
Dem Mitarbeiter wurden die rechte entzogen
Der angreifer hat sich ein account erstellt mit dem namen Spion
er kann jetzt mit dem acc die tabelle löschen
Sämtliche rechnungen wuden gelöscht
Backuo hochladen wenn vorhanden um schaden rückgänig zu machen

11.)
create user Bruno identified by 'Trudy'
grant all PRIVILEGES on Rechnung to Bruno
grant select on Anwalt to Bruno







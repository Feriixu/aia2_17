1.
Neuer User mit dem Benutzernamen "safepass@localhost" und dem Passwort "Karl"

2.
a) CREATE User Peter IDENTIFIED BY 'whats7';
b) CREATE User Rechnungsstelle IDENTIFIED BY '223intern';
c) CREATE User 778 IDENTIFIED BY '778';

3.
a) GRANT SELECT ON Rechnungen TO Meyer;
b) GRANT SELECT, Update, Insert ON Rechnungen TO Schmidt;
c) GRANT Delete ON Anwalt TO Schmidt; 
d) GRANT Update ON Rechnungen TO Schmidt; 

4.
a) Benutzer Lara@localhost bekommt Insert Rechte für die Tabellen kanzlei und anwalt
b) Benutzer Lara@localhost bekommt Delete Rechte für die Tabellen kanzlei und anwalt
c) Benutzer Lara@localhost werden die SELECT Rechte für die Tabellen kanlzei und anwalt entzogen
d) Benutzer Lara@localhost bekommt Update Rechte für die Tabellen kanzlei und anwalt#

Revoke = From   
Grant = TO 

5.
Er wird die Tabelle (Rechnungen) nicht updaten dürfen, 
da er für sie keine Update-Rechte besitzt.

6.
SHOW GRANTS FOR Miller;
SHOW GRANTS FOR Thompson;

Miller hat mehr Rechte als Thompson oder andersherum.

7. 
revoke insert on Rechnungen from Thompson;
revoke select on Anwalt from Miller;

8.
create user Weiler identified by 'true';
grant select, update on Rechnungen to Weiler;
drop user Weiler;

9.
grant all PRIVILEGES on Anwalt to Miller;
revoke all PRIVILEGES on Anwalt from Smith;
drop user Smith;

10.
Den Mitarbeitern wurden die Rechte zum bearbeiten der Tabellen entzogen.
Der Angreifer hat sich einen Admin Account namens "spion" erstellt mit dem
er die Rechnungs Tabelle löscht.
Entstandener Schaden: Sämtliche Rechnung gelöscht.
Backup hochladen wenn vorhanden um Schaden rückgängig zu machen.

11.
create user Bruno identified by 'Trudy';
grant all PRIVILEGES on Rechnungen to Bruno;
grant select on Anwalt to Bruno;







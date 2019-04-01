Thompson = Schmidt
Miller = Meyer
Smith = Lara@localhost

1. Neuer User "safepass" in lokales Netz mit dem passwort "Karl"
2. a) CREATE USER Peter IDENTIFIED BY 'whats7';
   b) CREATE USER Rechnungsstelle IDENTIFIED BY '223intern';
   c) CREATE USER 778 IDENTIFIED BY '778';
3. a) GRANT Select ON Rechnungen TO Meyer;
   b) GRANT Select, Update, Insert ON Rechnungen TO Schmidt;
   c) GRANT Delete ON Anwalt TO Schmidt;
   d) GRANT Update ON Rechnungen TO Schmidt;
4. a) Insert-Recht geben in Datenbank 'kanzlei' Tabelle 'anwalt'  für Lara in lokales Netz
   b) Delete-Recht geben in Datenbank 'kanzlei' Tabelle 'anwalt'  für Lara in lokales Netz
   c) Select-Recht wegnehmen in Datenbank'kanzlei' Tabelle 'anwalt' von Lara in lokales Netz
   d) Update-Recht geben in Datenbank 'kanzlei' Tabelle 'anwalt' für Lara in lokales Netz
		Bei den Befehlen c) und d) SQL meckert weil:
		c) TO statt FROM
		d) FROM statt TO
5. Es wird die Tabelle "Rechnungen" nicht updaten duerfen,
   da es für sie keine Update-Rechte besitzt.
6. SHOW GRANTS FOR Schmidt;
   SHOW GRANTS FOR Meyer;
   
   Schmidt hat mehr Rechte als Meyer
7. REVOKE INSERT ON Rechnungen FROM Schmidt;
   REVOKE SELECT ON Anwalt FROM Meyer;
8. CREATE USER Weiler IDENTIFIED BY 'true';
   GRANT Select, Update ON Rechnungen;
   DROP USER Weiler;
9. GRANT Insert, Delete, Select, Update ON Anwalt TO Meyer;
   REVOKE Insert, Delete, Select, Update ON Anwalt FROM Lara@localhost;
   DROP USER Lara@localhost;
10. Den Mitarbeitern wurden die Rechte zum bearbeiten der Tabellen entzogen.
	Der Angreifer hat sich einen Admin Account namens "spion" erstellt mit dem
	er die Rechnungs Tabelle löscht.
	Entstandener Schaden: Sämtliche Rechnung gelöscht.
	Backup hochladen wenn vorhanden um Schaden rückgängig zu machen.
11. CREATE USER Bruno IDENTIFIED BY 'Trudy';
	GRANT ALL PRIVILEGES ON Rechnungen TO Bruno;
	GRANT SELECT ON Anwalt TO Bruno;
   
Aufgabe 1:
insert into kunde(Vorname,Nachname,KundeBD) 
     VALUES("Herr","Maier","1970-12-31");
	 
Aufgabe 2:
	select Vorname,Nachname,KundeBD
     from kunde
     where kundeBD >= "1960-01-01";  
	 
Aufgabe 3:
+-------------+-------+----------+------------+-------------+-------------+--------------+
| RechnungsNr | Preis | KundenNr | AuftragsNr | PersoKosten | MaterKosten | RechnungDate |
+-------------+-------+----------+------------+-------------+-------------+--------------+
|           1 |   300 |        1 |          6 |         150 |         150 | 2000-02-14   |
|           2 |   400 |        2 |          7 |         200 |         200 | 2000-02-14   |
|           3 |  3000 |        3 |          8 |        1500 |        1500 | 2000-02-14   |
|           4 |  4000 |        4 |          9 |        2000 |        2000 | 2000-02-14   |
|           5 |  6000 |        5 |         10 |        3000 |        3000 | 2000-02-14   |
+-------------+-------+----------+------------+-------------+-------------+--------------+
	
	 
Aufgabe 4:
	select sum(Preis)   
	from rechnung					
	where RechnungDate between "2000-02-01" and "2000-02-31" ;
	
Aufgabe 5:
	select sum(MaterKosten)   
	from rechnung					
	where RechnungDate between "2000-02-01" and "2000-02-31" ;
	
Aufgabe 6:
	select *, year(curdate()) - year(KundeBD) 
	AS KundeAlter from kunde 
	where Nachname LIKE 'Ma%'
	Group by KundeAlter
	ORDER BY KundeAlter desc;
	
	
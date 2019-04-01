	use DeltaMarina;
	
	-- Tabellenupdates
	insert into Rechnungsposition (Personalkosten, Materialkosten, Rechnungsdatum, Arbeit)
	 values (200, 92, 2017-02-12, "Umlackierung"),
	 (0, 100, 2017-02-4, "Motorverkauf"),
	 (42, 42, 2016-12-30, "Wartung"),
	 (50, 200, 2017-02-23, "Reparatur"),
	 (0, 20, 2018-01-11, "Beratung")
	 
	 
	 
	-- Aufgabe 1
	insert into Kunde(Name, Geburtsdatum)
     values("Joachim Maier", 1970-12-31);


	-- Aufgabe 2
	select Name, Geburtsdatum
     from Kunde
     where Geburtsdatum >= 1980-01-01;  


	-- Aufgabe 3
	select RechnungsID, sum(Personalkosten + Materialkosten) as "Nummer", Personalkosten, Materialkosten
	from Rechnungsposition
	group by RechnungsID;
	
	
	-- Aufgabe 4
	select sum(Personalkosten) + sum(Materialkosten)
	from Rechnungsposition					
	where Rechnungsdatum between 2017-02-01 and 2017-02-31 ;
	
	
	-- Aufgabe 5
	select sum(Materialkosten)
	from Rechnungspositon					
	where Rechnungdatum between 2017-02-01 and 2017-02-31 ;
	

	-- Aufgabe 6
	select *, year(curdate()) - year(Geburtsdatum)
	AS Geburtsdatum from Kunde 
	where Name LIKE 'Ma%'
	Group by KundeAlter
	ORDER BY Geburtsdatum desc;
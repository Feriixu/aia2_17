Aufgabe 1:
Alter Kunde
add KundeBD DATE;

insert into Kunde(Vorname,Nachname,KundeBD)
    values ("Thomas","Maier","1970-12-31");
Aufgabe 2:
select Vorname,Nachname,KundeBD
    from Kunde
    where KundeBD >= "1960-01-01";
Aufgabe 4:
select sum(Preis)
    from rechnung
    where RechnungDate between "2017-02-01" and "2017-02-28";
Aufgabe 5:
select sum(MaterialKosten)
    from rechung 
    where RechnungDate between "2017-01-01" and "2017-12-31";
Aufgabe 6:
select *, year(curdate()) - year(KundeBD) 
	AS alterk from kunde 
	where Nachname LIKE 'Ma%'
	Group by alterk
	ORDER BY alterk desc;
	
 	
	
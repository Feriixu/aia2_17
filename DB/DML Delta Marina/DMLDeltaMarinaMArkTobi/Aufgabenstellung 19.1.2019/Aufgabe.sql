1.
alter table Kunde
add GebDatum date;
update Kunde
set GebDatum = 1970-12-31
where Name = "Herbert Maier";

2.select * from Kunde
where GebDatum >= 1980-01-01;

3.
select KostenPers, KostenMat, sum(KostenPers) + sum(KostenMat) from Rechnungsposition group by RechungspositionID;
-- Oder so? Ist ganz sicher falsch, aber alles ist so verschachtelt, dass ich keine Lust habe, die komplette Datenbank neu zu machen. Entschuldigung.
 
4.
select RechungsNR
from Rechung 
where year(AuftragsDat) = "2017" and month(AuftragsDat) = "02";

5.
select sum(KostenMat)
from Rechnung
where year(AuftragsDat) = "2017";

6.
select Name
from Kunde
where Name like 'Ma%' and 
year(curdate()) - year(GebDat) >= 52
order by GebDat asc

 

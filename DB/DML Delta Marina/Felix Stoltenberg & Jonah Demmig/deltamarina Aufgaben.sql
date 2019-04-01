-- Aufgabe 1
INSERT INTO kunde(name, geburtsdatum)
	VALUES("Joachim Maier", 1970-12-31);

-- Aufgabe 2
SELECT COUNT(*) 
FROM kunde k 
WHERE k.geburtsdatum >= '1980-00-00';

-- Aufgabe 3
SELECT r.rechnungsID, SUM(rp.kostenPersonal) as "Personal Kosten", SUM(rp.kostenMaterial) as "Material Kosten", SUM(rp.kostenPersonal + rp.kostenMaterial) as "Total" 
FROM rechnung r, rechnungsposition rp 
WHERE r.rechnungsID = rp.rechnungsID
GROUP BY r.rechnungsID;

-- Aufgabe 4
SELECT SUM(rp.kostenPersonal + rp.kostenMaterial) as "Total 2017 February"
FROM rechnung r, rechnungsposition rp
WHERE YEAR(r.rechnungsDatum) = 2017 AND MONTH(r.rechnungsDatum) = 2 AND r.rechnungsID = rp.rechnungsID;

-- Aufgabe 5
SELECT SUM(rp.kostenMaterial) as "Total 2017 Material"
FROM rechnung r, rechnungsposition rp
WHERE YEAR(r.rechnungsDatum) = 2017 AND r.rechnungsID = rp.rechnungsID;

-- Aufgabe 6
SELECT *, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), k.geburtsdatum)), "%Y")+0 AS age
FROM kunde k
WHERE k.name LIKE 'Ma%';
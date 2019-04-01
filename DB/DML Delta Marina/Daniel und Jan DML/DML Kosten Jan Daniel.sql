Alter TABLE Rechnung
ADD Personalkosten INTEGER;
ADD Materialkosten INTEGER;

Insert INTO Rechnung WHERE RechnungsID = 1000000
(Personalkosten,Materialkosten)
VALUES
(30,280)

Insert INTO Rechnung WHERE RechnungsID = 1000001
(Personalkosten,Materialkosten)
VALUES
(15,210)

Insert INTO Rechnung WHERE RechnungsID = 1000002
(Personalkosten,Materialkosten)
VALUES
(60,560)

Insert INTO Rechnung WHERE RechnungsID = 1000003
(Personalkosten,Materialkosten)
VALUES
(7,95)

Insert INTO Rechnung WHERE RechnungsID = 1000004
(Personalkosten,Materialkosten)
VALUES
(40,760)

Insert INTO Rechnung WHERE RechnungsID = 1000005
(Personalkosten,Materialkosten)
VALUES
(245,430)

SELECT Personalkosten, Materialkosten, 
FROM Rechnung;

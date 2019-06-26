-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Jun 2019 um 10:47
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `kfzwerki`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auto`
--
CREATE TABLE `auto` (
  `AutoID` int(11) NOT NULL,
  `Typ` varchar(250) DEFAULT NULL,
  `Kennzeichen` varchar(250) DEFAULT NULL,
  `Kilometer` int(11) DEFAULT NULL,
  `AbgelesenAm` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `auto`
--

INSERT INTO `auto` (`AutoID`, `Typ`, `Kennzeichen`, `Kilometer`, `AbgelesenAm`) VALUES
(1, 'Luchs', 'HH-81-187', 8800, '1940-06-18'),
(2, 'Leopard Mk 1', 'HH-88-1312', 8100, '1921-07-14'),
(3, 'Panzerkampfwagen VI Tiger', 'HH-18-1337', 1800, '1944-08-12');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fachgebiet`
--

CREATE TABLE `fachgebiet` (
  `FachgebietID` int(11) NOT NULL,
  `Fachgebiet` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `fachgebiet`
--

INSERT INTO `fachgebiet` (`FachgebietID`, `Fachgebiet`) VALUES
(1, 'Flüchtlingsbeseitigungs-Experte'),
(2, 'SanitärerGastechnicker'),
(3, 'Reihnbahn');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `Name` varchar(250) DEFAULT NULL,
  `Adresse` varchar(250) DEFAULT NULL,
  `KundenID` int(11) NOT NULL,
  `AutoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`Name`, `Adresse`, `KundenID`, `AutoID`) VALUES
('Torsten Goebbels', 'Berlin-Reichskanzlei', 1, 1),
('Rooobert Himmler', 'Offenbach-Am-Main', 2, 2),
('Jan Funke', 'Reeperbahn', 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mechaniker`
--

CREATE TABLE `mechaniker` (
  `MiNr` int(11) NOT NULL,
  `FachgebietID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `mechaniker`
--

INSERT INTO `mechaniker` (`MiNr`, `FachgebietID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechnung`
--

CREATE TABLE `rechnung` (
  `RechnungID` int(11) NOT NULL,
  `Kosten` int(11) DEFAULT NULL,
  `RechnungsDatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `rechnung`
--

INSERT INTO `rechnung` (`RechnungID`, `Kosten`, `RechnungsDatum`) VALUES
(1, 23, '1000-01-01'),
(2, 24, '0001-01-01'),
(3, 25, '2013-12-11');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reparatur`
--

CREATE TABLE `reparatur` (
  `Diagnose` varchar(250) DEFAULT NULL,
  `KundenID` int(11) DEFAULT NULL,
  `MiNr` int(11) DEFAULT NULL,
  `RechnungID` int(11) DEFAULT NULL,
  `AuftragsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `reparatur`
--

INSERT INTO `reparatur` (`Diagnose`, `KundenID`, `MiNr`, `RechnungID`, `AuftragsID`) VALUES
(NULL, 1, 1, 1, 7),
(NULL, 2, 2, 2, 8),
(NULL, 3, 3, 3, 9);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`AutoID`);

--
-- Indizes für die Tabelle `fachgebiet`
--
ALTER TABLE `fachgebiet`
  ADD PRIMARY KEY (`FachgebietID`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`KundenID`),
  ADD KEY `AutoID` (`AutoID`);

--
-- Indizes für die Tabelle `mechaniker`
--
ALTER TABLE `mechaniker`
  ADD PRIMARY KEY (`MiNr`),
  ADD KEY `FachgebietID` (`FachgebietID`);

--
-- Indizes für die Tabelle `rechnung`
--
ALTER TABLE `rechnung`
  ADD PRIMARY KEY (`RechnungID`);

--
-- Indizes für die Tabelle `reparatur`
--
ALTER TABLE `reparatur`
  ADD PRIMARY KEY (`AuftragsID`),
  ADD KEY `KundenID` (`KundenID`),
  ADD KEY `MiNr` (`MiNr`),
  ADD KEY `RechnungID` (`RechnungID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `auto`
--
ALTER TABLE `auto`
  MODIFY `AutoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `fachgebiet`
--
ALTER TABLE `fachgebiet`
  MODIFY `FachgebietID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `KundenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `mechaniker`
--
ALTER TABLE `mechaniker`
  MODIFY `MiNr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `rechnung`
--
ALTER TABLE `rechnung`
  MODIFY `RechnungID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `reparatur`
--
ALTER TABLE `reparatur`
  MODIFY `AuftragsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD CONSTRAINT `kunde_ibfk_1` FOREIGN KEY (`AutoID`) REFERENCES `auto` (`AutoID`);

--
-- Constraints der Tabelle `mechaniker`
--
ALTER TABLE `mechaniker`
  ADD CONSTRAINT `mechaniker_ibfk_1` FOREIGN KEY (`FachgebietID`) REFERENCES `fachgebiet` (`FachgebietID`);

--
-- Constraints der Tabelle `reparatur`
--
ALTER TABLE `reparatur`
  ADD CONSTRAINT `reparatur_ibfk_1` FOREIGN KEY (`KundenID`) REFERENCES `kunde` (`KundenID`),
  ADD CONSTRAINT `reparatur_ibfk_2` FOREIGN KEY (`MiNr`) REFERENCES `mechaniker` (`MiNr`),
  ADD CONSTRAINT `reparatur_ibfk_3` FOREIGN KEY (`RechnungID`) REFERENCES `rechnung` (`RechnungID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

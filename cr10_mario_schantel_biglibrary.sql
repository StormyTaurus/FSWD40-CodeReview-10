-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Erstellungszeit: 27. Jun 2018 um 17:14
-- Server-Version: 5.6.38
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr10_mario_schantel_biglibrary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL,
  `street` varchar(30) NOT NULL,
  `houseNumber` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`addressId`, `street`, `houseNumber`, `zip`, `city`, `country`) VALUES
(1, 'Butternut', '343', '1234', 'Mahuta', 'Tanzania'),
(2, 'Mallard', '6216', '181 36', 'Lidingö', 'Sweden'),
(3, 'Old Gate', '18', '38740-000', 'Patrocínio', 'Brazil'),
(4, 'Debra', '43263', '1234', 'Miyang', 'China'),
(5, 'Schurz', '66', '742-0021', 'Yanai', 'Japan'),
(6, 'Toban', '9528', '6814', 'Arnhem', 'Netherlands'),
(7, 'Cascade', '15', '1234', 'Zhangfeng', 'China'),
(8, 'Pine View', '6871', '6225', 'Lipahan', 'Philippines'),
(9, 'Stone Corner', '7', '1234', 'Futang', 'China'),
(10, 'Butterfield', '0', '1234', 'Ambam', 'Cameroon');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `authorId` int(11) NOT NULL,
  `authorName` varchar(30) NOT NULL,
  `authorSurname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`authorId`, `authorName`, `authorSurname`) VALUES
(1, 'Cody', 'Smith'),
(2, 'High Crossing', '91'),
(3, 'Bunker Hill', '58541'),
(4, 'Bay', '915'),
(5, 'Annamark', '9351'),
(6, 'Hoffman', '5400'),
(7, 'Logan', '97'),
(8, 'Jay', '3'),
(9, 'Butterfield', '1'),
(10, 'Kinsman', '190');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

CREATE TABLE `media` (
  `mediaId` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `image` varchar(100) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `short_description` int(11) NOT NULL,
  `publish_date` int(11) NOT NULL,
  `type` enum('book','CD','DVD') NOT NULL,
  `status` enum('available','reserved') NOT NULL,
  `genres` enum('crime','drama','comedy','education') NOT NULL,
  `fk_authorId` int(11) NOT NULL,
  `fk_publisherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `media`
--

INSERT INTO `media` (`mediaId`, `title`, `image`, `ISBN`, `short_description`, `publish_date`, `type`, `status`, `genres`, `fk_authorId`, `fk_publisherId`) VALUES
(2, 'Good Luck Chuck', 'http://dummyimage.com/500x500.png/ff4444/ffffff', 515833052, 0, 1, 'book', 'available', 'crime', 0, 0),
(3, 'Guter Junge', 'http://dummyimage.com/500x500.png/5fa2dd/ffffff', 553257135, 0, 24, 'book', 'available', 'crime', 0, 0),
(4, 'Devil to Pay!, The', 'http://dummyimage.com/500x500.png/5fa2dd/ffffff', 802695302, 0, 16, 'book', 'available', 'crime', 0, 0),
(5, 'Horse\'s Mouth, The', 'http://dummyimage.com/500x500.png/ff4444/ffffff', 564014511, 0, 18, 'book', 'available', 'crime', 0, 0),
(6, 'Zardoz', 'http://dummyimage.com/500x500.png/5fa2dd/ffffff', 32786204, 0, 19, 'book', 'available', 'crime', 0, 0),
(7, 'Horseman on the Roof, The (Hus', 'http://dummyimage.com/500x500.png/cc0000/ffffff', 841764360, 0, 23, 'book', 'available', 'crime', 0, 0),
(8, 'Coup de torchon (Clean Slate)', 'http://dummyimage.com/500x500.png/5fa2dd/ffffff', 907186942, 0, 28, 'book', 'available', 'crime', 0, 0),
(9, 'Hamlet', 'http://dummyimage.com/500x500.png/cc0000/ffffff', 923850881, 0, 31, 'book', 'available', 'crime', 0, 0),
(10, 'Samson and Delilah', 'http://dummyimage.com/500x500.png/ff4444/ffffff', 308237006, 0, 6, 'book', 'available', 'crime', 0, 0),
(11, 'Tarnation', 'http://dummyimage.com/500x500.png/dddddd/000000', 726326137, 0, 1, 'book', 'available', 'crime', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publisherId` int(11) NOT NULL,
  `publisherName` varchar(30) NOT NULL,
  `publisherSize` enum('big','medium','small') NOT NULL,
  `fk_addressId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`publisherId`, `publisherName`, `publisherSize`, `fk_addressId`) VALUES
(1, 'Bird, magnificent frigate', '', 0),
(2, 'White-throated robin', '', 0),
(3, 'Malachite kingfisher', '', 0),
(4, 'Skimmer, four-spotted', '', 0),
(5, 'Nyala', '', 0),
(6, 'Fox, pampa gray', '', 0),
(7, 'Pied butcher bird', '', 0),
(8, 'Otter, giant', '', 0),
(9, 'Badger, european', '', 0),
(10, 'Sandgrouse, yellow-throated', '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`userId`, `userName`, `userEmail`, `userPass`) VALUES
(1, 'Anna', 'anna@anna.at', '9e024931490edd27ed375042392eede03cf1ded579944cb54da0e7d566abccf5');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressId`);

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorId`);

--
-- Indizes für die Tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`mediaId`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherId`),
  ADD KEY `fk_addressId` (`fk_addressId`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `authorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `media`
--
ALTER TABLE `media`
  MODIFY `mediaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisherId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 30, 2026 alle 13:41
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12
--finale
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS carpooling;
USE carpooling;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS feedbackaut, feedbackpas, richiesta, viaggio, passeggero, autista;
SET FOREIGN_KEY_CHECKS=1;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpooling`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `autista`
--

CREATE TABLE `autista` (
  `idAutista` int(10) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `dataNascita` date NOT NULL,
  `sesso` varchar(1) NOT NULL,
  `nPatente` varchar(10) NOT NULL,
  `dataScadenza` date NOT NULL,
  `targa` varchar(10) NOT NULL,
  `modello` varchar(30) NOT NULL,
  `nTelefono` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `autista`
--

INSERT INTO `autista` (`idAutista`, `cognome`, `nome`, `dataNascita`, `sesso`, `nPatente`, `dataScadenza`, `targa`, `modello`, `nTelefono`, `email`, `foto`, `password`) VALUES
(1, 'Rossi', 'Marco', '1985-01-01', 'M', 'PAT001', '2030-01-01', 'AA001AA', 'Fiat 500', '3330000001', 'a1@mail.it', 'f1.jpg', '8a8bb7cd343aa2ad99b7d762030857a2'),
(2, 'Bianchi', 'Luca', '1986-02-02', 'M', 'PAT002', '2030-02-02', 'AA002AA', 'VW Golf', '3330000002', 'a2@mail.it', 'f2.jpg', '693a9fdd4c2fd0700968fba0d07ff3c0'),
(3, 'Verdi', 'Sara', '1987-03-03', 'F', 'PAT003', '2030-03-03', 'AA003AA', 'Toyota Yaris', '3330000003', 'a3@mail.it', 'f3.jpg', '9d607a663f3e9b0a90c3c8d4426640dc'),
(4, 'Neri', 'Paolo', '1988-04-04', 'M', 'PAT004', '2030-04-04', 'AA004AA', 'Ford Focus', '3330000004', 'a4@mail.it', 'f4.jpg', '894f782a148b33af1e39a0efed952d69'),
(5, 'Galli', 'Anna', '1989-05-05', 'F', 'PAT005', '2030-05-05', 'AA005AA', 'Audi A3', '3330000005', 'a5@mail.it', 'f5.jpg', '32cfe6c19200b67afb7c3d0e1c43eadb'),
(6, 'Costa', 'Luca', '1990-06-06', 'M', 'PAT006', '2030-06-06', 'AA006AA', 'BMW 3', '3330000006', 'a6@mail.it', 'f6.jpg', 'f74dd50cfec0f8549406fee6191d2f8d'),
(7, 'Fontana', 'Marta', '1991-07-07', 'F', 'PAT007', '2030-07-07', 'AA007AA', 'Opel Corsa', '3330000007', 'a7@mail.it', 'f7.jpg', 'c692562238d8c12c32434c50b96d56ae'),
(8, 'Greco', 'Andrea', '1992-08-08', 'M', 'PAT008', '2030-08-08', 'AA008AA', 'Renault Clio', '3330000008', 'a8@mail.it', 'f8.jpg', '68c42382c8b93fc29c2fcb6a444aeda5'),
(9, 'Conti', 'Elisa', '1993-09-09', 'F', 'PAT009', '2030-09-09', 'AA009AA', 'Hyundai i20', '3330000009', 'a9@mail.it', 'f9.jpg', '3d1e97d18e692ca5484d1abfe617b6c1'),
(10, 'Romano', 'Davide', '1994-10-10', 'M', 'PAT010', '2030-10-10', 'AA010AA', 'Peugeot 208', '3330000010', 'a10@mail.it', 'f10.jpg', '48881d728a96516e0e886c09603e7eee'),
(11, 'Ricci', 'Laura', '1985-11-11', 'F', 'PAT011', '2030-11-11', 'AA011AA', 'Fiat Panda', '3330000011', 'a11@mail.it', 'f11.jpg', '11340131feec68e7ca463f960f0f341c'),
(12, 'Marino', 'Fabio', '1986-12-12', 'M', 'PAT012', '2030-12-12', 'AA012AA', 'Seat Ibiza', '3330000012', 'a12@mail.it', 'f12.jpg', 'ed20a959d410ccd843d9e1dfcee04228'),
(13, 'Lombardi', 'Giulia', '1987-01-13', 'F', 'PAT013', '2030-01-13', 'AA013AA', 'Mini One', '3330000013', 'a13@mail.it', 'f13.jpg', 'd161425547c059ba556e30cf612fb974'),
(14, 'Barbieri', 'Simone', '1988-02-14', 'M', 'PAT014', '2030-02-14', 'AA014AA', 'Tesla 3', '3330000014', 'a14@mail.it', 'f14.jpg', '2169184650ee32062f115ec35faf6c9b'),
(15, 'Moretti', 'Chiara', '1989-03-15', 'F', 'PAT015', '2030-03-15', 'AA015AA', 'Kia Rio', '3330000015', 'a15@mail.it', 'f15.jpg', '9c8a0632757d66bb9ae533b2d0a7a0fa'),
(16, 'Testa', 'Alberto', '1990-04-16', 'M', 'PAT016', '2030-04-16', 'AA016AA', 'Citroen C3', '3330000016', 'a16@mail.it', 'f16.jpg', 'd7b24e66a3c4ea77a4a224995bc3899a'),
(17, 'Ferrari', 'Elena', '1991-05-17', 'F', 'PAT017', '2030-05-17', 'AA017AA', 'Mercedes A', '3330000017', 'a17@mail.it', 'f17.jpg', '62a0e3d0e8d9db40e64419904a137c32'),
(18, 'Serra', 'Giorgio', '1992-06-18', 'M', 'PAT018', '2030-06-18', 'AA018AA', 'Dacia Sandero', '3330000018', 'a18@mail.it', 'f18.jpg', '547d9b61ebf6828f37f3f1616b06eb94'),
(19, 'Riva', 'Valeria', '1993-07-19', 'F', 'PAT019', '2030-07-19', 'AA019AA', 'Nissan Micra', '3330000019', 'a19@mail.it', 'f19.jpg', '7db183c15847634a301761dc8b88e035'),
(20, 'Villa', 'Claudio', '1994-08-20', 'M', 'PAT020', '2030-08-20', 'AA020AA', 'Skoda Octavia', '3330000020', 'a20@mail.it', 'f20.jpg', '550748639a1675e04db3d8a4135094a0'),
(21, 'Orlando', 'Noemi', '1985-09-21', 'F', 'PAT021', '2030-09-21', 'AA021AA', 'Ford Fiesta', '3330000021', 'a21@mail.it', 'f21.jpg', 'a126f3646da124e2839a6bbbd2f1400f'),
(22, 'Leone', 'Matteo', '1986-10-22', 'M', 'PAT022', '2030-10-22', 'AA022AA', 'Audi A1', '3330000022', 'a22@mail.it', 'f22.jpg', '6458f3bfa6486a2be61b9fb6f37645c8'),
(23, 'Fiore', 'Irene', '1987-11-23', 'F', 'PAT023', '2030-11-23', 'AA023AA', 'VW Polo', '3330000023', 'a23@mail.it', 'f23.jpg', 'e4a7fc9521d0b60fcbb982035b644b5e'),
(24, 'Grassi', 'Tommaso', '1988-12-24', 'M', 'PAT024', '2030-12-24', 'AA024AA', 'Toyota Corolla', '3330000024', 'a24@mail.it', 'f24.jpg', 'a43c7f3d9d0f4a718450633e3765b67c'),
(25, 'Bellini', 'Sara', '1989-01-25', 'F', 'PAT025', '2030-01-25', 'AA025AA', 'Opel Astra', '3330000025', 'a25@mail.it', 'f25.jpg', '7850737a42d9d21cac6fee3958d95f5f'),
(26, 'Ferri', 'Andrea', '1990-02-26', 'M', 'PAT026', '2030-02-26', 'AA026AA', 'Hyundai Tucson', '3330000026', 'a26@mail.it', 'f26.jpg', 'bbf2466e744a50035030927d7283f2b3'),
(27, 'Pellegrini', 'Giada', '1991-03-27', 'F', 'PAT027', '2030-03-27', 'AA027AA', 'Jeep Renegade', '3330000027', 'a27@mail.it', 'f27.jpg', '07ae153a4f9e087201edbdd5a4c12d5e'),
(28, 'Santoro', 'Daniele', '1992-04-28', 'M', 'PAT028', '2030-04-28', 'AA028AA', 'BMW X1', '3330000028', 'a28@mail.it', 'f28.jpg', '838ff8b78dfbe82b2bc6c681f0cb390f'),
(29, 'Caruso', 'Marta', '1993-05-29', 'F', 'PAT029', '2030-05-29', 'AA029AA', 'Audi Q2', '3330000029', 'a29@mail.it', 'f29.jpg', '2a097c8e4ebabb754f6e346bedd967b4'),
(30, 'Parisi', 'Lorenzo', '1994-06-30', 'M', 'PAT030', '2030-06-30', 'AA030AA', 'Mazda 2', '3330000030', 'a30@mail.it', 'f30.jpg', '6ce5608d8200ff569a8d736f4e0830d9');

-- --------------------------------------------------------

--
-- Struttura della tabella `feedbackaut`
--

CREATE TABLE `feedbackaut` (
  `idFeedback` int(10) NOT NULL,
  `voto` int(10) NOT NULL,
  `recensione` varchar(60) NOT NULL,
  `idAutista` int(10) NOT NULL,
  `idPasseggero` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `feedbackaut`
--

INSERT INTO `feedbackaut` (`idFeedback`, `voto`, `recensione`, `idAutista`, `idPasseggero`) VALUES
(1, 5, 'Ottimo viaggio', 1, 1),
(2, 4, 'Puntuale', 2, 2),
(3, 3, 'Nella media', 3, 3),
(4, 5, 'Perfetto', 4, 4),
(5, 4, 'Molto bene', 5, 5),
(6, 2, 'Ritardo', 6, 6),
(7, 5, 'Consigliato', 7, 7),
(8, 4, 'Disponibile', 8, 8),
(9, 3, 'Normale', 9, 9),
(10, 5, 'Eccellente', 10, 10),
(11, 4, 'Preciso', 11, 11),
(12, 3, 'Discreto', 12, 12),
(13, 5, 'Top', 13, 13),
(14, 4, 'Affidabile', 14, 14),
(15, 2, 'Poco attento', 15, 15),
(16, 5, 'Ottima guida', 16, 16),
(17, 4, 'Bravo', 17, 17),
(18, 3, 'Ok', 18, 18),
(19, 5, 'Perfetto', 19, 19),
(20, 4, 'Molto bene', 20, 20),
(21, 3, 'Normale', 21, 21),
(22, 5, 'Ottimo', 22, 22),
(23, 4, 'Puntuale', 23, 23),
(24, 2, 'Ritardo', 24, 24),
(25, 5, 'Consigliato', 25, 25),
(26, 4, 'Disponibile', 26, 26),
(27, 3, 'Nella media', 27, 27),
(28, 5, 'Perfetto', 28, 28),
(29, 4, 'Bravo', 29, 29),
(30, 3, 'Ok', 30, 30);

-- --------------------------------------------------------

--
-- Struttura della tabella `feedbackpas`
--

CREATE TABLE `feedbackpas` (
  `idFeedback` int(10) NOT NULL,
  `voto` int(10) NOT NULL,
  `recensione` varchar(60) NOT NULL,
  `idPasseggero` int(10) NOT NULL,
  `idAutista` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `feedbackpas`
--

INSERT INTO `feedbackpas` (`idFeedback`, `voto`, `recensione`, `idPasseggero`, `idAutista`) VALUES
(1, 5, 'Passeggero preciso', 1, 1),
(2, 4, 'Cordiale', 2, 2),
(3, 3, 'Normale', 3, 3),
(4, 5, 'Ottimo', 4, 4),
(5, 4, 'Educato', 5, 5),
(6, 2, 'Ritardo', 6, 6),
(7, 5, 'Perfetto', 7, 7),
(8, 4, 'Bravo', 8, 8),
(9, 3, 'Ok', 9, 9),
(10, 5, 'Consigliato', 10, 10),
(11, 4, 'Puntuale', 11, 11),
(12, 3, 'Discreto', 12, 12),
(13, 5, 'Top', 13, 13),
(14, 4, 'Affidabile', 14, 14),
(15, 2, 'Scortese', 15, 15),
(16, 5, 'Ottimo', 16, 16),
(17, 4, 'Preciso', 17, 17),
(18, 3, 'Normale', 18, 18),
(19, 5, 'Perfetto', 19, 19),
(20, 4, 'Bravo', 20, 20),
(21, 3, 'Ok', 21, 21),
(22, 5, 'Eccellente', 22, 22),
(23, 4, 'Cordiale', 23, 23),
(24, 2, 'Ritardo', 24, 24),
(25, 5, 'Ottimo', 25, 25),
(26, 4, 'Educato', 26, 26),
(27, 3, 'Normale', 27, 27),
(28, 5, 'Perfetto', 28, 28),
(29, 4, 'Bravo', 29, 29),
(30, 3, 'Ok', 30, 30);

-- --------------------------------------------------------

--
-- Struttura della tabella `passeggero`
--

CREATE TABLE `passeggero` (
  `idPasseggero` int(11) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `nDocumento` varchar(20) NOT NULL,
  `nTelefono` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `passeggero`
--

INSERT INTO `passeggero` (`idPasseggero`, `cognome`, `nome`, `nDocumento`, `nTelefono`, `email`, `password`) VALUES
(1, 'Testa', 'Roberto', 'DOC001', '3490000001', 'p1@mail.it', 'ec6ef230f1828039ee794566b9c58adc'),
(2, 'Fiore', 'Marta', 'DOC002', '3490000002', 'p2@mail.it', '1d665b9b1467944c128a5575119d1cfd'),
(3, 'Grassi', 'Claudio', 'DOC003', '3490000003', 'p3@mail.it', '7bc3ca68769437ce986455407dab2a1f'),
(4, 'Pellegrini', 'Elena', 'DOC004', '3490000004', 'p4@mail.it', '13207e3d5722030f6c97d69b4904d39d'),
(5, 'Orlando', 'Matteo', 'DOC005', '3490000005', 'p5@mail.it', 'ed92eff813a02a31a2677be0563a0739'),
(6, 'Serra', 'Giada', 'DOC006', '3490000006', 'p6@mail.it', 'c6c27fc98633c82571d75dcb5739bbdf'),
(7, 'Bellini', 'Tommaso', 'DOC007', '3490000007', 'p7@mail.it', '46d46a759bf6cbed05d7bcdcb911a4f8'),
(8, 'Ferri', 'Noemi', 'DOC008', '3490000008', 'p8@mail.it', '2e3f209d4f2bb34667dde08e3c9585f1'),
(9, 'Longo', 'Fabio', 'DOC009', '3490000009', 'p9@mail.it', 'd9a9d61ef9ac1fb462fb3ce61f509700'),
(10, 'DeLuca', 'Martina', 'DOC010', '3490000010', 'p10@mail.it', 'ad304601e6638bf2bcdd5345c013a6c1'),
(11, 'Parisi', 'Giorgio', 'DOC011', '3490000011', 'p11@mail.it', '52053048decaa0cbd3c2dcf5871e5da4'),
(12, 'Santoro', 'Irene', 'DOC012', '3490000012', 'p12@mail.it', 'd3d078bf2fc1425e6d4410ccb6ed6df9'),
(13, 'Caruso', 'Alberto', 'DOC013', '3490000013', 'p13@mail.it', 'f4fc7371dbc6aba67d64fe6a3c76df2f'),
(14, 'Leone', 'Valeria', 'DOC014', '3490000014', 'p14@mail.it', '989ae4f0a2ea31db452b35e0d9980e6f'),
(15, 'Barbieri', 'Daniele', 'DOC015', '3490000015', 'p15@mail.it', 'a60812a268abc3f1f5c56ddc205e5a23'),
(16, 'Lombardi', 'Serena', 'DOC016', '3490000016', 'p16@mail.it', '5e9ac5d787f7bdd0fa73b873ad4f278e'),
(17, 'Marini', 'Laura', 'DOC017', '3490000017', 'p17@mail.it', 'e9257cc14147de6900b8f5c69aadb9df'),
(18, 'Gallo', 'Andrea', 'DOC018', '3490000018', 'p18@mail.it', 'dea53267ffa777342a3410049824378e'),
(19, 'Conti', 'Alessio', 'DOC019', '3490000019', 'p19@mail.it', '919d250e02683667351d5452a3a2a2e9'),
(20, 'Rizzo', 'Chiara', 'DOC020', '3490000020', 'p20@mail.it', 'f908f971301411a4259ee45a8d1bc08d'),
(21, 'Greco', 'Simone', 'DOC021', '3490000021', 'p21@mail.it', '22119ec76d92563d121d645530848a2f'),
(22, 'Fontana', 'Elena', 'DOC022', '3490000022', 'p22@mail.it', '02c7666149d51f4c0e253ce76f25e87c'),
(23, 'Moretti', 'Andrea', 'DOC023', '3490000023', 'p23@mail.it', '889201a3dd5cfc1ceae68e330da06215'),
(24, 'Ricci', 'Giulia', 'DOC024', '3490000024', 'p24@mail.it', '518fd46dddb3f97e176198f08ec766d6'),
(25, 'Neri', 'Paola', 'DOC025', '3490000025', 'p25@mail.it', 'fbf9c52ec98500e36e1f975d28bb4afa'),
(26, 'Costa', 'Marco', 'DOC026', '3490000026', 'p26@mail.it', '6a1b6dfef4633061e8f86e896ccf2a8a'),
(27, 'Villa', 'Sara', 'DOC027', '3490000027', 'p27@mail.it', '6266e0c466433d839dc5e3d205fcb7c6'),
(28, 'Romano', 'Luca', 'DOC028', '3490000028', 'p28@mail.it', 'c85a4a9cd61c130fd525ea36becac235'),
(29, 'Ferrari', 'Marta', 'DOC029', '3490000029', 'p29@mail.it', '8f52a5625438731b5c647f76009f1489'),
(30, 'Serra', 'Davide', 'DOC030', '3490000030', 'p30@mail.it', 'ff41163c57ea8378b801dea44ff5429c');

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta`
--

CREATE TABLE `richiesta` (
  `idRichiesta` int(10) NOT NULL,
  `idPasseggero` int(10) NOT NULL,
  `idViaggio` int(10) NOT NULL,
  `accettata` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `richiesta`
--

INSERT INTO `richiesta` (`idRichiesta`, `idPasseggero`, `idViaggio`, `accettata`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 0),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 0),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 0),
(10, 10, 10, 1),
(11, 11, 11, 1),
(12, 12, 12, 0),
(13, 13, 13, 1),
(14, 14, 14, 1),
(15, 15, 15, 0),
(16, 16, 16, 1),
(17, 17, 17, 1),
(18, 18, 18, 0),
(19, 19, 19, 1),
(20, 20, 20, 1),
(21, 21, 21, 0),
(22, 22, 22, 1),
(23, 23, 23, 1),
(24, 24, 24, 0),
(25, 25, 25, 1),
(26, 26, 26, 1),
(27, 27, 27, 0),
(28, 28, 28, 1),
(29, 29, 29, 1),
(30, 30, 30, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio`
--

CREATE TABLE `viaggio` (
  `idViaggio` int(10) NOT NULL,
  `cittaPartenza` varchar(30) NOT NULL,
  `cittaDestinazione` varchar(30) NOT NULL,
  `data` date NOT NULL,
  `ora` time NOT NULL,
  `contributoEconomico` int(10) NOT NULL,
  `tempoStimato` time NOT NULL,
  `prenotazioniAperte` tinyint(1) NOT NULL DEFAULT 1,
  `opzioni` varchar(50) NOT NULL,
  `idAutista` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `viaggio`
--

INSERT INTO `viaggio` (`idViaggio`, `cittaPartenza`, `cittaDestinazione`, `data`, `ora`, `contributoEconomico`, `tempoStimato`, `prenotazioniAperte`, `opzioni`, `idAutista`) VALUES
(1, 'Milano', 'Roma', '2026-03-01', '08:00:00', 30, '06:00:00', 1, 'No fumo', 1),
(2, 'Roma', 'Milano', '2026-03-02', '09:00:00', 30, '06:00:00', 1, 'Bagaglio incluso', 2),
(3, 'Torino', 'Bologna', '2026-03-03', '07:30:00', 20, '03:00:00', 1, 'WiFi', 3),
(4, 'Bologna', 'Firenze', '2026-03-04', '10:00:00', 15, '02:00:00', 1, 'Standard', 4),
(5, 'Firenze', 'Roma', '2026-03-05', '11:00:00', 18, '03:00:00', 1, 'No animali', 5),
(6, 'Napoli', 'Bari', '2026-03-06', '06:30:00', 25, '03:30:00', 1, 'Standard', 6),
(7, 'Genova', 'Milano', '2026-03-07', '08:15:00', 22, '02:30:00', 1, 'Comfort', 7),
(8, 'Verona', 'Venezia', '2026-03-08', '09:45:00', 12, '01:30:00', 1, 'Standard', 8),
(9, 'Roma', 'Napoli', '2026-03-09', '14:00:00', 18, '02:30:00', 1, 'No fumo', 9),
(10, 'Milano', 'Torino', '2026-03-10', '16:00:00', 15, '01:30:00', 1, 'Standard', 10),
(11, 'Bari', 'Napoli', '2026-03-11', '07:00:00', 25, '03:30:00', 1, 'Standard', 11),
(12, 'Firenze', 'Bologna', '2026-03-12', '13:00:00', 15, '02:00:00', 1, 'Standard', 12),
(13, 'Venezia', 'Verona', '2026-03-13', '12:00:00', 12, '01:30:00', 1, 'Standard', 13),
(14, 'Milano', 'Genova', '2026-03-14', '15:00:00', 20, '02:30:00', 1, 'Standard', 14),
(15, 'Roma', 'Firenze', '2026-03-15', '10:00:00', 19, '03:00:00', 1, 'Standard', 15),
(16, 'Torino', 'Milano', '2026-03-16', '08:00:00', 15, '01:30:00', 1, 'Standard', 16),
(17, 'Napoli', 'Roma', '2026-03-17', '09:00:00', 18, '02:30:00', 1, 'Standard', 17),
(18, 'Bologna', 'Torino', '2026-03-18', '07:45:00', 20, '03:00:00', 1, 'Standard', 18),
(19, 'Genova', 'Firenze', '2026-03-19', '06:30:00', 25, '03:30:00', 1, 'Standard', 19),
(20, 'Verona', 'Milano', '2026-03-20', '11:00:00', 22, '02:30:00', 1, 'Standard', 20),
(21, 'Roma', 'Bari', '2026-03-21', '08:00:00', 28, '04:00:00', 1, 'Standard', 21),
(22, 'Milano', 'Roma', '2026-03-22', '12:00:00', 30, '06:00:00', 1, 'Standard', 22),
(23, 'Torino', 'Genova', '2026-03-23', '14:00:00', 18, '02:00:00', 1, 'Standard', 23),
(24, 'Firenze', 'Napoli', '2026-03-24', '09:30:00', 26, '04:30:00', 1, 'Standard', 24),
(25, 'Bari', 'Roma', '2026-03-25', '10:30:00', 28, '04:00:00', 1, 'Standard', 25),
(26, 'Venezia', 'Bologna', '2026-03-26', '13:00:00', 20, '02:00:00', 1, 'Standard', 26),
(27, 'Napoli', 'Milano', '2026-03-27', '07:00:00', 35, '06:30:00', 1, 'Standard', 27),
(28, 'Roma', 'Torino', '2026-03-28', '15:00:00', 32, '05:30:00', 1, 'Standard', 28),
(29, 'Genova', 'Roma', '2026-03-29', '06:00:00', 30, '05:00:00', 1, 'Standard', 29),
(30, 'Milano', 'Bari', '2026-03-30', '08:30:00', 35, '07:00:00', 1, 'Standard', 30);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `autista`
--
ALTER TABLE `autista`
  ADD PRIMARY KEY (`idAutista`);

--
-- Indici per le tabelle `feedbackaut`
--
ALTER TABLE `feedbackaut`
  ADD PRIMARY KEY (`idFeedback`),
  ADD KEY `feedbacka_ibfk_1` (`idAutista`),
  ADD KEY `feedbacka_ibfk_2` (`idPasseggero`);

--
-- Indici per le tabelle `feedbackpas`
--
ALTER TABLE `feedbackpas`
  ADD PRIMARY KEY (`idFeedback`),
  ADD KEY `feedbackp_ibfk_1` (`idAutista`),
  ADD KEY `feedbackp_ibfk_2` (`idPasseggero`);

--
-- Indici per le tabelle `passeggero`
--
ALTER TABLE `passeggero`
  ADD PRIMARY KEY (`idPasseggero`);

--
-- Indici per le tabelle `richiesta`
--
ALTER TABLE `richiesta`
  ADD PRIMARY KEY (`idRichiesta`),
  ADD KEY `richiesta_ibfk_1` (`idPasseggero`),
  ADD KEY `richiesta_ibfk_2` (`idViaggio`);

--
-- Indici per le tabelle `viaggio`
--
ALTER TABLE `viaggio`
  ADD PRIMARY KEY (`idViaggio`),
  ADD KEY `viaggio_ibfk_1` (`idAutista`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `autista`
--
ALTER TABLE `autista`
  MODIFY `idAutista` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `feedbackaut`
--
ALTER TABLE `feedbackaut`
  MODIFY `idFeedback` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `feedbackpas`
--
ALTER TABLE `feedbackpas`
  MODIFY `idFeedback` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `passeggero`
--
ALTER TABLE `passeggero`
  MODIFY `idPasseggero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  MODIFY `idRichiesta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  MODIFY `idViaggio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `feedbackaut`
--
ALTER TABLE `feedbackaut`
  ADD CONSTRAINT `feedbacka_ibfk_1` FOREIGN KEY (`idAutista`) REFERENCES `autista` (`idAutista`),
  ADD CONSTRAINT `feedbacka_ibfk_2` FOREIGN KEY (`idPasseggero`) REFERENCES `passeggero` (`idPasseggero`);

--
-- Limiti per la tabella `feedbackpas`
--
ALTER TABLE `feedbackpas`
  ADD CONSTRAINT `feedbackp_ibfk_1` FOREIGN KEY (`idAutista`) REFERENCES `autista` (`idAutista`),
  ADD CONSTRAINT `feedbackp_ibfk_2` FOREIGN KEY (`idPasseggero`) REFERENCES `passeggero` (`idPasseggero`);

--
-- Limiti per la tabella `richiesta`
--
ALTER TABLE `richiesta`
  ADD CONSTRAINT `richiesta_ibfk_1` FOREIGN KEY (`idPasseggero`) REFERENCES `passeggero` (`idPasseggero`),
  ADD CONSTRAINT `richiesta_ibfk_2` FOREIGN KEY (`idViaggio`) REFERENCES `viaggio` (`idViaggio`);

--
-- Limiti per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  ADD CONSTRAINT `viaggio_ibfk_1` FOREIGN KEY (`idAutista`) REFERENCES `autista` (`idAutista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

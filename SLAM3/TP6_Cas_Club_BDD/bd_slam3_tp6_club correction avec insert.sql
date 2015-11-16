-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 09 Novembre 2015 à 09:04
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bd_slam3_tp6_club`
--

-- --------------------------------------------------------

--
-- Structure de la table `adversaire`
--

CREATE TABLE IF NOT EXISTS `adversaire` (
  `IDADV` int(11) NOT NULL,
  `NOMADV` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `VILLEADV` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`IDADV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `adversaire`
--

INSERT INTO `adversaire` (`IDADV`, `NOMADV`, `VILLEADV`) VALUES
(1, 'équipe1', 'Angers'),
(2, 'équipe2', 'Angers'),
(3, 'club rennes', 'Rennes');

-- --------------------------------------------------------

--
-- Structure de la table `attribuer`
--

CREATE TABLE IF NOT EXISTS `attribuer` (
  `CODEEQ` int(11) NOT NULL,
  `IDMEMBRE` int(11) NOT NULL,
  PRIMARY KEY (`CODEEQ`,`IDMEMBRE`),
  KEY `I_FK_ATTRIBUER_INDIVIDUEL` (`CODEEQ`),
  KEY `I_FK_ATTRIBUER_JOUEUR` (`IDMEMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `attribuer`
--

INSERT INTO `attribuer` (`CODEEQ`, `IDMEMBRE`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `besoin`
--

CREATE TABLE IF NOT EXISTS `besoin` (
  `IDNIVEAU` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `CODEEQ` int(11) NOT NULL,
  PRIMARY KEY (`IDNIVEAU`,`NUMERO`,`CODEEQ`),
  KEY `I_FK_BESOIN_MATCHS` (`IDNIVEAU`,`NUMERO`),
  KEY `I_FK_BESOIN_COLLECTIF` (`CODEEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `besoin`
--

INSERT INTO `besoin` (`IDNIVEAU`, `NUMERO`, `CODEEQ`) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 4, 1),
(1, 1, 2),
(1, 2, 2),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `bureau`
--

CREATE TABLE IF NOT EXISTS `bureau` (
  `IDMEMBRE` int(11) NOT NULL,
  `POSTE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`IDMEMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `bureau`
--

INSERT INTO `bureau` (`IDMEMBRE`, `POSTE`) VALUES
(3, 'president'),
(4, 'trésorier');

-- --------------------------------------------------------

--
-- Structure de la table `collectif`
--

CREATE TABLE IF NOT EXISTS `collectif` (
  `CODEEQ` int(11) NOT NULL,
  `QTE` int(11) DEFAULT NULL,
  `DESIGNATION` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTIF` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`CODEEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `collectif`
--

INSERT INTO `collectif` (`CODEEQ`, `QTE`, `DESIGNATION`, `DESCRIPTIF`) VALUES
(1, 5, 'ballon', 'ballon taille adulte'),
(2, 10, 'sac', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `concerner`
--

CREATE TABLE IF NOT EXISTS `concerner` (
  `IDNIVEAU` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `IDMEMBRE` int(11) NOT NULL,
  PRIMARY KEY (`IDNIVEAU`,`NUMERO`,`IDMEMBRE`),
  KEY `I_FK_CONCERNER_MATCHS` (`IDNIVEAU`,`NUMERO`),
  KEY `I_FK_CONCERNER_JOUEUR` (`IDMEMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `concerner`
--

INSERT INTO `concerner` (`IDNIVEAU`, `NUMERO`, `IDMEMBRE`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 1, 2),
(1, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `entraineur`
--

CREATE TABLE IF NOT EXISTS `entraineur` (
  `IDMEMBRE` int(11) NOT NULL,
  `NIVEAUDIPLOME` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`IDMEMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `individuel`
--

CREATE TABLE IF NOT EXISTS `individuel` (
  `CODEEQ` int(11) NOT NULL,
  `A_RENDRE` tinyint(1) DEFAULT NULL,
  `DESIGNATION` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTIF` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`CODEEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `individuel`
--

INSERT INTO `individuel` (`CODEEQ`, `A_RENDRE`, `DESIGNATION`, `DESCRIPTIF`) VALUES
(1, 1, 'maillot', 'maillot joueur terrain à domicile'),
(2, 0, 'short', 'short domicile'),
(3, 1, 'maillot extérieur', 'maillot match extérieur ');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
  `IDMEMBRE` int(11) NOT NULL,
  `NUMMAILLOT` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDMEMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `joueur`
--

INSERT INTO `joueur` (`IDMEMBRE`, `NUMMAILLOT`) VALUES
(1, 3),
(2, 1),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `licencie`
--

CREATE TABLE IF NOT EXISTS `licencie` (
  `IDMEMBRE` int(11) NOT NULL,
  `DATENAISS` date DEFAULT NULL,
  `NUMLICENCE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`IDMEMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `licencie`
--

INSERT INTO `licencie` (`IDMEMBRE`, `DATENAISS`, `NUMLICENCE`) VALUES
(1, '2015-07-12', 'NC23'),
(2, '2014-06-15', 'NC0123'),
(4, '2015-11-08', 'NC34');

-- --------------------------------------------------------

--
-- Structure de la table `matchs`
--

CREATE TABLE IF NOT EXISTS `matchs` (
  `IDNIVEAU` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `IDADV` int(11) NOT NULL,
  `IDSTADE` int(11) NOT NULL,
  `DATEMATCHS` date DEFAULT NULL,
  `HEUREMATCHS` time DEFAULT NULL,
  `A_DOMICILE` tinyint(1) DEFAULT NULL,
  `NBBUTSENCAISSES` int(11) DEFAULT NULL,
  `NBBUTSMARQUES` int(11) DEFAULT NULL,
  `JOURNEE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `TOUR` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `COUPE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`IDNIVEAU`,`NUMERO`),
  KEY `I_FK_MATCHS_ADVERSAIRE` (`IDADV`),
  KEY `I_FK_MATCHS_STADE` (`IDSTADE`),
  KEY `I_FK_MATCHS_NIVEAU` (`IDNIVEAU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `matchs`
--

INSERT INTO `matchs` (`IDNIVEAU`, `NUMERO`, `IDADV`, `IDSTADE`, `DATEMATCHS`, `HEUREMATCHS`, `A_DOMICILE`, `NBBUTSENCAISSES`, `NBBUTSMARQUES`, `JOURNEE`, `TOUR`, `COUPE`) VALUES
(1, 1, 1, 1, '2015-11-13', '18:00:00', 1, 1, 2, 'J1', NULL, NULL),
(1, 2, 2, 2, '2015-11-27', '20:00:00', 0, 1, 0, 'J3', NULL, NULL),
(1, 3, 1, 2, '2015-10-22', '15:00:00', 1, 0, 1, NULL, 'demi', 'anjou'),
(2, 1, 1, 1, '2015-11-18', '20:30:00', 1, 1, 1, 'J4', NULL, NULL),
(2, 4, 2, 1, '2015-10-12', '20:30:00', 1, 0, 2, 'J1', NULL, NULL),
(2, 5, 3, 1, '2015-11-01', '16:00:00', 1, 2, 0, NULL, 'demi', 'ouest');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE IF NOT EXISTS `membre` (
  `IDMEMBRE` int(11) NOT NULL,
  `NOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `PRENOM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ADRESSE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `TEL` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`IDMEMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`IDMEMBRE`, `NOM`, `PRENOM`, `ADRESSE`, `TEL`) VALUES
(1, 'Dupont', 'Robert', NULL, NULL),
(2, 'Rob', 'Roger', NULL, NULL),
(3, 'Guyon', 'Guy', NULL, NULL),
(4, 'Hub', 'Hubert', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `IDNIVEAU` int(11) NOT NULL,
  `LIBNIVEAU` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`IDNIVEAU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `niveau`
--

INSERT INTO `niveau` (`IDNIVEAU`, `LIBNIVEAU`) VALUES
(1, 'départemental'),
(2, 'régional');

-- --------------------------------------------------------

--
-- Structure de la table `stade`
--

CREATE TABLE IF NOT EXISTS `stade` (
  `IDSTADE` int(11) NOT NULL,
  `NOMSTADE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `VILLESTADE` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`IDSTADE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `stade`
--

INSERT INTO `stade` (`IDSTADE`, `NOMSTADE`, `VILLESTADE`) VALUES
(1, 'Jean Bouin', 'Angers'),
(2, 'La Beaujoire', 'Nantes');

-- --------------------------------------------------------


--
-- Contraintes pour la table `attribuer`
--
ALTER TABLE `attribuer`
  ADD CONSTRAINT `attribuer_ibfk_1` FOREIGN KEY (`CODEEQ`) REFERENCES `individuel` (`CODEEQ`),
  ADD CONSTRAINT `attribuer_ibfk_2` FOREIGN KEY (`IDMEMBRE`) REFERENCES `joueur` (`IDMEMBRE`);

--
-- Contraintes pour la table `besoin`
--
ALTER TABLE `besoin`
  ADD CONSTRAINT `besoin_ibfk_1` FOREIGN KEY (`IDNIVEAU`, `NUMERO`) REFERENCES `matchs` (`IDNIVEAU`, `NUMERO`),
  ADD CONSTRAINT `besoin_ibfk_2` FOREIGN KEY (`CODEEQ`) REFERENCES `collectif` (`CODEEQ`);

--
-- Contraintes pour la table `bureau`
--
ALTER TABLE `bureau`
  ADD CONSTRAINT `bureau_ibfk_1` FOREIGN KEY (`IDMEMBRE`) REFERENCES `membre` (`IDMEMBRE`);

--
-- Contraintes pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD CONSTRAINT `concerner_ibfk_1` FOREIGN KEY (`IDNIVEAU`, `NUMERO`) REFERENCES `matchs` (`IDNIVEAU`, `NUMERO`),
  ADD CONSTRAINT `concerner_ibfk_2` FOREIGN KEY (`IDMEMBRE`) REFERENCES `joueur` (`IDMEMBRE`);

--
-- Contraintes pour la table `entraineur`
--
ALTER TABLE `entraineur`
  ADD CONSTRAINT `entraineur_ibfk_1` FOREIGN KEY (`IDMEMBRE`) REFERENCES `licencie` (`IDMEMBRE`);

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD CONSTRAINT `joueur_ibfk_1` FOREIGN KEY (`IDMEMBRE`) REFERENCES `licencie` (`IDMEMBRE`);

--
-- Contraintes pour la table `licencie`
--
ALTER TABLE `licencie`
  ADD CONSTRAINT `licencie_ibfk_1` FOREIGN KEY (`IDMEMBRE`) REFERENCES `membre` (`IDMEMBRE`);

--
-- Contraintes pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD CONSTRAINT `matchs_ibfk_1` FOREIGN KEY (`IDADV`) REFERENCES `adversaire` (`IDADV`),
  ADD CONSTRAINT `matchs_ibfk_2` FOREIGN KEY (`IDSTADE`) REFERENCES `stade` (`IDSTADE`),
  ADD CONSTRAINT `matchs_ibfk_3` FOREIGN KEY (`IDNIVEAU`) REFERENCES `niveau` (`IDNIVEAU`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

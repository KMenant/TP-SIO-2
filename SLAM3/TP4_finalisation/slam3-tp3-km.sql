-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 07 Octobre 2015 à 23:17
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `slam3-tp3-km`
--

-- --------------------------------------------------------

--
-- Structure de la table `competu`
--

CREATE TABLE IF NOT EXISTS `competu` (
  `idComp` int(3) unsigned zerofill NOT NULL,
  `idEtudiant` int(4) NOT NULL,
  PRIMARY KEY (`idComp`,`idEtudiant`),
  KEY `idEtudiant` (`idEtudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `compinfo`
--

CREATE TABLE IF NOT EXISTS `compinfo` (
  `idComp` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idComp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `compinfo`
--

INSERT INTO `compinfo` (`idComp`, `Libelle`) VALUES
(001, 'HTML5'),
(002, 'CSS3'),
(003, 'PHP'),
(004, 'JavaScript');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8_bin NOT NULL,
  `departement` int(3) NOT NULL,
  `pays` varchar(50) COLLATE utf8_bin NOT NULL,
  `date_naiss` date NOT NULL,
  `sexe` tinyint(1) NOT NULL COMMENT '1 = male',
  `telephone` int(10) NOT NULL,
  `idEtudiant` int(4) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(50) COLLATE utf8_bin NOT NULL,
  `IdFormation` int(3) NOT NULL,
  `IdSpecialite` int(3) NOT NULL,
  PRIMARY KEY (`idEtudiant`),
  UNIQUE KEY `email` (`email`),
  KEY `IdFormation` (`IdFormation`,`IdSpecialite`),
  KEY `IdSpecialite` (`IdSpecialite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `IdFormation` int(3) NOT NULL AUTO_INCREMENT,
  `Intitule` varchar(50) COLLATE utf8_bin NOT NULL,
  `NbAnnee` int(2) NOT NULL,
  PRIMARY KEY (`IdFormation`),
  KEY `IdFormation` (`IdFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`IdFormation`, `Intitule`, `NbAnnee`) VALUES
(1, 'Baccalauréat', 0),
(2, 'BTS', 2),
(3, 'DUT', 2),
(4, 'Licence', 3),
(5, 'MASTER', 5),
(6, 'Autre formation', 0);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
  `IdSpecialite` int(3) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(50) COLLATE utf8_bin NOT NULL,
  `IdFormation` int(3) NOT NULL,
  PRIMARY KEY (`IdSpecialite`),
  KEY `IdFormation` (`IdFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=19 ;

--
-- Contenu de la table `specialite`
--

INSERT INTO `specialite` (`IdSpecialite`, `Libelle`, `IdFormation`) VALUES
(1, 'Bac S', 1),
(2, 'Bac STMG SIG', 1),
(3, 'Bac Pro SEN SIN', 1),
(4, 'Bac STI 2D', 1),
(5, 'BTS SIO SLAM', 2),
(6, 'BTS SIO SISR', 2),
(7, 'BTS IRIS', 2),
(8, 'DUT Informatique', 3),
(9, 'DUT GEA', 3),
(10, 'DUT Statistiques', 3),
(11, 'BTS CGO', 2),
(12, 'Licence Informatique', 4),
(13, 'Licence Pro SLAM', 4),
(14, 'Licence Pro SISR', 4),
(15, 'MASTER MIAGE', 5),
(16, 'MASTER Informatique décisionnelle', 5),
(17, 'MASTER Reseau et Telecoms', 5),
(18, 'pas de specialite', 6);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `competu`
--
ALTER TABLE `competu`
  ADD CONSTRAINT `competu_ibfk_2` FOREIGN KEY (`idComp`) REFERENCES `compinfo` (`idComp`),
  ADD CONSTRAINT `competu_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`idEtudiant`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`IdSpecialite`) REFERENCES `specialite` (`IdSpecialite`),
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`IdFormation`) REFERENCES `formation` (`IdFormation`);

--
-- Contraintes pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD CONSTRAINT `specialite_ibfk_1` FOREIGN KEY (`IdFormation`) REFERENCES `specialite` (`IdSpecialite`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

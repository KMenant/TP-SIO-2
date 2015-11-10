-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Lun 12 Octobre 2015 à 08:37
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bd_slam3_tp3`
--

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `IdFormation` int(11) NOT NULL,
  `Intitule` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  ` NbAnnee` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdFormation`),
  KEY `IdFormation` (`IdFormation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`IdFormation`, `Intitule`, ` NbAnnee`) VALUES
(1, 'Baccalauréat', 0),
(2, 'BTS', 2),
(3, 'DUT', 2),
(4, 'Licence', 3),
(5, 'MASTER', 5),
(6, 'Autre formation', 0),
(7, 'Tableur Excel avancé', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `IdPersonne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(250) COLLATE utf8_bin NOT NULL,
  `IdFormation` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPersonne`),
  KEY `IdFormation` (`IdFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`IdPersonne`, `nom`, `prenom`, `IdFormation`) VALUES
(3, 'Durand', 'Didier', 1),
(5, 'Guigon','Guy', 2),
(9, 'Julian','Léo', 2),
(10, 'Roby', 'Rosy',3),
(11, 'Soyon', 'Charlote',5),
(12, 'Florin','Clémentine', 1),
(13, 'Hubart','Bernard', 2);

-- --------------------------------------------------------

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `personne_ibfk_1` FOREIGN KEY (`IdFormation`) REFERENCES `formation` (`IdFormation`) ON DELETE CASCADE ON UPDATE CASCADE;




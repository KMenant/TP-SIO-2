-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 03 Novembre 2015 à 17:53
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `menant_slam3_tp6`
--

-- --------------------------------------------------------

--
-- Structure de la table `attribue`
--

CREATE TABLE IF NOT EXISTS `attribue` (
  `ID` int(11) NOT NULL,
  `ID_1` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`ID_1`),
  KEY `I_FK_ATTRIBUE_JOUEUR` (`ID`),
  KEY `I_FK_ATTRIBUE_INDIVIDUEL` (`ID_1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `collectif`
--

CREATE TABLE IF NOT EXISTS `collectif` (
  `ID` int(11) NOT NULL,
  `QUANTITE` int(11) DEFAULT NULL,
  `NOM` char(32) DEFAULT NULL,
  `DESCRIPTION` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dirigant`
--

CREATE TABLE IF NOT EXISTS `dirigant` (
  `ID_HER_1` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID_HER_1`),
  KEY `I_FK_DIRIGANT_POSTE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `entraineur`
--

CREATE TABLE IF NOT EXISTS `entraineur` (
  `ID` int(11) NOT NULL,
  `DIPLOME` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `equipe_adverse`
--

CREATE TABLE IF NOT EXISTS `equipe_adverse` (
  `ID` int(11) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `individuel`
--

CREATE TABLE IF NOT EXISTS `individuel` (
  `ID` int(11) NOT NULL,
  `RENDRE` tinyint(4) DEFAULT NULL,
  `NOM` char(32) DEFAULT NULL,
  `DESCRIPTION` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joue`
--

CREATE TABLE IF NOT EXISTS `joue` (
  `ID_1` int(11) NOT NULL,
  `ID_REL_2` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID_1`,`ID_REL_2`,`ID`),
  KEY `I_FK_JOUE_JOUEUR` (`ID_1`),
  KEY `I_FK_JOUE_MATCHS` (`ID_REL_2`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE IF NOT EXISTS `joueur` (
  `ID` int(11) NOT NULL,
  `NUM_MAILLOT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `licencie`
--

CREATE TABLE IF NOT EXISTS `licencie` (
  `ID` int(11) NOT NULL,
  `DATE_NAISSANCE` date DEFAULT NULL,
  `NUM_LICENCE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `matchs`
--

CREATE TABLE IF NOT EXISTS `matchs` (
  `ID_REL_2` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `ID_REL_3` int(11) NOT NULL,
  `ID_REL_5` int(11) NOT NULL,
  `ID_HER_3` int(11) DEFAULT NULL,
  `DATEM` date DEFAULT NULL,
  `HEURE` time DEFAULT NULL,
  `DOMICILE` tinyint(4) DEFAULT NULL,
  `NBBUTENCAISSE` int(11) DEFAULT NULL,
  `NBBUTMARQUE` int(11) DEFAULT NULL,
  `JOUR` date DEFAULT NULL,
  `COUPE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_REL_2`,`ID`),
  KEY `I_FK_MATCHS_NIVEAU` (`ID_REL_2`),
  KEY `I_FK_MATCHS_STADE` (`ID_REL_3`),
  KEY `I_FK_MATCHS_EQUIPE_ADVERSE` (`ID_REL_5`),
  KEY `I_FK_COUPES_TOUR_2` (`ID_HER_3`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE IF NOT EXISTS `membre` (
  `ID` int(11) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  `ADRESSE` char(32) DEFAULT NULL,
  `TEL` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `ID` int(11) NOT NULL,
  `INTITULE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE IF NOT EXISTS `poste` (
  `ID` int(11) NOT NULL,
  `POSTE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rel_4`
--

CREATE TABLE IF NOT EXISTS `rel_4` (
  `ID_1` int(11) NOT NULL,
  `ID_REL_2` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID_1`,`ID_REL_2`,`ID`),
  KEY `I_FK_REL_4_COLLECTIF` (`ID_1`),
  KEY `I_FK_REL_4_MATCHS` (`ID_REL_2`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `stade`
--

CREATE TABLE IF NOT EXISTS `stade` (
  `ID` int(11) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tour`
--

CREATE TABLE IF NOT EXISTS `tour` (
  `ID` int(11) NOT NULL,
  `TOUR` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_dirigant`
--
CREATE TABLE IF NOT EXISTS `v_dirigant` (
`id` int(11)
,`nom` char(32)
,`prenom` char(32)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_equipement_coll`
--
CREATE TABLE IF NOT EXISTS `v_equipement_coll` (
`id` int(11)
,`nom` char(32)
,`description` char(32)
,`quantite` int(11)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_equipement_indiv`
--
CREATE TABLE IF NOT EXISTS `v_equipement_indiv` (
`id` int(11)
,`nom` char(32)
,`description` char(32)
,`quantite` tinyint(4)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_joueurs`
--
CREATE TABLE IF NOT EXISTS `v_joueurs` (
`id` int(11)
,`nom` char(32)
,`prenom` char(32)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_licencie`
--
CREATE TABLE IF NOT EXISTS `v_licencie` (
`id` int(11)
,`nom` char(32)
,`prenom` char(32)
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_membre`
--
CREATE TABLE IF NOT EXISTS `v_membre` (
`id` int(11)
,`nom` char(32)
,`prenom` char(32)
);
-- --------------------------------------------------------

--
-- Structure de la vue `v_dirigant`
--
DROP TABLE IF EXISTS `v_dirigant`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dirigant` AS select `membre`.`ID` AS `id`,`membre`.`NOM` AS `nom`,`membre`.`PRENOM` AS `prenom` from `membre` where (`membre`.`ID` = (select `dirigant`.`ID` from `dirigant`));

-- --------------------------------------------------------

--
-- Structure de la vue `v_equipement_coll`
--
DROP TABLE IF EXISTS `v_equipement_coll`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_equipement_coll` AS select `collectif`.`ID` AS `id`,`collectif`.`NOM` AS `nom`,`collectif`.`DESCRIPTION` AS `description`,`collectif`.`QUANTITE` AS `quantite` from `collectif`;

-- --------------------------------------------------------

--
-- Structure de la vue `v_equipement_indiv`
--
DROP TABLE IF EXISTS `v_equipement_indiv`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_equipement_indiv` AS select `individuel`.`ID` AS `id`,`individuel`.`NOM` AS `nom`,`individuel`.`DESCRIPTION` AS `description`,`individuel`.`RENDRE` AS `quantite` from `individuel`;

-- --------------------------------------------------------

--
-- Structure de la vue `v_joueurs`
--
DROP TABLE IF EXISTS `v_joueurs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_joueurs` AS select `membre`.`ID` AS `id`,`membre`.`NOM` AS `nom`,`membre`.`PRENOM` AS `prenom` from `membre` where (`membre`.`ID` = (select `joue`.`ID_1` from `joue`));

-- --------------------------------------------------------

--
-- Structure de la vue `v_licencie`
--
DROP TABLE IF EXISTS `v_licencie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_licencie` AS select `membre`.`ID` AS `id`,`membre`.`NOM` AS `nom`,`membre`.`PRENOM` AS `prenom` from `membre` where (`membre`.`ID` = (select `licencie`.`ID` from `licencie`));

-- --------------------------------------------------------

--
-- Structure de la vue `v_membre`
--
DROP TABLE IF EXISTS `v_membre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_membre` AS select `membre`.`ID` AS `id`,`membre`.`NOM` AS `nom`,`membre`.`PRENOM` AS `prenom` from `membre`;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `attribue`
--
ALTER TABLE `attribue`
  ADD CONSTRAINT `attribue_ibfk_2` FOREIGN KEY (`ID_1`) REFERENCES `individuel` (`ID`),
  ADD CONSTRAINT `attribue_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `joueur` (`ID`);

--
-- Contraintes pour la table `dirigant`
--
ALTER TABLE `dirigant`
  ADD CONSTRAINT `dirigant_ibfk_2` FOREIGN KEY (`ID_HER_1`) REFERENCES `membre` (`ID`),
  ADD CONSTRAINT `dirigant_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `poste` (`ID`);

--
-- Contraintes pour la table `entraineur`
--
ALTER TABLE `entraineur`
  ADD CONSTRAINT `entraineur_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `licencie` (`ID`);

--
-- Contraintes pour la table `joue`
--
ALTER TABLE `joue`
  ADD CONSTRAINT `joue_ibfk_2` FOREIGN KEY (`ID_REL_2`, `ID`) REFERENCES `matchs` (`ID_REL_2`, `ID`),
  ADD CONSTRAINT `joue_ibfk_1` FOREIGN KEY (`ID_1`) REFERENCES `joueur` (`ID`);

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD CONSTRAINT `joueur_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `licencie` (`ID`);

--
-- Contraintes pour la table `licencie`
--
ALTER TABLE `licencie`
  ADD CONSTRAINT `licencie_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `membre` (`ID`);

--
-- Contraintes pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD CONSTRAINT `matchs_ibfk_4` FOREIGN KEY (`ID_HER_3`) REFERENCES `tour` (`ID`),
  ADD CONSTRAINT `matchs_ibfk_1` FOREIGN KEY (`ID_REL_2`) REFERENCES `niveau` (`ID`),
  ADD CONSTRAINT `matchs_ibfk_2` FOREIGN KEY (`ID_REL_3`) REFERENCES `stade` (`ID`),
  ADD CONSTRAINT `matchs_ibfk_3` FOREIGN KEY (`ID_REL_5`) REFERENCES `equipe_adverse` (`ID`);

--
-- Contraintes pour la table `rel_4`
--
ALTER TABLE `rel_4`
  ADD CONSTRAINT `rel_4_ibfk_2` FOREIGN KEY (`ID_REL_2`, `ID`) REFERENCES `matchs` (`ID_REL_2`, `ID`),
  ADD CONSTRAINT `rel_4_ibfk_1` FOREIGN KEY (`ID_1`) REFERENCES `collectif` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

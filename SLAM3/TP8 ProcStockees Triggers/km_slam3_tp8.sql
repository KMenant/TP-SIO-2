-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 15 Décembre 2015 à 17:57
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `km_slam3_tp8`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Caracteristique_Auteur`(IN `titre` CHAR(32))
BEGIN
	SELECT *
	FROM auteur as a
	INNER JOIN ecrire as e ON a.CODEAUTEUR = e.CODEAUTEUR
	INNER JOIN livre as l ON e.CODELIVRE = l.CODELIVRE
	WHERE l.TITRE = titre;
END$$

--
-- Fonctions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `Junior_Autorise`(`id_junior` INT, `id_type` INT) RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE rep VARCHAR(50);

	IF EXISTS (SELECT * FROM adherent_junior as a WHERE CODEADHERENT = id_junior AND TOUSTYPES = 0)
	THEN
    	IF EXISTS (SELECT * FROM droit_junior WHERE CODEADHERENT = id_junior AND IDTYPE = id_type)
        THEN
        	SET rep = "Oui, il est autorisé";
    	ELSE
        	SET rep = "Non, il n'est pas autorisé";
		END IF;
    ELSE
    	IF EXISTS (SELECT * FROM adherent_junior as a WHERE CODEADHERENT = id_junior AND TOUSTYPES = 1)
        THEN
        	SET rep = "Oui, l'adherent peut emprunter tous types de livres";
		ELSE
        	SET rep = "Erreur";        	
        END IF;
    END IF;
    
	RETURN rep;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE IF NOT EXISTS `adherent` (
  `CODEADHERENT` int(11) NOT NULL,
  `NOMADHERENT` char(32) DEFAULT NULL,
  `PRENOMADHERENT` char(32) DEFAULT NULL,
  `DATENAISSANCE` date DEFAULT NULL,
  PRIMARY KEY (`CODEADHERENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adherent`
--

INSERT INTO `adherent` (`CODEADHERENT`, `NOMADHERENT`, `PRENOMADHERENT`, `DATENAISSANCE`) VALUES
(1, 'J1 nom', 'J1 Prenom', NULL),
(2, 'J2 N', 'J2 P', NULL),
(3, 'A1 N', 'A1 P', NULL),
(4, 'A2 N', 'A2 P', NULL),
(5, 'J3 N', 'J3 P', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `adherent_adulte`
--

CREATE TABLE IF NOT EXISTS `adherent_adulte` (
  `CODEADHERENT` int(11) NOT NULL,
  `CENTREINTERET` char(32) DEFAULT NULL,
  `EMAIL` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODEADHERENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `adherent_junior`
--

CREATE TABLE IF NOT EXISTS `adherent_junior` (
  `CODEADHERENT` int(11) NOT NULL,
  `TOUSTYPES` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CODEADHERENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adherent_junior`
--

INSERT INTO `adherent_junior` (`CODEADHERENT`, `TOUSTYPES`) VALUES
(1, 1),
(2, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `CODEAUTEUR` int(11) NOT NULL,
  `NOMAUTEUR` char(32) DEFAULT NULL,
  `PRENOMAUTEUR` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODEAUTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`CODEAUTEUR`, `NOMAUTEUR`, `PRENOMAUTEUR`) VALUES
(0, 'TestAR nom', 'TestAR prenom'),
(1, 'Camus', 'Albert');

-- --------------------------------------------------------

--
-- Structure de la table `droit_junior`
--

CREATE TABLE IF NOT EXISTS `droit_junior` (
  `CODEADHERENT` int(11) NOT NULL,
  `IDTYPE` int(11) NOT NULL,
  PRIMARY KEY (`CODEADHERENT`,`IDTYPE`),
  KEY `I_FK_DROIT_JUNIOR_ADHERENT_JUNIOR` (`CODEADHERENT`),
  KEY `I_FK_DROIT_JUNIOR_TYPE_LIVRE` (`IDTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `droit_junior`
--

INSERT INTO `droit_junior` (`CODEADHERENT`, `IDTYPE`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(5, 6);

-- --------------------------------------------------------

--
-- Structure de la table `ecrire`
--

CREATE TABLE IF NOT EXISTS `ecrire` (
  `CODELIVRE` int(11) NOT NULL,
  `CODEAUTEUR` int(11) NOT NULL,
  PRIMARY KEY (`CODELIVRE`,`CODEAUTEUR`),
  KEY `I_FK_ECRIRE_LIVRE` (`CODELIVRE`),
  KEY `I_FK_ECRIRE_AUTEUR` (`CODEAUTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ecrire`
--

INSERT INTO `ecrire` (`CODELIVRE`, `CODEAUTEUR`) VALUES
(1, 0),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE IF NOT EXISTS `emprunter` (
  `CODELIVRE` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `CODEADHERENT` int(11) NOT NULL,
  `DATEEMPRUNT` date NOT NULL,
  `DATERETOUR` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODELIVRE`,`NUMERO`,`CODEADHERENT`,`DATEEMPRUNT`),
  KEY `I_FK_EMPRUNTER_EXEMPLAIRE` (`CODELIVRE`,`NUMERO`),
  KEY `I_FK_EMPRUNTER_ADHERENT` (`CODEADHERENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

CREATE TABLE IF NOT EXISTS `exemplaire` (
  `CODELIVRE` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `DATEACHAT` date DEFAULT NULL,
  PRIMARY KEY (`CODELIVRE`,`NUMERO`),
  KEY `I_FK_EXEMPLAIRE_LIVRE` (`CODELIVRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `CODELIVRE` int(11) NOT NULL,
  `IDTYPE` int(11) NOT NULL,
  `TITRE` char(32) DEFAULT NULL,
  `GENRE` char(32) DEFAULT NULL,
  `DATEEDITION` date DEFAULT NULL,
  PRIMARY KEY (`CODELIVRE`),
  KEY `I_FK_LIVRE_TYPE_LIVRE` (`IDTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`CODELIVRE`, `IDTYPE`, `TITRE`, `GENRE`, `DATEEDITION`) VALUES
(1, 3, 'Test Roman', NULL, '2002-12-01'),
(2, 3, 'Etranger', NULL, NULL),
(3, 1, 'Death Note', 'Manga', '2010-10-20'),
(4, 4, 'Documentaire', NULL, NULL),
(5, 6, 'Aventure', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_livre`
--

CREATE TABLE IF NOT EXISTS `type_livre` (
  `IDTYPE` int(11) NOT NULL,
  `LIBELLET` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_livre`
--

INSERT INTO `type_livre` (`IDTYPE`, `LIBELLET`) VALUES
(1, 'BD Adulte'),
(2, 'BD Enfant'),
(3, 'Roman'),
(4, 'Documentaire'),
(5, 'Magasine'),
(6, 'Aventure');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_livre_typeroman`
--
CREATE TABLE IF NOT EXISTS `v_livre_typeroman` (
`TITRE` char(32)
);
-- --------------------------------------------------------

--
-- Structure de la vue `v_livre_typeroman`
--
DROP TABLE IF EXISTS `v_livre_typeroman`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_livre_typeroman` AS select `l`.`TITRE` AS `TITRE` from (`livre` `l` join `type_livre` `tl` on((`l`.`IDTYPE` = `tl`.`IDTYPE`))) where (`tl`.`LIBELLET` = 'Roman');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `adherent_adulte`
--
ALTER TABLE `adherent_adulte`
  ADD CONSTRAINT `adherent_adulte_ibfk_1` FOREIGN KEY (`CODEADHERENT`) REFERENCES `adherent` (`CODEADHERENT`);

--
-- Contraintes pour la table `adherent_junior`
--
ALTER TABLE `adherent_junior`
  ADD CONSTRAINT `adherent_junior_ibfk_1` FOREIGN KEY (`CODEADHERENT`) REFERENCES `adherent` (`CODEADHERENT`);

--
-- Contraintes pour la table `droit_junior`
--
ALTER TABLE `droit_junior`
  ADD CONSTRAINT `droit_junior_ibfk_2` FOREIGN KEY (`IDTYPE`) REFERENCES `type_livre` (`IDTYPE`),
  ADD CONSTRAINT `droit_junior_ibfk_1` FOREIGN KEY (`CODEADHERENT`) REFERENCES `adherent_junior` (`CODEADHERENT`);

--
-- Contraintes pour la table `ecrire`
--
ALTER TABLE `ecrire`
  ADD CONSTRAINT `ecrire_ibfk_2` FOREIGN KEY (`CODEAUTEUR`) REFERENCES `auteur` (`CODEAUTEUR`),
  ADD CONSTRAINT `ecrire_ibfk_1` FOREIGN KEY (`CODELIVRE`) REFERENCES `livre` (`CODELIVRE`);

--
-- Contraintes pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD CONSTRAINT `emprunter_ibfk_2` FOREIGN KEY (`CODEADHERENT`) REFERENCES `adherent` (`CODEADHERENT`),
  ADD CONSTRAINT `emprunter_ibfk_1` FOREIGN KEY (`CODELIVRE`, `NUMERO`) REFERENCES `exemplaire` (`CODELIVRE`, `NUMERO`);

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `exemplaire_ibfk_1` FOREIGN KEY (`CODELIVRE`) REFERENCES `livre` (`CODELIVRE`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`IDTYPE`) REFERENCES `type_livre` (`IDTYPE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

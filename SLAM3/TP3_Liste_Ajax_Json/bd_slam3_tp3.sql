

INSERT INTO `formation` (`IdFormation`, `Intitule`, `NbAnnee`) VALUES
(1, 'Baccalauréat', 0),
(2, 'BTS', 2),
(3, 'DUT', 2),
(4, 'Licence', 3),
(5, 'MASTER', 5),
(6, 'Autre formation', 0);



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

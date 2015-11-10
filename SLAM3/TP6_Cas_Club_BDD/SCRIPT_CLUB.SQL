DROP DATABASE IF EXISTS MLR3;

CREATE DATABASE IF NOT EXISTS MLR3;
USE MLR3;
# -----------------------------------------------------------------------------
#       TABLE : INDIVIDUEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INDIVIDUEL
 (
   ID INTEGER NOT NULL  ,
   RENDRE TINYINT NULL  ,
   NOM CHAR (32) NULL  ,
   DESCRIPTION CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MEMBRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEMBRE
 (
   ID INTEGER NOT NULL  ,
   NOM CHAR (32) NULL  ,
   PRENOM CHAR (32) NULL  ,
   ADRESSE CHAR (32) NULL  ,
   TEL CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : JOUEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS JOUEUR
 (
   ID INTEGER NOT NULL  ,
   NUM_MAILLOT INTEGER NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ENTRAINEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENTRAINEUR
 (
   ID INTEGER NOT NULL  ,
   DIPLOME CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : STADE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STADE
 (
   ID INTEGER NOT NULL  ,
   NOM CHAR (32) NULL  ,
   VILLE CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : LICENCIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LICENCIE
 (
   ID INTEGER NOT NULL  ,
   DATE_NAISSANCE DATE NULL  ,
   NUM_LICENCE INTEGER NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : POSTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS POSTE
 (
   ID INTEGER NOT NULL  ,
   POSTE CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : COLLECTIF
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COLLECTIF
 (
   ID INTEGER NOT NULL  ,
   QUANTITE INTEGER NULL  ,
   NOM CHAR (32) NULL  ,
   DESCRIPTION CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : NIVEAU
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NIVEAU
 (
   ID INTEGER NOT NULL  ,
   INTITULE CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MATCHS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MATCHS
 (
   ID_REL_2 INTEGER NOT NULL  ,
   ID INTEGER NOT NULL  ,
   ID_REL_3 INTEGER NOT NULL  ,
   ID_REL_5 INTEGER NOT NULL  ,
   ID_HER_3 INTEGER NULL  ,
   DATEM DATE NULL  ,
   HEURE TIME NULL  ,
   DOMICILE TINYINT NULL  ,
   NBBUTENCAISSE INTEGER NULL  ,
   NBBUTMARQUE INTEGER NULL  ,
   JOUR DATE NULL  ,
   COUPE CHAR (32) NULL  
   , PRIMARY KEY (ID_REL_2,ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MATCHS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MATCHS_NIVEAU
     ON MATCHS (ID_REL_2 ASC);

CREATE  INDEX I_FK_MATCHS_STADE
     ON MATCHS (ID_REL_3 ASC);

CREATE  INDEX I_FK_MATCHS_EQUIPE_ADVERSE
     ON MATCHS (ID_REL_5 ASC);

CREATE  INDEX I_FK_COUPES_TOUR_2
     ON MATCHS (ID_HER_3 ASC);

# -----------------------------------------------------------------------------
#       TABLE : EQUIPE_ADVERSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EQUIPE_ADVERSE
 (
   ID INTEGER NOT NULL  ,
   NOM CHAR (32) NULL  ,
   VILLE CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TOUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TOUR
 (
   ID INTEGER NOT NULL  ,
   TOUR CHAR (32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : DIRIGANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DIRIGANT
 (
   ID_HER_1 INTEGER NOT NULL  ,
   ID INTEGER NOT NULL  
   , PRIMARY KEY (ID_HER_1) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DIRIGANT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DIRIGANT_POSTE
     ON DIRIGANT (ID ASC);

# -----------------------------------------------------------------------------
#       TABLE : ATTRIBUE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ATTRIBUE
 (
   ID INTEGER NOT NULL  ,
   ID_1 INTEGER NOT NULL  
   , PRIMARY KEY (ID,ID_1) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ATTRIBUE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ATTRIBUE_JOUEUR
     ON ATTRIBUE (ID ASC);

CREATE  INDEX I_FK_ATTRIBUE_INDIVIDUEL
     ON ATTRIBUE (ID_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : REL_4
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REL_4
 (
   ID_1 INTEGER NOT NULL  ,
   ID_REL_2 INTEGER NOT NULL  ,
   ID INTEGER NOT NULL  
   , PRIMARY KEY (ID_1,ID_REL_2,ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REL_4
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REL_4_COLLECTIF
     ON REL_4 (ID_1 ASC);

CREATE  INDEX I_FK_REL_4_MATCHS
     ON REL_4 (ID_REL_2 ASC,ID ASC);

# -----------------------------------------------------------------------------
#       TABLE : JOUE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS JOUE
 (
   ID_1 INTEGER NOT NULL  ,
   ID_REL_2 INTEGER NOT NULL  ,
   ID INTEGER NOT NULL  
   , PRIMARY KEY (ID_1,ID_REL_2,ID) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE JOUE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_JOUE_JOUEUR
     ON JOUE (ID_1 ASC);

CREATE  INDEX I_FK_JOUE_MATCHS
     ON JOUE (ID_REL_2 ASC,ID ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE JOUEUR 
  ADD FOREIGN KEY FK_JOUEUR_LICENCIE (ID)
      REFERENCES LICENCIE (ID) ;


ALTER TABLE ENTRAINEUR 
  ADD FOREIGN KEY FK_ENTRAINEUR_LICENCIE (ID)
      REFERENCES LICENCIE (ID) ;


ALTER TABLE LICENCIE 
  ADD FOREIGN KEY FK_LICENCIE_MEMBRE (ID)
      REFERENCES MEMBRE (ID) ;


ALTER TABLE MATCHS 
  ADD FOREIGN KEY FK_MATCHS_NIVEAU (ID_REL_2)
      REFERENCES NIVEAU (ID) ;


ALTER TABLE MATCHS 
  ADD FOREIGN KEY FK_MATCHS_STADE (ID_REL_3)
      REFERENCES STADE (ID) ;


ALTER TABLE MATCHS 
  ADD FOREIGN KEY FK_MATCHS_EQUIPE_ADVERSE (ID_REL_5)
      REFERENCES EQUIPE_ADVERSE (ID) ;


ALTER TABLE MATCHS 
  ADD FOREIGN KEY FK_COUPES_TOUR_2 (ID_HER_3)
      REFERENCES TOUR (ID) ;


ALTER TABLE DIRIGANT 
  ADD FOREIGN KEY FK_DIRIGANT_POSTE (ID)
      REFERENCES POSTE (ID) ;


ALTER TABLE DIRIGANT 
  ADD FOREIGN KEY FK_DIRIGANT_MEMBRE (ID_HER_1)
      REFERENCES MEMBRE (ID) ;


ALTER TABLE ATTRIBUE 
  ADD FOREIGN KEY FK_ATTRIBUE_JOUEUR (ID)
      REFERENCES JOUEUR (ID) ;


ALTER TABLE ATTRIBUE 
  ADD FOREIGN KEY FK_ATTRIBUE_INDIVIDUEL (ID_1)
      REFERENCES INDIVIDUEL (ID) ;


ALTER TABLE REL_4 
  ADD FOREIGN KEY FK_REL_4_COLLECTIF (ID_1)
      REFERENCES COLLECTIF (ID) ;


ALTER TABLE REL_4 
  ADD FOREIGN KEY FK_REL_4_MATCHS (ID_REL_2,ID)
      REFERENCES MATCHS (ID_REL_2,ID) ;


ALTER TABLE JOUE 
  ADD FOREIGN KEY FK_JOUE_JOUEUR (ID_1)
      REFERENCES JOUEUR (ID) ;


ALTER TABLE JOUE 
  ADD FOREIGN KEY FK_JOUE_MATCHS (ID_REL_2,ID)
      REFERENCES MATCHS (ID_REL_2,ID) ;


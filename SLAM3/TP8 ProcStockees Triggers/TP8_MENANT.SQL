DROP DATABASE IF EXISTS TP8_Menant;

CREATE DATABASE IF NOT EXISTS TP8_Menant;
USE TP8_Menant;
# -----------------------------------------------------------------------------
#       TABLE : AUTEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AUTEUR
 (
   CODEAUTEUR INTEGER NOT NULL  ,
   NOMAUTEUR CHAR (32) NULL  ,
   PRENOMAUTEUR CHAR (32) NULL  
   , PRIMARY KEY (CODEAUTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : LIVRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LIVRE
 (
   CODELIVRE INTEGER NOT NULL  ,
   IDTYPE INTEGER NOT NULL  ,
   TITRE CHAR (32) NULL  ,
   GENRE CHAR (32) NULL  ,
   DATEEDITION DATE NULL  
   , PRIMARY KEY (CODELIVRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE LIVRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_LIVRE_TYPE_LIVRE
     ON LIVRE (IDTYPE ASC);

# -----------------------------------------------------------------------------
#       TABLE : ADHERENT_ADULTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERENT_ADULTE
 (
   CODEADHERENT INTEGER NOT NULL  ,
   CENTREINTERET CHAR (32) NULL  ,
   EMAIL CHAR (32) NULL  
   , PRIMARY KEY (CODEADHERENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : EXEMPLAIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EXEMPLAIRE
 (
   CODELIVRE INTEGER NOT NULL  ,
   NUMERO INTEGER NOT NULL  ,
   DATEACHAT DATE NULL  
   , PRIMARY KEY (CODELIVRE,NUMERO) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EXEMPLAIRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EXEMPLAIRE_LIVRE
     ON EXEMPLAIRE (CODELIVRE ASC);

# -----------------------------------------------------------------------------
#       TABLE : TYPE_LIVRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE_LIVRE
 (
   IDTYPE INTEGER NOT NULL  ,
   LIBELLET CHAR (32) NULL  
   , PRIMARY KEY (IDTYPE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ADHERENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERENT
 (
   CODEADHERENT INTEGER NOT NULL  ,
   NOMADHERENT CHAR (32) NULL  ,
   PRENOMADHERENT CHAR (32) NULL  ,
   DATENAISSANCE DATE NULL  
   , PRIMARY KEY (CODEADHERENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ADHERENT_JUNIOR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERENT_JUNIOR
 (
   CODEADHERENT INTEGER NOT NULL  ,
   TOUSTYPES CHAR (32) NULL  
   , PRIMARY KEY (CODEADHERENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : DROIT_JUNIOR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DROIT_JUNIOR
 (
   CODEADHERENT INTEGER NOT NULL  ,
   IDTYPE INTEGER NOT NULL  
   , PRIMARY KEY (CODEADHERENT,IDTYPE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DROIT_JUNIOR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DROIT_JUNIOR_ADHERENT_JUNIOR
     ON DROIT_JUNIOR (CODEADHERENT ASC);

CREATE  INDEX I_FK_DROIT_JUNIOR_TYPE_LIVRE
     ON DROIT_JUNIOR (IDTYPE ASC);

# -----------------------------------------------------------------------------
#       TABLE : ECRIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ECRIRE
 (
   CODELIVRE INTEGER NOT NULL  ,
   CODEAUTEUR INTEGER NOT NULL  
   , PRIMARY KEY (CODELIVRE,CODEAUTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ECRIRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ECRIRE_LIVRE
     ON ECRIRE (CODELIVRE ASC);

CREATE  INDEX I_FK_ECRIRE_AUTEUR
     ON ECRIRE (CODEAUTEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : EMPRUNTER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EMPRUNTER
 (
   CODELIVRE INTEGER NOT NULL  ,
   NUMERO INTEGER NOT NULL  ,
   CODEADHERENT INTEGER NOT NULL  ,
   DATEEMPRUNT DATE NOT NULL  ,
   DATERETOUR CHAR (32) NULL  
   , PRIMARY KEY (CODELIVRE,NUMERO,CODEADHERENT,DATEEMPRUNT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EMPRUNTER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EMPRUNTER_EXEMPLAIRE
     ON EMPRUNTER (CODELIVRE ASC,NUMERO ASC);

CREATE  INDEX I_FK_EMPRUNTER_ADHERENT
     ON EMPRUNTER (CODEADHERENT ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE LIVRE 
  ADD FOREIGN KEY FK_LIVRE_TYPE_LIVRE (IDTYPE)
      REFERENCES TYPE_LIVRE (IDTYPE) ;


ALTER TABLE ADHERENT_ADULTE 
  ADD FOREIGN KEY FK_ADHERENT_ADULTE_ADHERENT (CODEADHERENT)
      REFERENCES ADHERENT (CODEADHERENT) ;


ALTER TABLE EXEMPLAIRE 
  ADD FOREIGN KEY FK_EXEMPLAIRE_LIVRE (CODELIVRE)
      REFERENCES LIVRE (CODELIVRE) ;


ALTER TABLE ADHERENT_JUNIOR 
  ADD FOREIGN KEY FK_ADHERENT_JUNIOR_ADHERENT (CODEADHERENT)
      REFERENCES ADHERENT (CODEADHERENT) ;


ALTER TABLE DROIT_JUNIOR 
  ADD FOREIGN KEY FK_DROIT_JUNIOR_ADHERENT_JUNIOR (CODEADHERENT)
      REFERENCES ADHERENT_JUNIOR (CODEADHERENT) ;


ALTER TABLE DROIT_JUNIOR 
  ADD FOREIGN KEY FK_DROIT_JUNIOR_TYPE_LIVRE (IDTYPE)
      REFERENCES TYPE_LIVRE (IDTYPE) ;


ALTER TABLE ECRIRE 
  ADD FOREIGN KEY FK_ECRIRE_LIVRE (CODELIVRE)
      REFERENCES LIVRE (CODELIVRE) ;


ALTER TABLE ECRIRE 
  ADD FOREIGN KEY FK_ECRIRE_AUTEUR (CODEAUTEUR)
      REFERENCES AUTEUR (CODEAUTEUR) ;


ALTER TABLE EMPRUNTER 
  ADD FOREIGN KEY FK_EMPRUNTER_EXEMPLAIRE (CODELIVRE,NUMERO)
      REFERENCES EXEMPLAIRE (CODELIVRE,NUMERO) ;


ALTER TABLE EMPRUNTER 
  ADD FOREIGN KEY FK_EMPRUNTER_ADHERENT (CODEADHERENT)
      REFERENCES ADHERENT (CODEADHERENT) ;


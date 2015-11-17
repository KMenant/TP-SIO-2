package com.example.menant.km_initiation;

import java.util.Date;

/**
 * Created by Frederique de ROBIEN on 08/09/2015.
 */
public abstract class Cours  {

    protected String intituleCours;
    protected Date dateCours;
    protected Integer heureCours;

/*CONSTRUCTEURS*/
    public Cours() {
    }
    public Cours(String i, Date d, Integer h) {
        intituleCours = i;
        dateCours = d ;
        heureCours = h ;
    }
 /*METHODES ABSTRAITES*/
    /*
    * Methode ajouterParticipant
    * verifier s il reste de la place dans ce cours
    * renvoyer vrai si l inscription a pu avoir lieu
    * faux sinon*/
    public abstract boolean ajouterParticipant(Participant unP) throws Exception;

    public abstract void supprimerParticipant(Participant unP);

    public abstract String toString();

    public abstract String listeDesParticipants();

    public abstract Date getDateCours() ;


}

package com.example.menant.km_initiation;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by Frederique de ROBIEN on 08/09/2015.
 */
public class CoursIndividuels extends Cours  {

    private Participant leMoniteur;
    private Participant unSeulParticipant;

    /*CONSTRUCTEURS*/
    public CoursIndividuels() {
    }

    public CoursIndividuels(String i, Date d, Integer h, Participant unM) {
        super(i, d, h);
        leMoniteur = unM;
    }
/*ACCESSEURS*/

    public Participant getLeMoniteur() {
        return leMoniteur;
    }
    public void setLeMoniteur(Participant p){leMoniteur=p;};

    public Participant getUnSeulParticipant() {
        return unSeulParticipant;
    }
    /*METHODES*/

    /**
     * Methode ajouterParticipant
     * verifier si le cours n'est pas encore affecté à un Participant
     *
     * @param unP Participant qui va s inscrire au cours
     * @return true si l inscription a pu avoir lieu
     */
    public boolean ajouterParticipant(Participant unP) throws Exception{
        boolean ret;
        if (unSeulParticipant == null) {
            unSeulParticipant = unP;
            ret = true;
        } else {
            ret = false;
            throw new Exception("Cours déjà complet !");
        }
        return ret;

    }

    public void supprimerParticipant(Participant unP) {
        if (unSeulParticipant != null && unSeulParticipant.toString().equalsIgnoreCase(unP.toString())) {
            unSeulParticipant = null;
        }
    }


    public String toString() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        StringBuilder sb = new StringBuilder("=>").append(intituleCours).append(" le");
        sb.append(sdf.format(getDateCours())).append(" a ").append(heureCours).append("h - maximum\n");
        sb.append("Moniteur : ").append(leMoniteur.toString()).append("\n");
        //if (unSeulParticipant != null) {
        //    sb.append("Participant : ").append(unSeulParticipant.toString()).append("\n");
        //}
        return sb.toString();
    }


    public String listeDesParticipants() {
        if (unSeulParticipant != null) {
            return unSeulParticipant.toString();
        } else {
            return "aucun participant affecté à ce cours";
        }
    }
    public void changerMoniteur(Participant nouveauMoniteur) {
        if (leMoniteur != null) {
            this.leMoniteur = nouveauMoniteur;
        }
    }
    public Date getDateCours() {
        return dateCours;
    }

}

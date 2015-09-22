package com.example.menant.projetkm_initiationjava;

import android.provider.Settings;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by menant on 21/09/2015.
 */
public class Cours {

    private String intituleCours;
    private Date dateCours;
    private Date heureDebutCours;
    private int nbMaxCours;
    private ArrayList<Participant> lesParticipantsInscrits;

    public Cours() {
    }

    public Cours(String intituleCours, Date dateCours, Date heureDebutCours, int nbMaxCours) {
        this.intituleCours = intituleCours;
        this.dateCours = dateCours;
        this.heureDebutCours = heureDebutCours;
        this.nbMaxCours = nbMaxCours;
        this.lesParticipantsInscrits = new ArrayList<Participant>();
    }

    public boolean ajouterParticipant(Participant unP){
        if(lesParticipantsInscrits.size()<nbMaxCours){
            lesParticipantsInscrits.add(unP);
            return true;
        }
        else
            return false;
    }

    public boolean supprimerParticipant(Participant unP){
        if(lesParticipantsInscrits.contains(unP)) {
            lesParticipantsInscrits.remove(unP);
            return true;
        }
        else
            return false;
    }

    public String listeDesParticipant(){
        StringBuilder liste = new StringBuilder("Les participants au cour sont : \n");
        for (Participant p : lesParticipantsInscrits){
            liste.append(p.getNomP()).append(" ");
            liste.append(p.getPrenomP()).append("\n ");
        }
        return liste.toString();
    }

    public ArrayList<Participant> TrouveParticipants(String unNomFamille){
        ArrayList<Participant> result = new ArrayList<Participant>();
        for (Participant p : lesParticipantsInscrits){
            if(p.getNomP().equalsIgnoreCase(unNomFamille))
                result.add(p);
        }
        return result;
    }

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder("Le cour s'appel ");
        sb.append(intituleCours).append(" et commence le ");
        sb.append(dateCours).append(" à ");
        sb.append(heureDebutCours).append(", il y a ");
        sb.append(nbMaxCours).append(" places maximum et ");
        sb.append(lesParticipantsInscrits.size()).append(" participants.\n");
        return sb.toString();
    }

    public ArrayList<Participant> getLesParticipantsInscrits(){
        return lesParticipantsInscrits;
    }

    public String getIntituleCours() {
        return intituleCours;
    }

    public Date getDateCours() {
        return dateCours;
    }

    public void setDateCours(Date dateCours) {
        this.dateCours = dateCours;
    }

    public Date getHeureDebutCours() {
        return heureDebutCours;
    }

    public void setHeureDebutCours(Date heureDebutCours) {
        this.heureDebutCours = heureDebutCours;
    }

    public int getNbMaxCours() {
        return nbMaxCours;
    }

    public void setNbMaxCours(int nbMaxCours) {
        if (nbMaxCours>this.nbMaxCours)
            this.nbMaxCours = nbMaxCours;
    }
}

package com.example.menant.projetkm_initiationjava;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by menant on 21/09/2015.
 */
public class CoursCollectifs extends Cours {

    private int nbMaxCours;
    private ArrayList<Participant> lesParticipantsInscrits;



    public CoursCollectifs(String intituleCours, int tarifHoraire, float dureeCour, Date dateCours, Date heureDebutCours, int nbMaxCours) {
        super(intituleCours, tarifHoraire, dureeCour, dateCours, heureDebutCours);
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

    public ArrayList<Participant> trouveParticipants(String unNomFamille){
        ArrayList<Participant> result = new ArrayList<Participant>();
        for (Participant p : lesParticipantsInscrits){
            if(p.getNomP().equalsIgnoreCase(unNomFamille))
                result.add(p);
        }
        return result;
    }

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder(super.toString());
        sb.append(", il y a ").append(nbMaxCours).append(" places maximum et ");
        sb.append(lesParticipantsInscrits.size()).append(" participants.\n");
        return sb.toString();
    }

    public ArrayList<Participant> getLesParticipantsInscrits(){
        return lesParticipantsInscrits;
    }

    public int getNbMaxCours() {
        return nbMaxCours;
    }

    public void setNbMaxCours(int nbMaxCours) {
        if (nbMaxCours>this.nbMaxCours)
            this.nbMaxCours = nbMaxCours;
    }
}

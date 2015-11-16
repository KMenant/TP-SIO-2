package com.example.menant.projetkm_initiationjava;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by menant on 21/09/2015.
 */
public class CoursIndividuels extends Cours {

    private Participant leParticipant;
    private Participant leMoniteur;

    public CoursIndividuels(String intituleCours, int tarifHoraire, float dureeCour, Date dateCours, Date heureDebutCours, Participant m) {
        super(intituleCours, tarifHoraire, dureeCour, dateCours, heureDebutCours);
        this.leParticipant = new Participant;
        this.leMoniteur = new Participant;
    }

    public boolean ajouterParticipant(Participant unP){
        if(leParticipant.isEmpty()){
            leParticipant.add(unP);
            return true;
        }
        else
            return false;
    }

    public boolean supprimerParticipant(Participant unP){
        if(leParticipant.contains(unP)) {
            leParticipant.remove(unP);
            return true;
        }
        else
            return false;
    }

    public String listeDesParticipant(){
        if(!leParticipant.isEmpty()) {
            StringBuilder liste = new StringBuilder("Le participant au cour est : \n");
            for (Participant p : leParticipant) {
                liste.append(p.getNomP()).append(" ");
                liste.append(p.getPrenomP()).append("\n ");
            }
            return liste.toString();
        }
        else return("Aucun participant inscrit");
    }

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder(super.toString());
        sb.append(heureDebutCours).append(". Le cour est ");
        if(leParticipant.isEmpty())
            sb.append("libre.");
        else {
            sb.append("occuper par ").append(leParticipant);
            sb.append(" avec le moniteur ").append(leMoniteur);
        }
        sb.append(heureDebutCours).append(" à ");
        return sb.toString();
    }

    public ArrayList<Participant> getLeParticipant(){
        return (leParticipant);
    }

    public ArrayList<Participant> getLeMoniteur(){
        return (leMoniteur);
    }
}

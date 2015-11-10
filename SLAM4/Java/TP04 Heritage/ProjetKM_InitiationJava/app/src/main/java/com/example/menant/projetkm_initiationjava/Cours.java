package com.example.menant.projetkm_initiationjava;

import android.provider.Settings;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by menant on 21/09/2015.
 */
public abstract class Cours {

    protected String intituleCours;
    protected int tarifHoraire;

    protected float dureeCour;
    protected Date dateCours;
    protected Date heureDebutCours;

    public Cours(String intituleCours, int tarifHoraire, float dureeCour, Date dateCours, Date heureDebutCours) {
        this.intituleCours = intituleCours;
        this.tarifHoraire = tarifHoraire;
        this.dureeCour = dureeCour;
        this.dateCours = dateCours;
        this.heureDebutCours = heureDebutCours;
    }

    public abstract boolean ajouterParticipant(Participant unP) ;

    public abstract boolean supprimerParticipant(Participant unP) ;

    public abstract String listeDesParticipant() ;



    @Override
    public  String toString() {
        StringBuilder sb = new StringBuilder("Le cour s'appelle ");
        sb.append(intituleCours).append(" et commence le ");
        sb.append(dateCours).append(" à ");
        sb.append(heureDebutCours);

        return sb.toString();



    };



    public String getIntituleCours() {
        return intituleCours;
    }

    public float getDureeCour() {
        return dureeCour;
    }

    public void setDureeCour(float dureeCour) {
        this.dureeCour = dureeCour;
    }

    public int getTarifHoraire() {
        return tarifHoraire;
    }

    public void setTarifHoraire(int tarifHoraire) {
        this.tarifHoraire = tarifHoraire;
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
}

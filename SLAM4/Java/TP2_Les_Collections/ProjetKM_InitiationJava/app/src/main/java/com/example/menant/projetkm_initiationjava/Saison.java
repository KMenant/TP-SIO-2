package com.example.menant.projetkm_initiationjava;

import android.provider.Settings;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by menant on 21/09/2015.
 */
public class Saison {

    private String intituleSaison;
    private Date dateDebutSaison;
    private Date dateFinSaison;
    private ArrayList<Cours> lesCours;

    public Saison() {
    }

    public Saison(String intituleSaison, Date dateDebutSaison, Date dateFinSaison) {
        this.intituleSaison = intituleSaison;
        this.dateDebutSaison = dateDebutSaison;
        this.dateFinSaison = dateFinSaison;
        this.lesCours = new ArrayList<Cours>();
    }

    public boolean ajouterCours(Cours unC){
        lesCours.add(unC);
        return true;
    }

    public boolean supprimerCours(Cours unC){
        if(lesCours.contains(unC)) {
            lesCours.remove(unC);
            return true;
        }
        else
            return false;
    }

    public String listeDesCours(){
        StringBuilder liste = new StringBuilder("Les Cours de la saison sont : \n");
        for (Cours c : lesCours){
            liste.append(c.getIntituleCours()).append("\n ");
        }
        return liste.toString();
    }

    public ArrayList<Cours> trouveCours(String unCour){
        ArrayList<Cours> result = new ArrayList<Cours>();
        for (Cours c : lesCours){
            if(c.getIntituleCours().equalsIgnoreCase(unCour))
                result.add(c);
        }
        return result;
    }

    public ArrayList<Cours> trouveCours(Date uneDateCour){
        ArrayList<Cours> result = new ArrayList<Cours>();
        for (Cours c : lesCours){
            if(c.getDateCours().equals(uneDateCour))
                result.add(c);
        }
        return result;
    }

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder("La saison ");
        sb.append(intituleSaison).append(" commence le ");
        sb.append(dateDebutSaison).append(" et fini le ");
        sb.append(dateFinSaison).append(", il y a ");
        sb.append(lesCours.size()).append(" cours.\n");
        return sb.toString();
    }

    public ArrayList<Cours> getLesCours(){
        return lesCours;
    }

    public String getIntituleSaison() {
        return intituleSaison;
    }

    public Date getDateDebutSaison() {
        return dateDebutSaison;
    }

    public void setdateDebutSaison(Date dateDebutSaison) {
        this.dateDebutSaison = dateDebutSaison;
    }

    public Date getdateFinSaison() {
        return dateFinSaison;
    }

    public void setdateFinSaison(Date dateFinSaison) {
        this.dateFinSaison = dateFinSaison;
    }
}

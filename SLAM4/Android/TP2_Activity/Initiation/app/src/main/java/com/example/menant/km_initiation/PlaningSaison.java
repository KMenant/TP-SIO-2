package com.example.menant.km_initiation;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

/**
 * Created by Frederique de ROBIEN on 08/09/2015.
 */
public class PlaningSaison implements Serializable {

    private Date dateDebutSaison;
    private Date dateFinSaison;
    private ArrayList<Cours> lesCoursSaison ;

    //region CONSTRUCTEUR
    public PlaningSaison(Date dd, Date df) {
        dateDebutSaison = dd;
        dateFinSaison = df;
        lesCoursSaison = new ArrayList<Cours>();
    }
    //endregion

    //region METHODES
    public  boolean ajouterCours(Cours unC){
        boolean ajoutOK = false ;
        //if (unC.getDateCours().after(dateDebutSaison) && unC.getDateCours().before(dateFinSaison) ){ pas valide sur les valeurs extrèmes
        if (unC.getDateCours().compareTo(dateDebutSaison)>=0 && unC.getDateCours().compareTo(dateFinSaison)<=0 ){
            ajoutOK = lesCoursSaison.add(unC);
        }
        return ajoutOK;
    }

    public  void supprimerCours(Cours unC){
        try {
            lesCoursSaison.remove(lesCoursSaison.indexOf(unC));
        }catch (IndexOutOfBoundsException ie){
            //passe ici si l'objet unC n'existe pas dans la collection
            ie.printStackTrace();
        }
    }


    public String listeDesCoursCollectifs(){

        StringBuilder sb = new StringBuilder("*****Cours COLLECTIFS******\n");
        Iterator<Cours> itC = lesCoursSaison.iterator();
        Cours unC;
        while (itC.hasNext()){
            unC = itC.next();
            if (unC instanceof CoursCollectifs){
                sb.append(unC.toString());
            }
        }
        return sb.toString();
    }
    public String listeDesCoursIndividuels(){

        StringBuilder sb = new StringBuilder("*****Cours INDIVIDUELS******\n");
        Iterator<Cours> itC = lesCoursSaison.iterator();
        Cours unC;
        while (itC.hasNext()){
            unC = itC.next();
            if (unC instanceof CoursIndividuels){
                sb.append(unC.toString());
            }
        }
        return sb.toString();
    }

    public String listeDesCours(){
        StringBuilder sb = new StringBuilder("*****TOUS LES COURS de la Saison******\n");
        sb.append(this.toString());
        sb.append(this.listeDesCoursCollectifs());
        sb.append(this.listeDesCoursIndividuels());
        return sb.toString();
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("\tDu ").append(dateDebutSaison);
        sb.append("au ").append(dateFinSaison).append("\n");
        return sb.toString();
    }

    public ArrayList<Cours> getLesCoursSaison() {
        return lesCoursSaison;
    }

    //enregion


}

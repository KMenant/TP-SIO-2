package com.example.menant.km_initiation;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Collections;
import java.util.Date;
import java.util.Iterator;


/**
 * Created by Frederique de ROBIEN on 08/09/2015.
 */
public class CoursCollectifs extends Cours implements Serializable {

    private byte nombreMax;
    private ArrayList<Participant> lesParticipantsInscrits ;

/*CONSTRUCTEURS*/
    public CoursCollectifs() {
    }

    public CoursCollectifs(String i, Date d, Integer h, byte nbMax) {
        intituleCours = i;
        dateCours = d ;
        heureCours = h ;
        nombreMax = nbMax;
        lesParticipantsInscrits = new ArrayList<Participant>();
    }

    /*
    * Methode ajouterParticipant
    * verifier s il reste de la place dans ce cours
    * renvoyer vrai si l inscription a pu avoir lieu
    * faux sinon*/
    public boolean ajouterParticipant(Participant unP) throws Exception{
        boolean ret;

        if (lesParticipantsInscrits.size() < nombreMax){
            lesParticipantsInscrits.add(unP);
            ret = true;
        }
        else{
            ret=false;
            throw new Exception("Cours déjà complet ! : le nombre max est atteint pour ce cours");
        }
        return ret;

    }

    /*ACCESSEURS*/

    public ArrayList<Participant> getLesParticipantsInscrits(){
        return lesParticipantsInscrits;
    }
    public byte getNombreMax() {
        return nombreMax;
    }

    public void setNombreMax(byte nombreMax) {
        this.nombreMax = nombreMax;
    }

    /*METHODES*/

    public void supprimerParticipant(Participant unP){
        int i =lesParticipantsInscrits.indexOf(unP);
        if (i != -1) { /*cas ou il ne trouve pas cet objet dans la liste*/
            lesParticipantsInscrits.remove(i);
        }

    }

    public ArrayList<Participant> trouveParticipants(String unNomFamille){
        Participant unP;
        ArrayList<Participant> ListeResult = new ArrayList<Participant>();

        Iterator<Participant> itP = lesParticipantsInscrits.iterator();

        while (itP.hasNext()){
            unP = itP.next();
            if (unP.getNom().equalsIgnoreCase(unNomFamille)){
                ListeResult.add(unP);
            }
        }
        return ListeResult;
    }


    public String toString(){
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        StringBuilder sb = new StringBuilder("=>").append(intituleCours).append(" le");
        sb.append(sdf.format(dateCours)).append(" a ").append(heureCours).append("h - maximum ").append(nombreMax).append(" pers.\n");

        //Si on veut en plus la liste des participants
        // sb.append(listeDesParticipants());

        return sb.toString();
    }


    public String listeDesParticipants(){

        Participant unP;

        StringBuilder sb = new StringBuilder("Liste des Participants de ce cours : \n");
        //sb.append(this.toString());

        Iterator<Participant> itP = lesParticipantsInscrits.iterator();

        while (itP.hasNext()){
            unP = itP.next();
            sb.append(unP.toString());
        }
        return sb.toString();
    }
    /**
     * methode permettant de trier la liste des participants selon plusieurs méthodes….
     * @param choixTri de type int
     *               represente le choix du tri....
     *                1 si tri par nom
     *                2 si tri par date de naissance
     *                3 si tri par département
     * @return ArrayList<Participant> liste des participants triée
     * @author Frederique de Robien
     * @version : 1.0
     */
    public ArrayList<Participant> listeDesParticipantsTrieeAlphabetique(int choixTri) {
        //variable statique de classe) pour définir le tri
        Participant.tri = choixTri ;
        Collections.sort(lesParticipantsInscrits);
        return lesParticipantsInscrits ;
    }

    public Date getDateCours() {
        return dateCours;
    }
}

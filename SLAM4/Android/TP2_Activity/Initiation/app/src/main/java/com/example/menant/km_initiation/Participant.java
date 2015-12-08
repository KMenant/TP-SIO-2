package com.example.menant.km_initiation;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by Frederique de ROBIEN on 02/09/2015.
 */

public class Participant implements Comparable, Serializable {

    public static int tri = 1;
    //1 si tri par nom
    //2 si tri par date de naissance
    //3 si tri par département

    private String nom;
    private String prenom;
    private Date dateNais;
    private byte numDepartement;


    public Participant(String n) {
        this.nom = n;
        prenom = "";
        dateNais = new Date();
        numDepartement = 74;
    }


    public Participant(String n, String p, Date d, byte numD) {
        this.nom = n;
        prenom = p;
        dateNais = d;
        numDepartement = numD;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public Date getDateNais() {
        return dateNais;
    }

    public byte getNumDepartement() {
        return numDepartement;
    }

    public void setNumDepartement(byte numD) {
        numDepartement = numD;
    }


    @Override
    public String toString() {

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        StringBuilder sb = new StringBuilder();
        sb.append(nom).append("\t").append(prenom);/* \n signifie retour ligne*/
        sb.append("\t").append(sdf.format(dateNais)).append("\t").append(numDepartement).append("\n");

        return sb.toString();/*retour de la chaine*/
    }

    @Override
    public int compareTo(Object another) {
        Participant autreP = (Participant) another;
        switch (tri) {
            case 1:
                return prenom.compareTo(autreP.prenom);
            case 2:
                return dateNais.compareTo(autreP.dateNais);
            case 3:
                return (int) numDepartement - (autreP.numDepartement);
            default :
                return 0;
        }
}
}



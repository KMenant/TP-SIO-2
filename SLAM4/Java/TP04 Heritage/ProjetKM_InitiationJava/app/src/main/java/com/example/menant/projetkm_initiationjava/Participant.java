package com.example.menant.projetkm_initiationjava;

import java.util.Date;

/**
 * Created by menant on 14/09/2015.
 */
public class Participant {
    private String nomP;
    private String prenomP;
    private Date naissanceP;
    private int departementP;

    public Participant(String nomP, String prenomP, Date naissanceP, int departementP) {
        this.nomP = nomP;
        this.prenomP = prenomP;

        this.naissanceP = naissanceP;
        this.departementP = departementP;
    }

    public Participant() {
    }

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder("Le participant s'appel ");
        sb.append(nomP).append(" ");
        sb.append(prenomP).append("\n ");
        return sb.toString();
    }

    public void setDepartementP(int departementP) {
        this.departementP = departementP;
    }

    public String getNomP() {

        return nomP;
    }

    public String getPrenomP() {
        return prenomP;
    }

    public Date getNaissanceP() {
        return naissanceP;
    }

    public int getDepartementP() {
        return departementP;
    }
}

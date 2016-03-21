package com.example.frederiquederobien.tpdictionnaire;

/**
 * Created by Frédérique de ROBIEN on 24/02/2016.
 */

import java.util.GregorianCalendar;
import java.util.Calendar;

public class Video implements Comparable {
    private String titre, realisateur;
    private int annee;

    public Video(){
        this("Inconnu", "Inconnu", 0);
    }

    public Video(String titre, String realisateur){
        this(titre, realisateur, (new GregorianCalendar()).get(Calendar.YEAR));
    }
    public Video(String titre, String realisateur, String annee){
        this(titre, realisateur, Integer.parseInt(annee));
    }
    public Video(String titre, String realisateur, int annee){
        if (titre == null || realisateur == null)
            throw new NullPointerException();
        this.titre = titre;
        this.realisateur = realisateur;
        this.annee = annee;
    }

    public String getTitre(){
        return this.titre;
    }
    public String getRealisateur(){
        return this.realisateur;
    }
    public int getAnnee(){
        return this.annee;
    }

    public void setTitre(String titre){
        this.titre = titre;
    }
    public void setRealisateur(String realisateur){
        this.realisateur = realisateur;
    }
    public void setAnnee(int annee){
        this.annee = annee;
    }

    @Override
    public int hashCode(){
        return annee * titre.hashCode() + realisateur.hashCode();
    }

    public boolean equals(Object o){
        if(!(o instanceof Video))
            return false;
        Video v = (Video)o;
        return (this.hashCode() == v.hashCode());
    }

    public int compareTo(Object o){
        if(!(o instanceof Video))
            throw new ClassCastException();
        Video v = (Video)o;
        int comparaison;
        if((comparaison = titre.compareTo(v.getTitre())) != 0)
            return  comparaison;
        else if((comparaison = realisateur.compareTo(v.getRealisateur())) != 0)
            return comparaison;
        else
            return (new Integer(annee)).compareTo(new Integer(v.getAnnee()));
    }

    @Override
    public String toString(){
        StringBuffer res = new StringBuffer("[");
        res.append(titre);
        res.append(", ");
        res.append(realisateur);
        res.append(", ");
        res.append(annee);
        return res.append("]\n").toString();
    }
}

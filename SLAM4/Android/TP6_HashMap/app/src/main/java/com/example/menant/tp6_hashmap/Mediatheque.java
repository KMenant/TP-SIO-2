package com.example.menant.tp6_hashmap;

import android.widget.ArrayAdapter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/**
 * Created by Fr�d�rique de ROBIEN on 24/02/2016.
 */
public class Mediatheque {

    HashMap<String, Video> lesVideos ;

    public Mediatheque(){
		//constructeur � compl�ter
      lesVideos = new HashMap<String, Video>();
    }

    public int nbVideos(){
        return lesVideos.size();
    }

    //ajoute une video � la m�diath�que
    public void ajouterVideo(String code, Video uneVideo){
        lesVideos.put(code, uneVideo);
    }

    //v�rifie si le code est pr�sent en tant que cl� dans la HashMap
    public boolean codePresent(String code)
    {
        return (lesVideos.containsKey(code));
    }

    //supprime une video � partir de sa cl� (ici code)
    public void supprimerVideo(String code){
        lesVideos.remove(code);
    }

    //recherche une video (la retourne)� partir de sa cl� (ici code). si la video n'est pas trouv�, renvoie null
    public Video rechercheVideo(String code){
        if(lesVideos.containsKey(code))
            return(lesVideos.get(code));
        else
            return null;
    }


    // consulte tous les codes des vid�os possibles de la m�diath�que et les retourne sous la forme d'une collection
    public ArrayList<String> consulterCodes(){
        ArrayList<String> lesTitres = new ArrayList<String>();//d�claration de la collection qui r�cup�rera tous les titres des videos

		
       
    }

    // consulte toutes les vid�os possibles de la m�diath�que et les retourne sous la forme d'une chaine
    public String consulterVideos(){
        //d�claration du StringBuilder
        StringBuilder sbVideo = new StringBuilder("LISTE DES VIDEOS : \n ");
		
		

        
    }

}

package com.example.menant.tp6_hashmap;

import android.widget.ArrayAdapter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/**
 * Created by Frédérique de ROBIEN on 24/02/2016.
 */
public class Mediatheque {

    HashMap<String, Video> lesVideos ;

    public Mediatheque(){
		//constructeur à compléter
      lesVideos = new HashMap<String, Video>();
    }

    public int nbVideos(){
        return lesVideos.size();
    }

    //ajoute une video à la médiathèque
    public void ajouterVideo(String code, Video uneVideo){
        lesVideos.put(code, uneVideo);
    }

    //vérifie si le code est présent en tant que clé dans la HashMap
    public boolean codePresent(String code)
    {
        return (lesVideos.containsKey(code));
    }

    //supprime une video à partir de sa clé (ici code)
    public void supprimerVideo(String code){
        lesVideos.remove(code);
    }

    //recherche une video (la retourne)à partir de sa clé (ici code). si la video n'est pas trouvé, renvoie null
    public Video rechercheVideo(String code){
        if(lesVideos.containsKey(code))
            return(lesVideos.get(code));
        else
            return null;
    }


    // consulte tous les codes des vidéos possibles de la médiathèque et les retourne sous la forme d'une collection
    public ArrayList<String> consulterCodes(){
        ArrayList<String> lesTitres = new ArrayList<String>();//déclaration de la collection qui récupèrera tous les titres des videos

		
       
    }

    // consulte toutes les vidéos possibles de la médiathèque et les retourne sous la forme d'une chaine
    public String consulterVideos(){
        //déclaration du StringBuilder
        StringBuilder sbVideo = new StringBuilder("LISTE DES VIDEOS : \n ");
		
		

        
    }

}

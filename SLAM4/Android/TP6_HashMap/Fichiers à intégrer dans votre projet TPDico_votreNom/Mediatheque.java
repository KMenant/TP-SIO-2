package com.example.frederiquederobien.tpdictionnaire;

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
      
    }

    public int nbVideos(){
        return lesVideos.size();
    }

    //ajoute une video � la m�diath�que
    public void ajouterVideo(String code, Video uneVideo){
        
    }

    //v�rifie si le code est pr�sent en tant que cl� dans la HashMap
    public boolean codePresent(String code)
    {
        
    }

    //supprime une video � partir de sa cl� (ici code)
    public void supprimerVideo(String code){
        
		
		
    }

    //recherche une video (la retourne)� partir de sa cl� (ici code). si la video n'est pas trouv�, renvoie null
    public Video rechercheVideo(String code){
        
		
    }


    // consulte tous les codes des vid�os possibles de la m�diath�que et les retourne sous la forme d'une collection
    public ArrayList<String> consulterCodes(){
        //d�claration de la collection qui r�cup�rera tous les titres des videos
        
		
       
    }

    // consulte toutes les vid�os possibles de la m�diath�que et les retourne sous la forme d'une chaine
    public String consulterVideos(){
        //d�claration du StringBuilder
        StringBuilder sbVideo = new StringBuilder("LISTE DES VIDEOS : \n ");
		
		

        
    }

}

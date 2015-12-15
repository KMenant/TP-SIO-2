package com.example.menant.km_initiation;

import android.os.Environment;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

import java.io.File;
import java.util.ArrayList;

/**
 * Created by menant on 14/12/2015.
 */
public class Modele {

    private String db4oFileName;
    private ObjectContainer dataBase;
    private File appDir;

    public void open() {
        db4oFileName = Environment.getExternalStorageDirectory() + "/baseDB4o" + "/BaseCours.db4o";
        dataBase = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(),db4oFileName);
    }

    public void createDirectory() {                 //Stocker la BDD dans un dossier accessible.
        appDir = new File(Environment.getExternalStorageDirectory() + "/baseDB4o");
        if (!appDir.exists() && !appDir.isDirectory()) {
            appDir.mkdirs();
        }
    }

    public void saveCours(Cours unCours) {          //méthode pour SAUVEGARDER un nouveau cours et
        // ATTENTION pour le MODIFIER en cas de modification (exemple lors de l'ajout de participants)
        // Il faut récupérer le cours au préalable en appelant la méthode recupereCours
        try {
            open();
            dataBase.store(unCours);
            dataBase.commit();// VALIDATION de cet ajout d'objet car le store s'est bien passé
        }catch(Exception e){
            e.printStackTrace();
            dataBase.rollback();// ANNULATION de cet ajout d'objet car le store a "buggé"
        }finally {
            dataBase.close();// dans tous les cas FERMETURE de la BDDO
        }
    }

    public ArrayList<Cours> listeCours(){ //créer la liste de retour
        open();
        ArrayList<Cours> listeCours = new ArrayList<Cours>();
        ObjectSet<Cours> result = dataBase.queryByExample(Cours.class);
        while (result.hasNext()) {
            listeCours.add(result.next());
        }
        //parcourir tous les éléments du résultat de la requête et ajouter chaque élément à la nouvelle liste
        dataBase.close(); //ferme la BDDO
        return listeCours;//retourner la liste
    }

    public Modele () {
        createDirectory();
        //Plus tard, on fera l'import de donnees si on les recupere d'une autre BDD (MySQL)

    }
}

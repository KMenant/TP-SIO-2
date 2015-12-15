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

    public void saveCours(Cours unCours) {          //m�thode pour SAUVEGARDER un nouveau cours et
        // ATTENTION pour le MODIFIER en cas de modification (exemple lors de l'ajout de participants)
        // Il faut r�cup�rer le cours au pr�alable en appelant la m�thode recupereCours
        try {
            open();
            dataBase.store(unCours);
            dataBase.commit();// VALIDATION de cet ajout d'objet car le store s'est bien pass�
        }catch(Exception e){
            e.printStackTrace();
            dataBase.rollback();// ANNULATION de cet ajout d'objet car le store a "bugg�"
        }finally {
            dataBase.close();// dans tous les cas FERMETURE de la BDDO
        }
    }

    public ArrayList<Cours> listeCours(){ //cr�er la liste de retour
        open();
        ArrayList<Cours> listeCours = new ArrayList<Cours>();
        ObjectSet<Cours> result = dataBase.queryByExample(Cours.class);
        while (result.hasNext()) {
            listeCours.add(result.next());
        }
        //parcourir tous les �l�ments du r�sultat de la requ�te et ajouter chaque �l�ment � la nouvelle liste
        dataBase.close(); //ferme la BDDO
        return listeCours;//retourner la liste
    }

    public Modele () {
        createDirectory();
        //Plus tard, on fera l'import de donnees si on les recupere d'une autre BDD (MySQL)

    }
}

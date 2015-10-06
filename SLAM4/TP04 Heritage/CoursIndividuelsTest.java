package com.example.frederiquederobien.projetfr_initiationjava;

import junit.framework.TestCase;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by Frederique de ROBIEN on 09/09/2015.
 */
public class CoursIndividuelsTest extends TestCase {

    private static final String DATE_PATTERN = "dd/MM/yyyy";
    private Participant p,m= null;
    private CoursIndividuels c = null;
    private SimpleDateFormat sdf =null;

    public CoursIndividuelsTest(String testMethodName) {
        super(testMethodName);

    }


    protected  void setUp(){
        sdf = new SimpleDateFormat(DATE_PATTERN);
        try {
            p = new Participant("TAURAND", "Pierre", sdf.parse("10/10/1990"), (byte) 49);
            m = new Participant("ALPHAND", "Luc", sdf.parse("06/08/1965"), (byte) 05);

            c = new CoursIndividuels("Ski debutant", sdf.parse("15/12/2015"), 12, m);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    protected  void tearDown(){
        sdf = null;
        p = null;
       m = null;
        c = null;
    }
    /**
     * test du v�rification de l'existence d'un moniteur apr�s la cr�ation d'un cours individuel
     * */
    public void testVerifMoniteur() throws Exception {
        assertNotNull("objet non instanci�", m);
        assertEquals("Moniteur non affect�", c.getLeMoniteur().getNom(), "ALPHAND");
    }

    public void testAjouterParticipant() throws Exception {
        assertNotNull("objet non instanci�", p);
        assertNotNull("objet non instanci�", c);
        assertNotNull("objet non instanci�", m);
        /*test de la nullit� d'un particpant � la creation du cours*/
        assertNull("A la creation du cours, NE PAS affecter de participant", c.getUnSeulParticipant());
        c.ajouterParticipant(p);
        /*test de l'ajout d un participant au cours*/
        assertEquals("ajout du Participant au cours non effectue", c.getUnSeulParticipant().getNom(), "TAURAND");
        /*test de l'ajout d'un deuxieme participant au cours*/
        assertEquals("NE PAS ajouter un autre particpant pour les cours individuels", c.ajouterParticipant(p),false );
    }

    public void testSupprimerParticipant() throws Exception {
        assertNotNull("objet non instanci�", c);
        assertNotNull("objet non instanci�", p);
        assertNotNull("objet non instanci�", m);
        /*test de la suppression de l inscription d un participant*/
        c.supprimerParticipant(p);
        assertNull("Suppression du participant non effectuee", c.getUnSeulParticipant());
    }
    /**
     * test du changement de Moniteur pour les cours individuels
     * */
    public void testChangerMoniteur() throws Exception {
        assertNotNull("objet non instanci�", m);
        Participant m1 = new Participant("TOMBA", "Alberto", sdf.parse("25/12/1963"), (byte) 01);
        c.changerMoniteur(m1);
        assertEquals("Changement moniteur non effectu�", c.getLeMoniteur().getNom(), "TOMBA");
    }

}

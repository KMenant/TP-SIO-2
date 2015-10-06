package com.example.frederiquederobien.projetfr_initiationjava;

import junit.framework.TestCase;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by Frédérique de ROBIEN on 24/09/2015.
 */
public class PlaningSaisonTest extends TestCase {

    private static final String DATE_PATTERN = "dd/MM/yyyy";
    private SimpleDateFormat sdf =null;
    private Participant m = null;
    private Cours c,c1,c2,c3 = null;
    private PlaningSaison ps = null;


    public PlaningSaisonTest(String testMethodName) {
        super(testMethodName);
    }

    protected  void setUp(){
        sdf = new SimpleDateFormat(DATE_PATTERN);
        try {
            ps= new PlaningSaison(sdf.parse("01/12/2015"),sdf.parse("30/03/2016"));

            c = new CoursCollectifs("Ski debutant", sdf.parse("01/12/2015"), 13, (byte) 10);
            m = new Participant("CHIOGGIO", "Roberto", sdf.parse("11/06/1966"), (byte) 0);
            c1= new CoursIndividuels("rando itineraire du Loup",sdf.parse("30/03/2016"),12,m);
            c2 = new CoursCollectifs("Ski debutant adulte", sdf.parse("11/11/2015"), 13, (byte) 20);
            c3 = new CoursCollectifs("Ski debutant2 adulte", sdf.parse("31/03/2016"), 13, (byte) 20);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        assertFalse("Date du cours anterieure à la date de DEBUT de la saison", ps.ajouterCours(c2));
        assertFalse("Date du cours superieure à la date de FIN de la saison", ps.ajouterCours(c3));

        assertTrue("COURS collectif non ajoute",ps.ajouterCours(c));
        assertTrue("COURS individuel non ajoute", ps.ajouterCours(c1));
    }

    protected  void tearDown(){
        sdf = null;
        m = null;
        c1 = null;
        c = null;
        c2 =null;
        c3= null;
        ps = null ;
    }

    public void testAjouterCours() throws Exception {
        assertNotNull("cours collectif non cree", c);
        assertNotNull("cours individuel non cree",c1);
        /*test de l'ajout d'un cours COLLECTIF dans le planing de saison*/
        assertEquals("Insertion du cours collectif non effectuee", ps.getLesCoursSaison().get(0).toString(), c.toString());
        /*test de l'ajout d'un cours INDIVIDUEL dans le planing de saison*/
        assertEquals("Insertion du cours individuel non effectuee", ps.getLesCoursSaison().get(1).toString(), c1.toString());
    }

    public void testSupprimerCours() throws Exception {
        testAjouterCours();
        /*test de la suppression du cours COLLECTIF dans le planing de saison*/
        ps.supprimerCours(c);
        //ici on supprime le cours collectif, donc decalage
        assertEquals("Suppression du cours collectif non effectuee", ps.getLesCoursSaison().get(0).toString(), c1.toString());
    }

}

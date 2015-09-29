package com.example.menant.projetkm_initiationjava;

import junit.framework.TestCase;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 * Created by menant on 21/09/2015.
 */
public class SaisonTest extends TestCase {

    private Cours c;
    private Saison s;
    SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat heure = new SimpleDateFormat("h");

    public SaisonTest(String testMethodName) {super(testMethodName);}



    public void setUp() throws ParseException {
        s = new Saison("Hiver", date.parse("01/12/2015"), date.parse("01/03/2015"));

    }

    public void testAjoutCours() throws Exception {
        for(int i=0; i<10; i++)
        {
            c = new Cours("Ski"+i, date.parse("15/12/2015"), heure.parse("13"), 10);
            assertTrue("Insertion non effectuee pour le cour " + i, s.ajouterCours(c));
        }

        ArrayList<Cours> Liste = s.getLesCours();
        String nomCour0 = Liste.get(0).getIntituleCours();
        assertEquals("Insertion non effectuee", nomCour0, "Ski0");
    }

    public void testSupprCours() throws Exception {
        for(int i=0; i<10; i++)
        {
            c = new Cours("Ski"+i, date.parse("15/12/2015"), heure.parse("13"), 10);
            assertTrue("Insertion non effectuee pour le cour " + i, s.ajouterCours(c));
        }
        ArrayList<Cours> Liste = s.getLesCours();
        c = Liste.get(0);
        assertTrue("Suppression non effectuee", s.supprimerCours(c));
    }

    public void testTrouverCours() throws Exception {
        for(int i=0; i<10; i++)
        {
            c = new Cours("Ski"+i, date.parse("15/12/2015"), heure.parse("13"), 10);
            assertTrue("Insertion non effectuee pour le cour " + i, s.ajouterCours(c));
        }
        assertNotNull("Trouver ne fonctionne pas", s.trouveCours("Ski2"));
    }
}

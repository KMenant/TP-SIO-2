package com.example.menant.projetkm_initiationjava;

import junit.framework.TestCase;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;

/**
 * Created by menant on 21/09/2015.
 */
public class CoursTest extends TestCase {

    private Cours c;
    private Participant p;

    public CoursTest(String testMethodName) {super(testMethodName);}



    public void setUp() throws ParseException {

        SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat heure = new SimpleDateFormat("h");
        c = new Cours("Ski", date.parse("15/12/2015"), heure.parse("13"), 10);

    }

    public void testAjoutParticipant() throws Exception {
        for(int i=0; i<10; i++)
        {
            p = new Participant("TAURAND"+i, "Frédérique", date.parse("01/01/2001"),(byte)49);
            assertTrue("Insertion non effectuee pour le participant "+i, c.ajouterParticipant(p));
        }

        ArrayList<Participant> Liste = c.getLesParticipantsInscrits();
        String nomParticipant0 = Liste.get(0).getNomP();
        assertEquals("Insertion non effectuee", nomParticipant0, "TAURAND");
    }

    public void testSupprParticipant() throws Exception {
        assertTrue("Suppression non effectuee", c.supprimerParticipant(5);, "TAURAND");
    }
}

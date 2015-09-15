package com.example.menant.projetkm_initiationjava;

import junit.framework.TestCase;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by menant on 14/09/2015.
 */
public class ParticipantTest extends TestCase {

    public ParticipantTest(String testMethodName) {
        super(testMethodName);
    }

    public void testGetNom() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Participant p = new Participant("de Robien", "Frédérique", sdf.parse("01/01/2001"),(byte)49) ;
        String n = p.getNomP();
        assertEquals("Mauvais Nom de Participant",n,"de Robien");
        String pr = p.getPrenomP();
        assertEquals("Mauvais Prenom de Participant",pr,"Frédérique");
        Date nai = p.getNaissanceP();
        assertEquals("Mauvais Date de naissance",nai,sdf.parse("01/01/2001"));
        int dep = p.getDepartementP();
        assertEquals("Mauvais Departement",dep,49);
    }

}

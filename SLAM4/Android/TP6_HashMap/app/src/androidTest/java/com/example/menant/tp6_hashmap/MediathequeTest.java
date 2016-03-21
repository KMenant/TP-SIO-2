package com.example.frederiquederobien.tpdictionnaire;

import junit.framework.TestCase;
import java.util.ArrayList;

/**
 * Created by Frédérique de ROBIEN on 24/02/2016.
 */
public class MediathequeTest extends TestCase {

    private Video v, v1, v2, v3 = null;
    private Mediatheque mediathequeDeBeaucouze = null;


    public MediathequeTest(String testMethodName) {
        super(testMethodName);
    }

    protected void setUp() {

        mediathequeDeBeaucouze = new Mediatheque();
        v = new Video("Le jour le plus long", "Ken Annakin", 1962);
        v1 = new Video("Un pont trop loin", "Richard Attenborough", 1977);
        v2 = new Video("Platoon", "Oliver Stone", 1986);
        v3 = new Video("Full metal jacket", "Stanley Kubrik", 1987);

        assertNotNull("video non créée",v);
        assertNotNull("video non créée",v1);
        assertNotNull("video non créée",v2);
        assertNotNull("video non créée", v3);

        mediathequeDeBeaucouze.ajouterVideo("KA62-1", v);
        mediathequeDeBeaucouze.ajouterVideo("RA77-1", v1);
        mediathequeDeBeaucouze.ajouterVideo("OS86-1", v2);
        mediathequeDeBeaucouze.ajouterVideo("SK87-1", v3);

        assertEquals("Insertion des videos dans la mediathèque  valide", 4, mediathequeDeBeaucouze.nbVideos());
    }

    protected void tearDown() {
        v = null;
        mediathequeDeBeaucouze = null;
    }


    public void testCodePresent() throws Exception {
        /*test de la recherche du code dans la HashMap*/
        assertTrue("code non present", mediathequeDeBeaucouze.codePresent("SK87-1"));

    }

    public void testSupprimerVideo() throws Exception {
        /*test de la suppression de la  video Platoon*/
        mediathequeDeBeaucouze.supprimerVideo("OS86-1");
        assertEquals("suppression de la video NON valide", 3, mediathequeDeBeaucouze.nbVideos());
    }

    public void testRechercheUneVideo() throws Exception {
        //test de la suppression de la  video Platoon
        Video lavideo = mediathequeDeBeaucouze.rechercheVideo("RA77-1");
        assertNotNull("video non trouvee", lavideo);
        assertEquals("recherche incorrecte","Un pont trop loin", lavideo.getTitre());
    }



    public void testConsulter() throws Exception {
        //test de la suppression d'une video
        ArrayList<String> lesCodes = mediathequeDeBeaucouze.consulterCodes();
        for (int i=0; i< mediathequeDeBeaucouze.nbVideos(); i++) {
            assertNotNull("consultation des codes non correct", lesCodes.get(i));
        }



        String toutesLesVideos = mediathequeDeBeaucouze.consulterVideos();
        assertTrue("consultation Videos incorrecte", toutesLesVideos.contains(v.toString()));
        assertTrue("consultation Videos incorrecte", toutesLesVideos.contains(v1.toString()));
        assertTrue("consultation Videos incorrecte", toutesLesVideos.contains(v3.toString()));

    }

}

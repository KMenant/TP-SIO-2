package com.example.menant.km_initiation;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


public class MainActivity extends Activity {

    private Intent i;
    private Cours c; //variable cours qui va soit être un cours collectif , soit être un cours individuel  POLYMORPHISME
    private  Modele maBDO;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        maBDO = new Modele(); //creation de la nouvelle BDO

        RadioButton rbC = (RadioButton) findViewById(R.id.rbCollectif);
        RadioButton rbI = (RadioButton) findViewById(R.id.rbIndividuel);
        Button btnE = (Button) findViewById(R.id.btnEnregistrer);
        Button btnEP = (Button) findViewById(R.id.btnEnrPart);
        Button btnListe = (Button) findViewById(R.id.btnListe);
        rbC.setOnClickListener(click);
        rbI.setOnClickListener(click);
        btnE.setOnClickListener(click);
        btnEP.setOnClickListener(click);
        btnListe.setOnClickListener(click);
    }

    private View.OnClickListener click = new View.OnClickListener() {
        //redéfinition de la méthode onClick
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.rbCollectif : //gestion du click du radiobouton Cours collectif
                    findViewById(R.id.lbNbMax).setVisibility(View.VISIBLE);
                    findViewById(R.id.txtNbMax).setVisibility(View.VISIBLE);
                    findViewById(R.id.btnEnregistrer).setVisibility(View.VISIBLE);
                    findViewById(R.id.lbNomMoniteur).setVisibility(View.GONE);
                    findViewById(R.id.txtNomMoniteur).setVisibility(View.GONE);
                    break;
                case R.id.rbIndividuel : //gestion du click du radiobouton Cours individuel
                    findViewById(R.id.lbNbMax).setVisibility(View.GONE);
                    findViewById(R.id.txtNbMax).setVisibility(View.GONE);
                    findViewById(R.id.btnEnregistrer).setVisibility(View.VISIBLE);
                    findViewById(R.id.lbNomMoniteur).setVisibility(View.VISIBLE);
                    findViewById(R.id.txtNomMoniteur).setVisibility(View.VISIBLE);
                    break;
                case R.id.btnEnregistrer : //gestion du click du bouton
                    Toast.makeText(getApplicationContext(),"Enregistrement du Cours", Toast.LENGTH_SHORT).show();
                    try {
                        String intitule = ((EditText)findViewById(R.id.txtNomCours)).getText().toString();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        Date date = sdf.parse(((EditText) findViewById(R.id.txtDate)).getText().toString());
                        Integer heures = Integer.parseInt(((EditText) findViewById(R.id.txtHeures)).getText().toString());
                        if(((RadioButton)findViewById(R.id.rbIndividuel)).isChecked())
                        {
                            String nomMoniteur = ((EditText)findViewById(R.id.txtNomMoniteur)).getText().toString();
                            Participant p = new Participant(nomMoniteur);
                            c = new CoursIndividuels(intitule, date, heures, p);
                            Toast.makeText(getApplicationContext(), c.toString(), Toast.LENGTH_SHORT).show();
                        }
                        if(((RadioButton)findViewById(R.id.rbCollectif)).isChecked())
                        {
                            Byte nbmax = Byte.parseByte(((EditText) findViewById(R.id.txtNbMax)).getText().toString());
                            c = new CoursCollectifs(intitule, date, heures, nbmax);
                            Toast.makeText(getApplicationContext(), c.toString(), Toast.LENGTH_SHORT).show();
                        }
                        //Participant p = new Participant(nom, prenom, date_naiss, dept);
                        //affichage de votre nouveau participant dans un Toast pour vérifier de sa bonne création
                        findViewById(R.id.btnEnrPart).setVisibility(View.VISIBLE);
                        maBDO.saveCours(c);
                        Toast.makeText(getApplicationContext(),"SAUVEGARDE EN BDO",Toast.LENGTH_SHORT).show();
                    }
                    catch(ParseException pe){
                        pe.printStackTrace();
                        //pour débugger plus visuellement, juste pour cette fois-ci
                        Toast.makeText(getApplicationContext(), "ERREUR du PARSE date", Toast.LENGTH_SHORT).show();
                    }
                    break;
                case R.id.btnEnrPart : //gestion du click du bouton
                    Toast.makeText(getApplicationContext(), "Chargement ...",Toast.LENGTH_SHORT).show();
                    i = new Intent(getApplicationContext(), ActivityParticicipant.class);
                    i.putExtra("info1", "D�marrage de l'activit�");
                    i.putExtra("cours", (Serializable)c);
                    startActivity(i);
                    break;
                case R.id.btnListe : //gestion du click du bouton Liste
                    ArrayList<Cours> Liste = maBDO.listeCours();
                    
                    break;
            }
        }
    };

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}

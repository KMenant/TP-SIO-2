package com.example.menant.km_initiation;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        RadioButton rbC = (RadioButton) findViewById(R.id.rbCollectif);
        RadioButton rbI = (RadioButton) findViewById(R.id.rbIndividuel);
        rbC.setOnClickListener(click);
        rbI.setOnClickListener(click);
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
                    Cours c; //variable cours qui va soit être un cours collectif , soit être un cours individuel  POLYMORPHISME
                    Toast.makeText(getApplicationContext(),"Enregistrement du Cours", Toast.LENGTH_SHORT).show();
                    try {
                        String intitule = ((EditText)findViewById(R.id.txtNomCours)).getText().toString();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        Date date = sdf.parse(((EditText) findViewById(R.id.txtDate)).getText().toString());
                        Integer heures = Integer.parseInt(((EditText) findViewById(R.id.txtHeures)).getText().toString());
                        if(findViewById(R.id.rbIndividuel).isSelected())
                        {
                            String nomMoniteur = ((EditText)findViewById(R.id.txtNomMoniteur)).getText().toString();
                            Participant p = new Participant(nomMoniteur);
                            CoursIndividuels ci = new CoursIndividuels(intitule, date, heures, p);
                            Toast.makeText(getApplicationContext(), ci.toString(), Toast.LENGTH_SHORT).show();
                        }
                        if(findViewById(R.id.rbCollectif).isSelected())
                        {
                            Byte nbmax = Byte.parseByte(((EditText) findViewById(R.id.txtNbMax)).getText().toString());
                            CoursCollectifs cc = new CoursCollectifs(intitule, date, heures, nbmax);
                            Toast.makeText(getApplicationContext(), cc.toString(), Toast.LENGTH_SHORT).show();
                        }
                        //Participant p = new Participant(nom, prenom, date_naiss, dept);
                        //affichage de votre nouveau participant dans un Toast pour vérifier de sa bonne création
                    }
                    catch(ParseException pe){
                        pe.printStackTrace();
                        //pour débugger plus visuellement, juste pour cette fois-ci
                        Toast.makeText(getApplicationContext(), "ERREUR du PARSE date", Toast.LENGTH_SHORT).show();
                    }
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

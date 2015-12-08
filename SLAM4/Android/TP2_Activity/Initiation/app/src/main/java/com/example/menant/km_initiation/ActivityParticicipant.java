package com.example.menant.km_initiation;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class ActivityParticicipant extends Activity {

    private Cours cours;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_activity_particicipant);

        Button btnEnregistrer=(Button) findViewById(R.id.btnEnregistrer);
        btnEnregistrer.setOnClickListener(btnclick); // btnclick à garder

        Button btnListe=(Button) findViewById(R.id.btnListe);
        btnListe.setOnClickListener(btnclick); // btnclick à garder

        Button btnSortir=(Button) findViewById(R.id.btnSortir);
        btnSortir.setOnClickListener(btnclick); // btnclick à garder

        /*création du bundle qui va réceptionner les données passées par le Intent*/
        Bundle b = getIntent().getExtras();
        String info1 = b.getString("info1");
        cours = (Cours) getIntent().getSerializableExtra("cours");
        Toast.makeText(getApplicationContext(),"Chargement effectuée ! Cours : "+cours.toString(), Toast.LENGTH_LONG).show();
    }

    private View.OnClickListener btnclick = new View.OnClickListener() {

        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.btnEnregistrer: /*clic sur btn Enregistrer*/
                    Toast.makeText(getApplicationContext(), "Enregistrement du participant en cours", Toast.LENGTH_SHORT).show();
                    try {
                        String nom = ((EditText)findViewById(R.id.txtNom)).getText().toString();
                        String prenom = ((EditText)findViewById(R.id.txtPrenom)).getText().toString();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        Date date_naiss = sdf.parse(((EditText) findViewById(R.id.txtDate)).getText().toString());
                        Byte dept = Byte.parseByte(((EditText) findViewById(R.id.txtNumDep)).getText().toString());

                        Participant p = new Participant(nom, prenom, date_naiss, dept);
                        cours.ajouterParticipant(p);
                        //affichage de votre nouveau participant dans un Toast pour vérifier de sa bonne création
                        Toast.makeText(getApplicationContext(), p.toString(), Toast.LENGTH_SHORT).show();

                        ((EditText) findViewById(R.id.txtNom)).setText("");
                        ((EditText) findViewById(R.id.txtPrenom)).setText("");
                        ((EditText) findViewById(R.id.txtDate)).setText("");
                        ((EditText) findViewById(R.id.txtNumDep)).setText("");
                    }
                    catch(ParseException pe){
                        pe.printStackTrace();
                        //pour débugger plus visuellement, juste pour cette fois-ci
                        Toast.makeText(getApplicationContext(), "ERREUR du PARSE date", Toast.LENGTH_SHORT).show();
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case R.id.btnListe:
                    Toast.makeText(getApplicationContext(), cours.listeDesParticipants(), Toast.LENGTH_SHORT).show();
                    break;
                case R.id.btnSortir:
                    finish();
                    break;
            }
        }
    };

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_activity_particicipant, menu);
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

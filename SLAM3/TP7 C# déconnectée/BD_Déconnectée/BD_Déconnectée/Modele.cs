using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BD_Déconnectée
{
    public class Modele
    {
        private MySqlConnection myConnection;
        private DataSet dataSetTP7 = new DataSet();
        private DataView dv_formation = new DataView();
        private DataView dv_personne = new DataView();
        private bool connopen = false;
        private bool errgrave = false;
        private bool chargement = false;

        public Modele() { }

        public void seconnecter()
        {
            string myConnectionString = "Database=bd_ex_bddeconnectee;Data Source=localhost;User Id=root;";
            myConnection = new MySqlConnection(myConnectionString);
            try // tentative
            {
                myConnection.Open();
                connopen = true;
            }
            catch (Exception err)// gestion des erreurs
            {
                MessageBox.Show("Erreur ouverture bdd : " + err, "PBS connection", MessageBoxButtons.OK, MessageBoxIcon.Error);
                connopen = false; errgrave = true;
            }
        }

        public void sedeconnecter()
        {
            if (!connopen)
                return;
            try
            {
                myConnection.Close();
                myConnection.Dispose();
                connopen = false;
            }
            catch (Exception err)
            {
                MessageBox.Show("Erreur fermeture bdd : " + err, "PBS deconnection", MessageBoxButtons.OK, MessageBoxIcon.Error);
                errgrave = true;
            }
        }

        public void import()
        {
            if (!connopen) return;
            mySqlDataAdapterTP7.SelectCommand = new MySqlCommand("select * from formation;select * from personne;", myConnection);
            try
            {
                dataSetTP7.Clear();
                mySqlDataAdapterTP7.Fill(dataSetTP7);
                MySqlCommand vcommand = myConnection.CreateCommand();
                // gestion des clés auto_increment : ici exemple sur la table personne : dataSetTP7.Tables[1]
                vcommand.CommandText = "SELECT AUTO_INCREMENT as last_id FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'personne'";
                UInt64 der_personne = (UInt64)vcommand.ExecuteScalar();
                dataSetTP7.Tables[1].Columns[0].AutoIncrement = true;
                dataSetTP7.Tables[1].Columns[0].AutoIncrementSeed = Convert.ToInt64(der_personne);
                dataSetTP7.Tables[1].Columns[0].AutoIncrementStep = 1;
                // remplissage des dataView à partir des tables du dataSet
                dv_formation = dataSetTP7.Tables[0].DefaultView;
                dv_personne = dataSetTP7.Tables[1].DefaultView;

                chargement = true;
            }
            catch (Exception err)
            {
                MessageBox.Show("Erreur chargement dataset : " + err, "PBS formation/personne", MessageBoxButtons.OK, MessageBoxIcon.Error);
                errgrave = true;
            }
        } 

        public bool Connopen
        {
            get { return connopen; }
        }
        public bool Errgrave
        {
            get { return errgrave; }
        }
        public bool Chargement
        {
            get { return chargement; }
        }
        public DataView Dv_formation
        {
            get { return dv_formation; }
            set { dv_formation = value; }
        }
        public DataView Dv_personne
        {
            get { return dv_personne; }
            set { dv_personne = value; }
        }
    }
}

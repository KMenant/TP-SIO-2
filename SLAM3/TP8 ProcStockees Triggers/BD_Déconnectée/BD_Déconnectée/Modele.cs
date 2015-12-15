using MySql.Data.MySqlClient;
using System;
using System.Collections;
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
        private MySqlDataAdapter mySqlDataAdapterTP7 = new MySqlDataAdapter();
        private DataSet dataSetTP7 = new DataSet();
        private DataView dv_formation = new DataView();
        private DataView dv_personne = new DataView();
        private bool connopen = false;
        private bool errgrave = false;
        private bool chargement = false;
        
        private bool errmaj = false; // Erreur de MAJ
        private char vaction, vtable;
        private ArrayList rapport = new ArrayList(); // pour gérer le rapport des erreurs de maj 

        public Modele() { }

        public void seconnecter()
        {
            string myConnectionString = "Database=slam3_tp7;Data Source=localhost;User Id=root;";
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
                chargement = false;
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
        public void export()
        {
            if (!connopen) return;
            try
            {
                add_personne();
                maj_personne();
                del_personne();
                MessageBox.Show("Exportation effectuer");
            }
            catch (Exception err)
            {
                MessageBox.Show("Erreur export : " + err, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                errmaj = true;
            }
        }

        private void OnRowUpdated(object sender, MySqlRowUpdatedEventArgs args)// utile pour ajout,modif,supp
        {
            string msg = "";
            Int64 nb = 0;
            if (args.Status == UpdateStatus.ErrorsOccurred)
            {
                if (vaction == 'd' || vaction == 'u') // on veut savoir si la personne existe encore dans la base
                {
                    MySqlCommand vcommand = myConnection.CreateCommand();
                    if (vtable == 'p') // ‘p’ pour table PERSONNE
                    {
                        vcommand.CommandText = "SELECT COUNT(*) FROM personne WHERE IdPersonne = '" + args.Row[0, DataRowVersion.Original] + "'";
                    }
                    nb = (Int64)vcommand.ExecuteScalar();                    
                }
                if (vaction == 'd')
                {
                    if (nb == 1) // pour delete si l'enr a été supprimé on n'affiche pas l'erreur
                    {
                        if (vtable == 'p')
                        {
                            msg = "Pour le numéro de personnes : " + args.Row[0, DataRowVersion.Original] + "impossible delete car enr modifié dans la base";
                        }
                        rapport.Add(msg);
                        errmaj = true;
                    }
                }
                if (vaction == 'u')
                {
                    if (nb == 1)
                    {
                        if (vtable == 'p')
                        {
                            msg = "pour le numéro de personne: " + args.Row[0, DataRowVersion.Original] + "impossible MAJ car enr modifié dans la base";
                        }
                        rapport.Add(msg);
                        errmaj = true;
                    }
                    else
                    {
                        if (vtable == 'p')
                        {
                            msg = "pour le numéro de personne : " + args.Row[0, DataRowVersion.Original] + "impossible MAJ car enr supprimé dans la base";
                        }
                        rapport.Add(msg);
                        errmaj = true;
                    }
                }
                if (vaction == 'c')
                {
                    if (vtable == 'p')
                    {
                        msg = "pour le numéro de personne : " + args.Row[0, DataRowVersion.Current] + "impossible ADD car erreur données";
                    }
                    rapport.Add(msg);
                    errmaj = true;
                }
            }
        }

        public void add_personne()
        {
            vaction = 'c'; // on précise bien l’action, ici c pour create
            vtable = 'p';
            if (!connopen) return;
            //appel d'une méthode sur l'événement ajout d'un enr de la table
            mySqlDataAdapterTP7.RowUpdated += new MySqlRowUpdatedEventHandler(OnRowUpdated);
            mySqlDataAdapterTP7.InsertCommand = new MySqlCommand("insert into personne (nom,prenom,IdFormation) values (?nom,?prenom,?IdFormation)", myConnection);// notre commandbuilder ici ajout non fait si erreur de données

            //déclaration des variables utiles au commandbuilder
            // pas besoin de créer l’IdPersonne car en auto-increment
            mySqlDataAdapterTP7.InsertCommand.Parameters.Add("?nom", MySqlDbType.Text, 65535, "nom");
            mySqlDataAdapterTP7.InsertCommand.Parameters.Add("?prenom", MySqlDbType.Text, 65535, "prenom");
            mySqlDataAdapterTP7.InsertCommand.Parameters.Add("?IdFormation", MySqlDbType.Int16, 10, "IdFormation");

            //on continue même si erreur de MAJ
            mySqlDataAdapterTP7.ContinueUpdateOnError = true;

            //table concernée 1 = personne
            DataTable table = dataSetTP7.Tables[1];

            //on ne s'occupe que des enregistrement ajoutés en local
            mySqlDataAdapterTP7.Update(table.Select(null, null, DataViewRowState.Added));

            //désassocie la méthode sur l'événement maj de la base
            mySqlDataAdapterTP7.RowUpdated -= new MySqlRowUpdatedEventHandler(OnRowUpdated);
        }

        public void maj_personne()
        {
            vaction = 'u'; // on précise bien l’action, ici c pour create
            vtable = 'p';
            if (!connopen) return;
            //appel d'une méthode sur l'événement ajout d'un enr de la table
            mySqlDataAdapterTP7.RowUpdated += new MySqlRowUpdatedEventHandler(OnRowUpdated);
            mySqlDataAdapterTP7.UpdateCommand = new MySqlCommand("update personne set nom=?nom, prenom=?prenom, IdFormation=?IdFormation where IdPersonne = ?num and dateA = ?modif ", myConnection);// notre commandbuilder ici ajout non fait si erreur de données

            //déclaration des variables utiles au commandbuilder
            // pas besoin de créer l’IdPersonne car en auto-increment
            mySqlDataAdapterTP7.UpdateCommand.Parameters.Add("?nom", MySqlDbType.Text, 65535, "nom");
            mySqlDataAdapterTP7.UpdateCommand.Parameters.Add("?prenom", MySqlDbType.Text, 65535, "prenom");
            mySqlDataAdapterTP7.UpdateCommand.Parameters.Add("?IdFormation", MySqlDbType.Int16, 10, "IdFormation");
            mySqlDataAdapterTP7.UpdateCommand.Parameters.Add("?num", MySqlDbType.Int16, 10, "IdPersonne");
            mySqlDataAdapterTP7.UpdateCommand.Parameters.Add("?modif", MySqlDbType.Timestamp, 20, "dateA");

            //on continue même si erreur de MAJ
            mySqlDataAdapterTP7.ContinueUpdateOnError = true;

            //table concernée 1 = personne
            DataTable table = dataSetTP7.Tables[1];

            //on ne s'occupe que des enregistrement ajoutés en local
            mySqlDataAdapterTP7.Update(table.Select(null, null, DataViewRowState.ModifiedCurrent));

            //désassocie la méthode sur l'événement maj de la base
            mySqlDataAdapterTP7.RowUpdated -= new MySqlRowUpdatedEventHandler(OnRowUpdated);
        }

        public void del_personne()
        {
            vaction = 'd'; // on précise bien l’action, ici c pour create
            vtable = 'p';
            if (!connopen) return;
            //appel d'une méthode sur l'événement ajout d'un enr de la table
            mySqlDataAdapterTP7.RowUpdated += new MySqlRowUpdatedEventHandler(OnRowUpdated);
            mySqlDataAdapterTP7.DeleteCommand = new MySqlCommand("delete from personne where IdPersonne = ?num and dateA = ?modif;", myConnection);// force le delete même si maj dans la base

            //déclaration des variables utiles au commandbuilder
            // pas besoin de créer l’IdPersonne car en auto-increment
            mySqlDataAdapterTP7.DeleteCommand.Parameters.Add("?num", MySqlDbType.Int16, 10, "IdPersonne");
            mySqlDataAdapterTP7.DeleteCommand.Parameters.Add("?modif", MySqlDbType.Timestamp, 20, "dateA");

            //on continue même si erreur de MAJ
            mySqlDataAdapterTP7.ContinueUpdateOnError = true;

            //table concernée 1 = personne
            DataTable table = dataSetTP7.Tables[1];

            //on ne s'occupe que des enregistrement ajoutés en local
            mySqlDataAdapterTP7.Update(table.Select(null, null, DataViewRowState.Deleted));

            //désassocie la méthode sur l'événement maj de la base
            mySqlDataAdapterTP7.RowUpdated -= new MySqlRowUpdatedEventHandler(OnRowUpdated);
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
        public DataView Dv_formation //Accesseur DataView Formation
        {
            get { return dv_formation; }
            set { dv_formation = value; }
        }
        public DataView Dv_personne //Accesseur DataView Personne
        {
            get { return dv_personne; }
            set { dv_personne = value; }
        }

        public bool Errmaj
        {
            get { return errmaj; }
        }
        public char Vaction
        {
            get { return vaction; }
        }
        public char Vtable
        {
            get { return vtable; }
        }
        public ArrayList Rapport
        {
            get { return rapport; }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BD_Déconnectée
{
    public partial class FormPersonne : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public FormPersonne()
        {
            InitializeComponent();
            chargedgv();
        }

        public void chargedgv()
        {
            bindingSource1.DataSource = Controleur.Vmodele.Dv_personne;
            dataGV.DataSource = bindingSource1;

            #region DGV Colonnes
            int vwidth = dataGV.RowHeadersWidth;
            for (int i = 0; i < dataGV.Columns.Count; i++) // pour gérer la taille des colonnes
            {
                if (dataGV.Columns[i].Visible)
                    vwidth = vwidth + dataGV.Columns[i].GetPreferredWidth(DataGridViewAutoSizeColumnMode.AllCells, false);
            }
            dataGV.Width = vwidth;
            if (dataGV.ScrollBars.Equals(ScrollBars.Both) | dataGV.ScrollBars.Equals(ScrollBars.Vertical))
            {
                dataGV.Width += 20;
            }
            dataGV.Refresh();
            #endregion

            #region CBFormations
            cbFormations.Items.Clear();
            // creation d’une liste des formations
            List<KeyValuePair<int, string>> FList = new List<KeyValuePair<int, string>>();
            FList.Add(new KeyValuePair<int, string>(0, "Formations"));
            cbFormations.Items.Add("Formations");
            // on parcourt le dataView des formations Dv_formation de la classe modele pour compléter la FList
            for (int i = 0; i < Controleur.Vmodele.Dv_formation.ToTable().Rows.Count; i++)
            {
                FList.Add(new KeyValuePair<int, string>((int)Controleur.Vmodele.Dv_formation.ToTable().Rows[i][0],
                                                             Controleur.Vmodele.Dv_formation.ToTable().Rows[i][1].ToString()));
            }
            // on lie la liste à la comboBox
            cbFormations.DataSource = FList;
            cbFormations.ValueMember = "Key";
            cbFormations.DisplayMember = "Value";
            cbFormations.Text = cbFormations.Items[0].ToString();
            cbFormations.DropDownStyle = ComboBoxStyle.DropDownList;
            #endregion
        }

        private void changefiltre()
        {
            string num = cbFormations.SelectedValue.ToString(); // on récupère la formation sélectionnée
            int n = Convert.ToInt32(num); //index

            if (n == 0) // cas de "toutes les formations"
                Controleur.Vmodele.Dv_personne.RowFilter = ""; // pour annuler le filtre
            else
            {
                string Filter = "IdFormation = '" + n + "'"; // filter sur IdFormation
                Controleur.Vmodele.Dv_personne.RowFilter = Filter; // on applique le filter à la dataView
            }
            dataGV.Refresh(); // mise à jour du dataGridView
        }

        private void cbFormations_SelectionChangeCommitted(object sender, EventArgs e)
        {
            changefiltre();
        }

        private void btnAjout_Click(object sender, EventArgs e)
        {
            // vérifier qu’une ligne est bien sélectionnée dans le dataGridView
            if (dataGV.SelectedRows.Count == 1)
            {
                // appel de la méthode du controleur en mode update et avec la valeur de l’IdPersonne en clé
                Controleur.crud_personne('c', "");
                // mise à jour du dataGridView en affichage
                bindingSource1.MoveLast();
                bindingSource1.MoveFirst();
                dataGV.Refresh();
            }
            else
            {
                MessageBox.Show("Sélectionner une ligne à modifier");
            }
        }

        private void btnModif_Click(object sender, EventArgs e)
        {
            // vérifier qu’une ligne est bien sélectionnée dans le dataGridView
            if (dataGV.SelectedRows.Count == 1)
            {
                // appel de la méthode du controleur en mode update et avec la valeur de l’IdPersonne en clé
                Controleur.crud_personne('u', dataGV.Rows[dataGV.SelectedRows[0].Index].Cells[0].Value.ToString());
                // mise à jour du dataGridView en affichage
                bindingSource1.MoveLast();
                bindingSource1.MoveFirst();
                dataGV.Refresh();
            }
            else
            {
                MessageBox.Show("Sélectionner une ligne à modifier");
            }
        }

        private void btnSuppr_Click(object sender, EventArgs e)
        {
            // vérifier qu’une ligne est bien sélectionnée dans le dataGridView
            if (dataGV.SelectedRows.Count == 1)
            {
                // appel de la méthode du controleur en mode update et avec la valeur de l’IdPersonne en clé
                Controleur.crud_personne('d', dataGV.Rows[dataGV.SelectedRows[0].Index].Cells[0].Value.ToString());
                // mise à jour du dataGridView en affichage
                bindingSource1.MoveLast();
                bindingSource1.MoveFirst();
                dataGV.Refresh();
            }
            else
            {
                MessageBox.Show("Sélectionner une ligne à Supprimer");
            }
        }

    }
}

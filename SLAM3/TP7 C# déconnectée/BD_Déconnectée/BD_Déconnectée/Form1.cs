using MySql.Data.MySqlClient;
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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void gestionDesPersonnesToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FormPersonne FP = new FormPersonne();
            FP.MdiParent = this;
            FP.Show();
        }

        private void gestionDesFormationsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormFormation FF = new FormFormation();
            FF.MdiParent = this;
            FF.Show();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Controleur.Vmodele.sedeconnecter();
        }

        private void importToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Controleur.init();
            Controleur.Vmodele.seconnecter();
            if (Controleur.Vmodele.Connopen == true)
            {
                Controleur.Vmodele.import();
                if (Controleur.Vmodele.Chargement == true)
                {
                    gestionDesDonneesToolStripMenuItem.Enabled = true;
                    Controleur.Vmodele.sedeconnecter();
                }
                else
                    MessageBox.Show("Problème d'importation");
            }
            else
                MessageBox.Show("Problème de connection à la BDD");
        }

    }
}

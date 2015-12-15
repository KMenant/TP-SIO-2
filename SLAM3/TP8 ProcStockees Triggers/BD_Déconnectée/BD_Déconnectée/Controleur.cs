using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BD_Déconnectée
{
    public static class Controleur
    {
        private static Modele vmodele;

        public static void init()
        {
            vmodele = new Modele();
        }

        public static void crud_personne(Char c, String cle)
        {
            // Le Char c correspond à l'action : c:create, u update, d delete,
            // la cle est celle de l'enregistrement sélectionné, vide si action d’ajout (c = ‘c’)

            int index = 0;
            FormCRUD formCRUD = new FormCRUD(); // création de la nouvelle forme
            if (c == 'c') // mode ajout donc pas de valeur à passer à la nouvelle forme
            {
                //on met les zones de texte de formCRUD à vide
                formCRUD.TxtNom.Text = "";
                formCRUD.TxtPrenom.Text = "";
                formCRUD.TxtForm.Text = "";
            }

            if (c == 'u' || c == 'd') // mode update ou delete donc on récupère les champs
            {
                string sortExpression = "IdPersonne";
                vmodele.Dv_personne.Sort = sortExpression; // on trie le DataView sur les IdPersonne

                // on recherche l’indice où se trouve la personne sélectionnée
                // grâce à la valeur passée en paramètre donc grâce à son Id
                index = vmodele.Dv_personne.Find(cle);

                // on remplit les zones par les valeurs du dataView correspondantes
                formCRUD.TxtNom.Text = vmodele.Dv_personne[index][1].ToString();
                formCRUD.TxtPrenom.Text = vmodele.Dv_personne[index][2].ToString();
                formCRUD.TxtForm.Text = vmodele.Dv_personne[index][3].ToString();
            }
            // on affiche la nouvelle form
            formCRUD.ShowDialog();
            // si l’utilisateur clique sur OK
            if (formCRUD.DialogResult == DialogResult.OK)
            {
                if (c == 'c') // ajout
                {
                    // on crée une nouvelle ligne dans le dataView
                    DataRowView newRow = vmodele.Dv_personne.AddNew();
                    newRow["nom"] = formCRUD.TxtNom.Text;
                    newRow["prenom"] = formCRUD.TxtPrenom.Text;
                    newRow["IdFormation"] = formCRUD.TxtForm.Text;
                    newRow.EndEdit();
                }

                if (c == 'u') // modif
                {
                    vmodele.Dv_personne[index]["nom"] = formCRUD.TxtNom.Text;
                    vmodele.Dv_personne[index]["prenom"] = formCRUD.TxtPrenom.Text;
                    vmodele.Dv_personne[index]["IdFormation"] = formCRUD.TxtForm.Text;
                }

                if (c == 'd') // suppression
                {
                    // on supprime l’élément du DataView
                    vmodele.Dv_personne.Table.Rows[index].Delete();
                }
                MessageBox.Show("OK : données enregistrées");
                formCRUD.Dispose(); // on ferme la form
            }
            else
            {
                MessageBox.Show("Annulation : aucune donnée enregistrée");
                formCRUD.Dispose();
            }
        }

        public static Modele Vmodele // Accesseur de vModele
        {
            get { return Controleur.vmodele; }
            set { Controleur.vmodele = value; }
        }
    }
}

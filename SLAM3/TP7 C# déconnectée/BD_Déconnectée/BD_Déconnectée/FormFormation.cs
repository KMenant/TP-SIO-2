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
    public partial class FormFormation : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public FormFormation()
        {
            InitializeComponent();
            chargedgv();
        }

        public void chargedgv()
        {
            bindingSource1.DataSource = Controleur.Vmodele.Dv_formation;
            dataGV.DataSource = bindingSource1;

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
        } 
    }
}

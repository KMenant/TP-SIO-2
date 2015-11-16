using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BD_Déconnectée
{
    public static class Controleur
    {
        private static Modele vmodele;

        public static void init()
        {
            vmodele = new Modele();
        }

        public static Modele Vmodele
        {
            get { return Controleur.vmodele; }
            set { Controleur.vmodele = value; }
        }
    }
}

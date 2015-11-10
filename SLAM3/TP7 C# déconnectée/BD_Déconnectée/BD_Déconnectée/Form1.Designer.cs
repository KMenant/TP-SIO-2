namespace BD_Déconnectée
{
    partial class Form1
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.connecterToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionDesPersonnesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.importToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exportToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionDesPersonnesToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionDesFormationsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.connecterToolStripMenuItem,
            this.gestionDesPersonnesToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(983, 24);
            this.menuStrip1.TabIndex = 2;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // connecterToolStripMenuItem
            // 
            this.connecterToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.importToolStripMenuItem,
            this.exportToolStripMenuItem});
            this.connecterToolStripMenuItem.Name = "connecterToolStripMenuItem";
            this.connecterToolStripMenuItem.Size = new System.Drawing.Size(59, 20);
            this.connecterToolStripMenuItem.Text = "Lien BD";
            // 
            // gestionDesPersonnesToolStripMenuItem
            // 
            this.gestionDesPersonnesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.gestionDesPersonnesToolStripMenuItem1,
            this.gestionDesFormationsToolStripMenuItem});
            this.gestionDesPersonnesToolStripMenuItem.Enabled = false;
            this.gestionDesPersonnesToolStripMenuItem.Name = "gestionDesPersonnesToolStripMenuItem";
            this.gestionDesPersonnesToolStripMenuItem.Size = new System.Drawing.Size(128, 20);
            this.gestionDesPersonnesToolStripMenuItem.Text = "Gestion des données";
            // 
            // importToolStripMenuItem
            // 
            this.importToolStripMenuItem.Name = "importToolStripMenuItem";
            this.importToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.importToolStripMenuItem.Text = "Import";
            // 
            // exportToolStripMenuItem
            // 
            this.exportToolStripMenuItem.Name = "exportToolStripMenuItem";
            this.exportToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.exportToolStripMenuItem.Text = "Export";
            // 
            // gestionDesPersonnesToolStripMenuItem1
            // 
            this.gestionDesPersonnesToolStripMenuItem1.Name = "gestionDesPersonnesToolStripMenuItem1";
            this.gestionDesPersonnesToolStripMenuItem1.Size = new System.Drawing.Size(196, 22);
            this.gestionDesPersonnesToolStripMenuItem1.Text = "Gestion des personnes";
            this.gestionDesPersonnesToolStripMenuItem1.Click += new System.EventHandler(this.gestionDesPersonnesToolStripMenuItem1_Click);
            // 
            // gestionDesFormationsToolStripMenuItem
            // 
            this.gestionDesFormationsToolStripMenuItem.Name = "gestionDesFormationsToolStripMenuItem";
            this.gestionDesFormationsToolStripMenuItem.Size = new System.Drawing.Size(196, 22);
            this.gestionDesFormationsToolStripMenuItem.Text = "Gestion des formations";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(983, 591);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = "Form1";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem connecterToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionDesPersonnesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem importToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exportToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionDesPersonnesToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem gestionDesFormationsToolStripMenuItem;
    }
}


namespace BD_Déconnectée
{
    partial class FormPersonne
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGV = new System.Windows.Forms.DataGridView();
            this.cbFormations = new System.Windows.Forms.ComboBox();
            this.lbFormations = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnModif = new System.Windows.Forms.Button();
            this.btnAjout = new System.Windows.Forms.Button();
            this.btnSuppr = new System.Windows.Forms.Button();
            this.btnInfo = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGV)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataGV
            // 
            this.dataGV.AllowUserToAddRows = false;
            this.dataGV.AllowUserToDeleteRows = false;
            this.dataGV.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGV.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGV.Location = new System.Drawing.Point(12, 63);
            this.dataGV.MultiSelect = false;
            this.dataGV.Name = "dataGV";
            this.dataGV.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGV.Size = new System.Drawing.Size(501, 323);
            this.dataGV.TabIndex = 0;
            // 
            // cbFormations
            // 
            this.cbFormations.FormattingEnabled = true;
            this.cbFormations.Location = new System.Drawing.Point(208, 23);
            this.cbFormations.Name = "cbFormations";
            this.cbFormations.Size = new System.Drawing.Size(121, 21);
            this.cbFormations.TabIndex = 1;
            this.cbFormations.SelectionChangeCommitted += new System.EventHandler(this.cbFormations_SelectionChangeCommitted);
            // 
            // lbFormations
            // 
            this.lbFormations.AutoSize = true;
            this.lbFormations.Location = new System.Drawing.Point(34, 26);
            this.lbFormations.Name = "lbFormations";
            this.lbFormations.Size = new System.Drawing.Size(97, 13);
            this.lbFormations.TabIndex = 2;
            this.lbFormations.Text = "Selection formation";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnInfo);
            this.groupBox1.Controls.Add(this.btnModif);
            this.groupBox1.Controls.Add(this.btnAjout);
            this.groupBox1.Location = new System.Drawing.Point(13, 393);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(500, 100);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            // 
            // btnModif
            // 
            this.btnModif.Location = new System.Drawing.Point(158, 41);
            this.btnModif.Name = "btnModif";
            this.btnModif.Size = new System.Drawing.Size(67, 23);
            this.btnModif.TabIndex = 1;
            this.btnModif.Text = "Modifier";
            this.btnModif.UseVisualStyleBackColor = true;
            this.btnModif.Click += new System.EventHandler(this.btnModif_Click);
            // 
            // btnAjout
            // 
            this.btnAjout.Location = new System.Drawing.Point(40, 40);
            this.btnAjout.Name = "btnAjout";
            this.btnAjout.Size = new System.Drawing.Size(75, 23);
            this.btnAjout.TabIndex = 0;
            this.btnAjout.Text = "Ajouter";
            this.btnAjout.UseVisualStyleBackColor = true;
            this.btnAjout.Click += new System.EventHandler(this.btnAjout_Click);
            // 
            // btnSuppr
            // 
            this.btnSuppr.Location = new System.Drawing.Point(400, 434);
            this.btnSuppr.Name = "btnSuppr";
            this.btnSuppr.Size = new System.Drawing.Size(75, 23);
            this.btnSuppr.TabIndex = 2;
            this.btnSuppr.Text = "Supprimer";
            this.btnSuppr.UseVisualStyleBackColor = true;
            this.btnSuppr.Click += new System.EventHandler(this.btnSuppr_Click);
            // 
            // btnInfo
            // 
            this.btnInfo.Location = new System.Drawing.Point(272, 41);
            this.btnInfo.Name = "btnInfo";
            this.btnInfo.Size = new System.Drawing.Size(75, 23);
            this.btnInfo.TabIndex = 2;
            this.btnInfo.Text = "Info";
            this.btnInfo.UseVisualStyleBackColor = true;
            this.btnInfo.Click += new System.EventHandler(this.btnInfo_Click);
            // 
            // FormPersonne
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(528, 497);
            this.Controls.Add(this.btnSuppr);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.lbFormations);
            this.Controls.Add(this.cbFormations);
            this.Controls.Add(this.dataGV);
            this.Name = "FormPersonne";
            this.Text = "FormPersonne";
            ((System.ComponentModel.ISupportInitialize)(this.dataGV)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGV;
        private System.Windows.Forms.ComboBox cbFormations;
        private System.Windows.Forms.Label lbFormations;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnModif;
        private System.Windows.Forms.Button btnAjout;
        private System.Windows.Forms.Button btnSuppr;
        private System.Windows.Forms.Button btnInfo;
    }
}
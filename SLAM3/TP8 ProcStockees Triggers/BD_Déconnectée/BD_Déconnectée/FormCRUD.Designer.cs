namespace BD_Déconnectée
{
    partial class FormCRUD
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
            this.lbNom = new System.Windows.Forms.Label();
            this.lbPrenom = new System.Windows.Forms.Label();
            this.lbForm = new System.Windows.Forms.Label();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.txtPrenom = new System.Windows.Forms.TextBox();
            this.txtForm = new System.Windows.Forms.TextBox();
            this.btnOK = new System.Windows.Forms.Button();
            this.btnAnnuler = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lbNom
            // 
            this.lbNom.AutoSize = true;
            this.lbNom.Location = new System.Drawing.Point(13, 13);
            this.lbNom.Name = "lbNom";
            this.lbNom.Size = new System.Drawing.Size(35, 13);
            this.lbNom.TabIndex = 0;
            this.lbNom.Text = "Nom :";
            // 
            // lbPrenom
            // 
            this.lbPrenom.AutoSize = true;
            this.lbPrenom.Location = new System.Drawing.Point(13, 48);
            this.lbPrenom.Name = "lbPrenom";
            this.lbPrenom.Size = new System.Drawing.Size(49, 13);
            this.lbPrenom.TabIndex = 1;
            this.lbPrenom.Text = "Prénom :";
            // 
            // lbForm
            // 
            this.lbForm.AutoSize = true;
            this.lbForm.Location = new System.Drawing.Point(13, 83);
            this.lbForm.Name = "lbForm";
            this.lbForm.Size = new System.Drawing.Size(59, 13);
            this.lbForm.TabIndex = 2;
            this.lbForm.Text = "Formation :";
            // 
            // txtNom
            // 
            this.txtNom.Location = new System.Drawing.Point(95, 10);
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(100, 20);
            this.txtNom.TabIndex = 3;
            // 
            // txtPrenom
            // 
            this.txtPrenom.Location = new System.Drawing.Point(95, 45);
            this.txtPrenom.Name = "txtPrenom";
            this.txtPrenom.Size = new System.Drawing.Size(100, 20);
            this.txtPrenom.TabIndex = 4;
            // 
            // txtForm
            // 
            this.txtForm.Location = new System.Drawing.Point(95, 80);
            this.txtForm.Name = "txtForm";
            this.txtForm.Size = new System.Drawing.Size(100, 20);
            this.txtForm.TabIndex = 5;
            // 
            // btnOK
            // 
            this.btnOK.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.btnOK.Location = new System.Drawing.Point(20, 119);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 23);
            this.btnOK.TabIndex = 6;
            this.btnOK.Text = "OK";
            this.btnOK.UseVisualStyleBackColor = true;
            // 
            // btnAnnuler
            // 
            this.btnAnnuler.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnAnnuler.Location = new System.Drawing.Point(124, 118);
            this.btnAnnuler.Name = "btnAnnuler";
            this.btnAnnuler.Size = new System.Drawing.Size(75, 23);
            this.btnAnnuler.TabIndex = 7;
            this.btnAnnuler.Text = "Annuler";
            this.btnAnnuler.UseVisualStyleBackColor = true;
            // 
            // FormCRUD
            // 
            this.AcceptButton = this.btnOK;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnAnnuler;
            this.ClientSize = new System.Drawing.Size(218, 171);
            this.Controls.Add(this.btnAnnuler);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.txtForm);
            this.Controls.Add(this.txtPrenom);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.lbForm);
            this.Controls.Add(this.lbPrenom);
            this.Controls.Add(this.lbNom);
            this.Name = "FormCRUD";
            this.Text = "FormCRUD";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbNom;
        private System.Windows.Forms.Label lbPrenom;
        private System.Windows.Forms.Label lbForm;
        private System.Windows.Forms.TextBox txtNom;
        private System.Windows.Forms.TextBox txtPrenom;
        private System.Windows.Forms.TextBox txtForm;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnAnnuler;

        public System.Windows.Forms.TextBox TxtNom
        {
            get { return txtNom; }
            set { txtNom = value; }
        }
        public System.Windows.Forms.TextBox TxtForm
        {
            get { return txtForm; }
            set { txtForm = value; }
        }
        public System.Windows.Forms.TextBox TxtPrenom
        {
            get { return txtPrenom; }
            set { txtPrenom = value; }
        }
    }
}
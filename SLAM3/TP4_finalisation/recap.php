<?php
include_once('class/autoload.php');

$pageRecap = new page_base("Recapitulatif");

	$ConnexionBaseSIO = new Connexion();
	$IDconnexion = $ConnexionBaseSIO->IDconnexion;

$email = '';

	$pageRecap->corps .= '
		</br></br>RECAPITUALTIF :
		</br></br>
		';
		
	if (isset($_POST['email']) && isset($_POST['motpasse']) )
		{
			$email = $_POST['email'];
			$mdp = $_POST['motpasse'];
		}

	$pageRecap->corps .= 'email : ' . $email  . '</br>mot de passe : '. $mdp;
	
	$requete='INSERT INTO etudiant (nom, prenom, departement, pays, date_naiss, sexe, telephone, email, mdp, IdFormation, IdSpecialite) 
			  VALUES ("'.$_POST['nom'].'", 
			  	"'.$_POST['prenom'].'", 
			  	'.$_POST['dept'].', 
			  	"'.$_POST['pays'].'", 
			  	'.$_POST['date_naiss'].', 
			  	'.$_POST['sexe'].', 
			  	'.$_POST['tel'].', 
			  	"'.$_POST['email'].'", 
			  	"'.$_POST['motpasse'].'", 
			  	'.$_POST['IdFormation'].', 
			  	'.$_POST['IdSpecialite'].',
			  	1, 
			  	1);'; 

    //$IDconnexion -> quote(string $chaine) ; 

    $nblignes = $IDconnexion -> exec($requete);



		

	$pageRecap->afficher();
	
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
		
	if (isset($_POST['sexe']) == 'sexeH')    //Si Homme alors sexe = 1
		$sexe = 1;
	else
		$sexe = 0;

	$pageRecap->corps .= 'email : ' . $email  . 
						 '</br>mot de passe : '. $mdp .
						 '</br>nom : '.$_POST['nom'].
						 '</br>prenom : '.$_POST['prenom'].
						 '</br>dept : '.$_POST['dept'].
						 '</br>pays : '.$_POST['pays'].
						 '</br>date naiss : '.$_POST['datepicker']. //marche pas
						 '</br>sexe : '.$sexe.
						 '</br>tel : '.$_POST['tel'].
						 '</br>Competence : '.$_POST['competent[]']. //marche pas
						 '</br>IdFormation : '.$_POST['maForm'].
						 '</br>IdSpecialite : '.$_POST['maSpe'];
	
	$requete='INSERT INTO etudiant (nom, prenom, departement, pays, date_naiss, sexe, telephone, email, mdp, IdFormation, IdSpecialite) 
			  VALUES ("'.$_POST['nom'].'", 
			  	"'.$_POST['prenom'].'", 
			  	'.$_POST['dept'].', 
			  	"'.$_POST['pays'].'", 
			  	'.$_POST['datepicker'].', 
			  	'.$sexe.', 
			  	'.$_POST['tel'].', 
			  	"'.$_POST['email'].'", 
			  	"'.$_POST['motpasse'].'", 
			  	'.$_POST['IdFormation'].', 
			  	'.$_POST['IdSpecialite'].');'; 

    //$IDconnexion -> quote(string $chaine) ; 

    $nblignes = $IDconnexion -> exec($requete);


	$pageRecap->afficher();
	
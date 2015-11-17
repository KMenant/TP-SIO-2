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
	
	$requete='INSERT INTO etudiant (email, mdp, nom, prenom, departement, pays, date_naiss, sexe, telephone,IdFormation, IdSpecialite) 
			  VALUES (
			  	"'.$IDconnexion->quote($_POST['email']).'", 
			  	"'.$IDconnexion->quote($_POST['motpasse']).'", 
			  	"'.$IDconnexion->quote($_POST['nom']).'", 
			  	"'.$IDconnexion->quote($_POST['prenom']).'", 
			  	 '.$IDconnexion->quote($_POST['dept']).', 
			  	"'.$IDconnexion->quote($_POST['pays']).'", 
			  	 '.$IDconnexion->quote($_POST['datepicker']).', 
			  	 '.$IDconnexion->quote($sexe).', 
			  	 '.$IDconnexion->quote($_POST['tel']).', 
			  	 '.$IDconnexion->quote($_POST['IdFormation']).', 
			  	 '.$IDconnexion->quote($_POST['IdSpecialite']).');'; 

    $nblignes = $IDconnexion -> exec($requete);
	
	if ($nblignes == 1)
		echo('Ajouté');
	else
		echo('Problème');


	$pageRecap->afficher();
	
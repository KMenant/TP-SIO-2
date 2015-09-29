<?php
include_once('class/autoload.php');

$pageRecap = new page_base("Recapitulatif");

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
	


		

	$pageRecap->afficher();
	
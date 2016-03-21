<?php
require_once('./class/Connexion.class.php');

if(isset($_GET['IdFormation'])) {

	$json = array();
	
	// on récupère l'Id de la région sélectionnée
	$idF = htmlentities(intval($_GET['IdFormation']));
			
	// requête qui récupère les départements selon la région
	$requete = "SELECT * FROM specialite WHERE IdFormation = ". $idF.";" ;
		
	     
    // exécution de la requête
		$newConnexion = new Connexion();
		$idD = $newConnexion->IDconnexion;
		$resultat = $idD->query($requete);
     
    foreach($resultat as $donnees) {
			$valeur = $donnees->Libelle;
	
			$json[$donnees->IdSpecialite] = utf8_encode($valeur);
			}
		}
    // envoi du résultat au success
    echo json_encode($json);

?>
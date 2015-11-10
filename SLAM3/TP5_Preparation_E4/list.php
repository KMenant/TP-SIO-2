<?php
include_once('class/autoload.php');

$pageInitiale = new page_base("Formulaire");

	$ConnexionBaseSIO = new Connexion();
	$IDconnexion = $ConnexionBaseSIO->IDconnexion;

	if (!$IDconnexion){
		$pageInitiale->corps = 'Problème d\'accès à la base de données </article></section>';
	}
	else
	{

		$CollFormations = $IDconnexion->query("SELECT * FROM formation");

		// suite du code permettant de créer le formulaire dans le corps de la page
		$pageInitiale->corps .= ' bd connectée </br>
			<form method="post" action="recap.php" name="formulaire" onsubmit="return valider ();">
					<div>
						<label for="specialite">Formation</label>
						<select id="laForm" name="laForm" >';
							foreach ($CollFormations as $f) {
								$pageInitiale->corps .= '<option value='.$f->IdFormation.'>'.$f->Intitule.'</option>';
							}
						$CollFormations -> closeCursor(); // pour libérer la mémoire occupée par le résultat de la requête   
						$CollFormations = null ; // pour une autre exécution avec cette variable

						$pageInitiale->corps .= '</select>
					</div>
					<div>
						<label for="etudiant">Etudiant inscrits</label>
						<select id="lesEtud" name="lesEtud" >
						<option value=" ">--etu---</option>
						</select>
					</div>
					<p id="nbr">Il y a </p>
			</form>';
			
	}



$pageInitiale->afficher();








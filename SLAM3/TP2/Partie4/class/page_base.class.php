<?php

class page_base {

	protected $titre;
	private $style=array('base', 'modele');
	protected $entete;
	protected $menu;
	protected $corps;
	private $page;
	
	public function __construct($p) {
		$this->page = $p;
	}

	public function __set($propriete, $valeur) {
		switch ($propriete) {
			case 'style' : {
				$this->style[count($this->style)+1] = $valeur;
				break;
			}
			case 'entete' : {
				$this->entete = $valeur;
				break;
			}		
			case 'corps' : {
				$this->corps = $valeur;
				break;
			}
			case 'titre' : {
				$this->titre = $valeur;
				break;
			}
			case 'menu' : {
				$this->menu = $valeur;
				break;
			}
		}
	}
	/****************************** Gestion du titre  ************************************************/
	/*Insertion du titre */
	private function affiche_titre() {
		echo $this->titre;
	}
	
	
	
	/******************************Gestion des styles **********************************************/
	/* Insertion des feuilles de style */
	private function affiche_style() {
		foreach ($this->style as $s) {
			echo "<link rel='stylesheet'  href='styles/".$s.".css' />\n";
		}
	}
	
	protected function affiche_menu() {
		?>
            <nav>
                  <ul>
				<li><a href="index.php">Accueil</a></li>
				<li><a href="inscription.php">Inscription</a></li>
				</ul>
            </nav>
		<?php
	}

	protected function affiche_contenu() {
		echo $this->corps;
	}
	
	/********************************************* Fonction permettant l'affichage de la page ****************/
	public function affiche() {
		?>
			<!DOCCTYPE html>
			<html lang='fr'>
				<head>
					<title>
						<?php $this->affiche_titre(); ?>
					</title>
					<meta charset="utf-8" />

					<link rel="stylesheet"
					href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css"
					type="text/css" media="all" />
					<link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docstheme/ui.theme.css"
					type="text/css" media="all" />

					<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"
					type="text/javascript"></script>
					<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"
					type="text/javascript"></script> 

					<?php 
						$this->affiche_style(); 
					?>
					
				</head>
				<body>
				<div id="global">
					<div id="centre">
					<?php $this->affiche_menu(); ?>
					<section>
					<?php $this->affiche_contenu(); ?>
					</section>
					</div>
				</div>
				</body>
			</html>
		<?php
	}
}

?>

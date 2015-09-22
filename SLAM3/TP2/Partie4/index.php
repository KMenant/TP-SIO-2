<?php
   	include_once('class/autoload.php');

	$site = new page_base('Accueil');
	$site->corps = "
				<article>
					<h2>Bonjours</h2>
					<h3>.............................;</h3>
					<p>Ce site est là pour partager</p>

					<p>Ce site est mis en forme par deux feuilles de styles:</p>
					<ol>
						<li><a href=\"styles/base.css\">base.css</a> (mise en forme
							minimale du texte, commune à tous les gabarits)</li>
						<li><strong><a href=\"styles/modele.css\">modele.css</a>
						</strong>, qui contient tous les styles propres à ce gabarit,
						et que je vous invite à consulter.</li>
					</ol>
					<p>Le programme de SI7 se trouve là :</p>
					<li><a href=\"progressionSI7.ppsx\">progression SI7</a> (contenu du module...)</li>
			
					<p>Pour voir le détail des cours et TP, balladez-vous sans modération dans le menu</p>
                </article>
		";
	$site->affiche();
?>

<html>
<title>Lecture du XML en PHP </title>
<style>
body {
	font-family: Calibri, Helvetica, sans-serif;
}

h3 {
	font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: normal;
}

table {
    border-collapse: collapse;
    border-radius: 3px;
    border: 1px solid #ddd;
    width: 70%;
}

th, td {
    text-align: left;
    padding: 8px;
    border-bottom: 1px solid #ddd;
}
th {
    background-color: #4CAF50;
    color: white;
}

tr:nth-child(odd) {background-color: #ddd}

</style>
<body>
	<?php

		$factures = new DOMDocument();

		$factures-> load("facture.xml") or die ("fichier introuvable");

		//récupère tous les informations de toutes les organisations dans une liste
		$Organisation_list = $factures->getElementsByTagName("Organisation");

		//si je veux récuperer que la première ligne de ma liste
		printf("Vendeur : %s  <p>", $Organisation_list->item(0)->getElementsByTagName("Nom")->item(0)->nodeValue);
		printf("Client : %s  <p>", $Organisation_list->item(1)->getElementsByTagName("Nom")->item(0)->nodeValue);

		//boucle permettant de récupérer toutes les organisations
		//foreach ($Organisation_list as $uneOrganisation) {
		//}

		foreach ($factures->getElementsByTagName("Facture") as $uneFacture) {

			$numero=$uneFacture->getAttribute("id");
			$date=$uneFacture->getElementsByTagName("Date")->item(0)->nodeValue;

			echo("<table>
				<caption> <h3>Facture n°".$numero." du ".$date."</h3> </caption>
					<tr>
						<th> Référence  </th>
						<th> Intitulé </th>
						<th> Quantité </th>
						<th> Prix </th>
						<th> Total </th>
					</tr>");

			//récupération des différentes lignes  des articles du bon de commande : inspirez-vous de l'organisation.
			$Ligne_list = $uneFacture->getElementsByTagName("Ligne");

			$Montant_total=0;
			foreach ($Ligne_list as $uneLigne) {
				echo("<tr>");
					echo("<td>" . $uneLigne->getElementsByTagName("Reference")->item(0)->nodeValue . "</td>");
					echo("<td>" . $uneLigne->getElementsByTagName("Intitule")->item(0)->nodeValue . "</td>");
					echo("<td>" . $uneLigne->getElementsByTagName("Quantite")->item(0)->nodeValue . "</td>");
					echo("<td>" . $uneLigne->getElementsByTagName("Prix")->item(0)->nodeValue . "</td>");
					$total=$uneLigne->getElementsByTagName("Prix")->item(0)->nodeValue*$uneLigne->getElementsByTagName("Quantite")->item(0)->nodeValue;
					echo("<td>" . $total . "</td>");
					$Montant_total+=$total;
				echo("</tr>");
			}
			echo("</table>");


			//récupération du montant total du bon de commande
			echo("Montant total : ". $Montant_total);
		}

	?>
</body>
</html>
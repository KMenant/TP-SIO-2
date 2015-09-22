<?php
   	include_once('class/autoload.php');

	$site = new page_base('Accueil');
	$site->corps = '
				<article>
					<h2>Formulaire</h2>
					<h3>Ceci est un test</h3>
					<form action="#" name="formulaire" onsubmit="return valider ();">
						<table cellspacing="2" cellpadding="2" border="0">
							<tr>
								<td align="right">Nom de famille</td>
								<td><input type="text" id="NomFamille"></td>
							</tr>
							<tr>
								<td align="right">Prenom</td>
								<td><input type="text" id="Prenom"></td>
							</tr>
							<tr>
								<td align="right">Age</td>
								<td><input type="number" id="Age"></td>
							</tr>
							<tr>
								<td align="right">Adresse</td>
								<td><textarea cols="20" rows="5" id="Adresse"></textarea></td>
							</tr>
							<tr>
								<td align="right"></td>
								<td><input type="reset" value="Effacer" onclick="effacer ();"></td>
							</tr>
							<tr>
								<td align="right"></td>
								<td><input type="submit" id="soumettre" value="Soumettre"></td>
							</tr>
						</table>
					</form>

					<script language="javascript">

						$(function() {
								$( "#soumettre" ).click(function()
								{
										valid = true;

										if($("#NomFamille").val() == "" )
										{
											$("#NomFamille").css("background-color","#FF0000");
											valid = false;
										}

										if ($("#Prenom").val() == "" )
										{
											$("#Prenom").css("background-color","#FF0000");
											valid = false;
										}

										if ($("#Age").val() == "" )
										{
											$("#Age").css("background-color","#FF0000");
											valid = false;
										}

										if ($("#Adresse").val() == "" )
										{
											$("#Adresse").css("background-color","#FF0000");
											valid = false;
										}

										return valid;
								});
							});

					</script>
                </article>
		';
	$site->affiche();
?>

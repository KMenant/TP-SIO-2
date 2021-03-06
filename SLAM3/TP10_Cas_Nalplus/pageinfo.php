<?php

	include_once('class/autoload.php');

	$Controlleur = new Controlleur();
	$BDD = $Controlleur->BDD;

	if (!$BDD)
		echo('Problème d\'accès à la base de données');
	else
	{
		$id = $_GET['id'];
		$programmme = $BDD->query("SELECT * FROM PROGRAMME WHERE CODE = ".$id.";");
		
 		$programmme = $programmme->fetch(PDO::FETCH_BOTH);

		echo('
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Foundation 5</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/css/normalize.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/css/foundation.min.css">
	<link href="http://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css" rel="stylesheet" type="text/css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
</head>
<body>

	<div class="row">
		<div class="large-12 columns">
			<div class="nav-bar right">
				<ul class="button-group">
					<li><a href="#" class="button">Link 1</a></li>
					<li><a href="#" class="button">Link 2</a></li>
					<li><a href="#" class="button">Link 3</a></li>
					<li><a href="#" class="button">Link 4</a></li>
				</ul>
			</div>
			<h1>Blog <small>This is my blog. It\'s awesome.</small></h1>
			<hr/>
		</div>
	</div>


	<div class="row">

		<div class="large-9 columns" role="content">
			<article>
				<h3><a href="#">'. addslashes($programmme['TITRE']) .'</a></h3>
				<h6>Réalisé par <a href="#">John Smith</a> le '. addslashes($programmme['ANNEEREALISATION']) .'</h6>
				<p>'. addslashes($programmme['DESCRIPTION']) .'</p>
			</article>
			<hr/>
		</div>


		<aside class="large-3 columns">
			<h5>Categories</h5>
			<ul class="side-nav">
				<li><a href="#">News</a></li>
				<li><a href="#">Code</a></li>
				<li><a href="#">Design</a></li>
				<li><a href="#">Fun</a></li>
				<li><a href="#">Weasels</a></li>
			</ul>
			<div class="panel">
				<h5>Featured</h5>
				<p>Pork drumstick turkey fugiat. Tri-tip elit turducken pork chop in. Swine short ribs meatball irure bacon nulla pork belly cupidatat meatloaf cow.</p>
				<a href="#">Read More &rarr;</a>
			</div>
		</aside>

	</div>


	<footer class="row">
		<div class="large-12 columns">
			<hr/>
			<div class="row">
				<div class="large-6 columns">
					<p>&copy; Copyright no one at all. Go to town.</p>
				</div>
				<div class="large-6 columns">
					<ul class="inline-list right">
						<li><a href="#">Link 1</a></li>
						<li><a href="#">Link 2</a></li>
						<li><a href="#">Link 3</a></li>
						<li><a href="#">Link 4</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>
');
	}
	?>
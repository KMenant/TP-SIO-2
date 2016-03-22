<?php

	include_once('class/autoload.php');

	$Controlleur = new Controlleur();
	$BDD = $Controlleur->BDD;

	if (!$BDD)
		echo('Problème d\'accès à la base de données');
	else
	{
		echo ('
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

			<div class="row">
				<div class="large-12 columns">
					<nav class="top-bar" data-topbar>
						<ul class="title-area">

							<li class="name">
							<h1><a href="#">Programme</a></h1>
							</li>
							<li class="toggle-topbar menu-icon">
								<a href="#"><span>menu</span></a>
							</li>
						</ul>
						<section class="top-bar-section">

							<ul class="right">
								<li class="divider"></li>
								<li class="has-dropdown">
									<a href="#">Main Item 1</a>
									<ul class="dropdown">
										<li><label>Section Name</label></li>
										<li class="has-dropdown">
											<a class="" href="#">Has Dropdown, Level 1</a>
											<ul class="dropdown">
												<li>
													<a href="#">Dropdown Options</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="#">Dropdown Option</a>
										</li>
										<li class="divider"></li>
										<li><label>Section Name</label></li>
										<li>
											<a href="#">Dropdown Option</a>
										</li>
										<li>
											<a href="#">Dropdown Option</a>
										</li>
										<li>
											<a href="#">Dropdown Option</a>
										</li>
										<li class="divider"></li>
										<li>
											<a href="#">See all →</a>
										</li>
									</ul>
								</li>
								<li class="divider"></li>
								<li>
									<a href="#">Main Item 2</a>
								</li>
								<li class="divider"></li>
								<li class="has-dropdown">
									<a href="#">Main Item 3</a>
									<ul class="dropdown">
										<li>
											<a href="#">Dropdown Option</a>
										</li>
										<li class="divider"></li>
										<li>
											<a href="#">See all →</a>
										</li>
									</ul>
								</li>
							</ul>
						</section>
					</nav> 
				</div>
			</div> 

			<div class="row">
				<div class="large-4 small-12 columns">
					<img src="">
					<div class="hide-for-small panel">
						<div class="subheader" id="chaines">
							'. $Controlleur->chaines() .'
						</div>
					</div>
				</div> 

				<div class="large-8 columns">
					<div class="row" id="programmes">
						'. $Controlleur->programmes() .'
					</div> 

					<div class="row">
						<div class="large-12 columns">
							<div class="panel">
								<div class="row">
									<div class="large-2 small-6 columns"><img src="http://placehold.it/300x300&amp;text=Site%20Owner"></div>
									<div class="large-10 small-6 columns">
										<strong>This Site Is Managed By</strong>
										<hr>
										Risus ligula, aliquam nec fermentum vitae, sollicitudin eget urna. Donec dignissim nibh fermentum
										odio ornare sagittis
									</div>
								</div>
							</div>
						</div> 
					</div>
				</div>
			</div> 
			<footer class="row">
				<div class="large-12 columns">
					<hr>
					<div class="row">
						<div class="large-6 columns">
							<p>© Copyright no one at all. Go to town.</p>
						</div>
						<div class="large-6 columns">
							<ul class="inline-list right">
								<li>
									<a href="#">Link 1</a>
								</li>
								<li>
									<a href="#">Link 2</a>
								</li>
								<li>
									<a href="#">Link 3</a>
								</li>
								<li>
									<a href="#">Link 4</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer> 
		</div>
	</div>
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
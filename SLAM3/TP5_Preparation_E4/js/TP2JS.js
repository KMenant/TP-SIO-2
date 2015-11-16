 $(function() {
        $( "#datepicker" ).datepicker();
    });
	
function surligne(champ, erreur)
{
   if(erreur)
      champ.style.backgroundColor = "#fba";
   else
      champ.style.backgroundColor = "";
}

function valider ( )
{
var valid=true;
    if ( document.forms['formulaire'].elements['email'].value == "" )
    {
        alert ( "Veuillez entrer votre email !"  );
        valid = false;
    return valid;
    }
    else if ( !verifMail(document.forms['formulaire'].elements['email']) )
    {
        alert ( "Veuillez entrer un email valide !"  );
        valid = false;
    return valid;
    }
		
	if ( document.forms['formulaire'].elements['motpasse'].value == "" )
    {
        alert ( "Veuillez entrer un mot de passe !" );
        valid = false;
		return valid;
    }

    if ( !verifChaine(document.forms['formulaire'].elements['comm'].value))
    {
        alert ( "Veuillez entrer un commentaire valide !"  );
        valid = false;
        return valid;
    }

	
		if ( !verifSexe())
		{
			alert ( "Veuillez cocher votre sexe !" );
			valid=false;
			return valid;
		}
		
		if ( !verifCompetences())
		{
			alert ( "Veuillez cocher au moins une compétence !" );
			valid=false;
			return valid;
		}	

	return true;
	

}

function verifChaine(champ)
{
var regex = /^([a-zA-Z'àâéèêôùûçÀÂÉÈÔÙÛÇ-\s]{1,30})$/;
   if(!regex.test(champ.value))
   {
      surligne(champ, true);
      alert ( "Veuillez entrer une chaine valide !"  );
      return false;
   }
   else
   {
      surligne(champ, false);
      return true;
   }
}
function verifMail(champ)
{
   var regex = /^[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/;

   if(!regex.test(champ.value))
   {
      surligne(champ, true);
      return false;
   }
   else
   {
      surligne(champ, false);
      return true;
   }
}

function verifMDP(motP)
{
	if (motP.value.length < 6)
	{
			alert("Votre mot de passe doit avoir au moins 6 caractères !");
		  return false;
	}
  else
  {
      surligne(motP, false);
      return true;
  }
}

function verifTel(champ)
{
   var regex = /^0[0-9]([ .-]?[0-9]{2}){4}$/;  
   if(!regex.test(champ.value))
   {
      surligne(champ, true);
      return false;
   }
   else
   {
      surligne(champ, false);
      return true;
   }

}

function verifSexe()
{
   if ( document.forms['formulaire'].elements['nom'].value != "" )
   {
	   if(document.forms['formulaire'].elements['sexeH'].checked || document.forms['formulaire'].elements['sexeF'].checked )
	   {
		  return true;
	   }
	   else
	   {
		  return false;
	   }
   }
   else 
	return true;

}

function verifCompetences()
{
   if ( document.forms['formulaire'].elements['nom'].value != "" )
   {
	   var checked = 0;
	   var mybox = document.forms['formulaire'].elements['competent[]'];
	   for (i=0; i<mybox.length; i++) {
		  if (mybox[i].checked==true) {
			 checked=1;
			 return true;
		  }
	   }
	   return false;
   }
   else 
		return true;
   
  
}
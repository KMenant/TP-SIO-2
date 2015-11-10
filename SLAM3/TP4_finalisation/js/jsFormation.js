$(document).ready(function() {
    console.log( "ready!" );  

    // à la sélection d une formation dans la liste
    $('#maForm').change(function(){
        var val = $(this).val(); // on récupère la valeur de la région
        console.log("numéro de la formation : "+ val);

        if(val != " ") {
            $('#maSpe').empty(); // on vide la liste des départements

            var filterDataRequest = $.ajax({
              url: 'traitement_choisir_formation_JS.php',
              type: 'GET',
                data: 'IdFormation='+ val, // on envoie $_GET['IdRegion']
                dataType: 'json'
              });

            filterDataRequest.done(function(data) {
              console.log("success");
              console.log(data);
              $.each(data, function(index, value) {
                $('#maSpe').append('<option value='+ index +'>'+ value +'</option>');
              });   
            });

            filterDataRequest.fail(function(jqXHR, textStatus) {
              console.log( "error" );   
              if (jqXHR.status === 0){alert("Not connect.n Verify Network.");}
              else if (jqXHR.status == 404){alert("Requested page not found. [404]");}
              else if (jqXHR.status == 500){alert("Internal Server Error [500].");}
              else if (textStatus === "parsererror"){alert("Requested JSON parse failed.");}
              else if (textStatus === "timeout"){alert("Time out error.");}
              else if (textStatus === "abort"){alert("Ajax request aborted.");}
              else{alert("Uncaught Error.n" + jqXHR.responseText);}
            });
            filterDataRequest.always(function() {
              console.log( "complete" );
            }); 
        }// fin du if val est vide
      });
});

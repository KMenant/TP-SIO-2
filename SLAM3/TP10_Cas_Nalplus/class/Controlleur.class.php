<?php
require_once 'MyPDO.class.php';

class Connexion{

    private $PARAM_hote='localhost';
    private $PARAM_utilisateur='root'; 
    private $PARAM_mot_passe=''; 
    private $PARAM_nom_bd='slam3-tp3-km'; //nom de la base de données
	
    private $BDD;
	
    public function __construct() {
    	try {  		
        	$this->BDD = new MyPDO('mysql:host='.$this->PARAM_hote.';dbname='.$this->PARAM_nom_bd, $this->PARAM_utilisateur, $this->PARAM_mot_passe);
    		//Il faut ajouter pour gerer les accents et caractères non utf8
    		$this->BDD->exec("SET NAMES 'utf8'");
    	}
    	catch (PDOException $e)
    	{
    		echo 'hote: '.$this->PARAM_hote.' '.$_SERVER['DOCUMENT_ROOT'].'<br />';
    		echo 'Erreur : '.$e->getMessage().'<br />';
    		echo 'N° : '.$e->getCode();
    		$this->BDD=false;
      	}
    }
    public function __get($propriete) {
    	switch ($propriete) {
    		case 'BDD' :
    			{
    				return $this->BDD;
    				break;
    			}
    	}
    }

    public function chaines()
    {
        $retour='';
        $result= $this->vpdo->return_chaines();
        while ($row =$result->fetch())
        {
            $retour = $retour . '
            <a href="#">
                <div class="panel callout radius">
                    <h6>'.$row['NOMCHAINE'].'</h6>
                </div>
            </a>';
        }
        return $retour;
    }

    public function programmes()
    {
        $retour='';
        $result= $this->vpdo->return_programmes();
        while ($row =$result->fetch())
        {
            $retour = $retour . '
            <div class="large-4 small-6 columns">
                <div class="panel">
                    <h5>'.$row['TITRE'].'</h5>
                    <h6 class="subheader">'.$row['TYPEPROGRAMME'].'</h6>
                </div>
            </div>';
        }
        return $retour;
    }
}
?>

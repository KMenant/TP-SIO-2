<?php
require_once 'MyPDO.class.php';

class Connexion{

    private $PARAM_hote='localhost';
    private $PARAM_utilisateur='root'; 
    private $PARAM_mot_passe=''; 
    private $PARAM_nom_bd='slam3-tp3-km'; //nom de la base de données
	
    private $IDconnexion;
	
    public function __construct() {
    	try {  		
        	$this->IDconnexion = new MyPDO('mysql:host='.$this->PARAM_hote.';dbname='.$this->PARAM_nom_bd, $this->PARAM_utilisateur, $this->PARAM_mot_passe);
		//Il faut ajouter pour gerer les accents et caractères non utf8
		$this->IDconnexion->exec("SET NAMES 'utf8'");
    	}
    	catch (PDOException $e)
    	{
    		echo 'hote: '.$this->PARAM_hote.' '.$_SERVER['DOCUMENT_ROOT'].'<br />';
    		echo 'Erreur : '.$e->getMessage().'<br />';
    		echo 'N° : '.$e->getCode();
    		$this->IDconnexion=false;
      	}
    }
    public function __get($propriete) {
    	switch ($propriete) {
    		case 'IDconnexion' :
    			{
    				return $this->IDconnexion;
    				break;
    			}
    	}
    }
}
?>

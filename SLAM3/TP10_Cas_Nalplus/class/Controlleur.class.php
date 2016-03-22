<?php
require_once 'MyPDO.class.php';

class Controlleur{

    private $PARAM_hote='192.168.215.10';
    private $PARAM_utilisateur='root'; 
    private $PARAM_mot_passe=''; 
    private $PARAM_nom_bd='tp10'; //nom de la base de données
	
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
        $result= $this->BDD->return_chaines();
        while ($row =$result->fetch())
        {
            $retour = $retour . '
            <a href="index.php?id='.$row->ID.'">
                <div class="panel callout radius">
                    <h6>'.$row->NOMCHAINE.'</h6>
                </div>
            </a>';
        }
        return $retour;
    }

    public function programmes()
    {
        $retour='';
        $result;
        if(isset($_GET['id']))
            $result= $this->BDD->return_programmes_chaine($_GET['id']);
        else
            $result= $this->BDD->return_programmes();
        while ($row =$result->fetch())
        {
            $retour = $retour . '
            <a href="pageinfo.php?id='.$row->CODE.'">
                <div class="large-6 small-8 columns">
                    <div class="panel">
                        <h5>'.$row->TITRE.'</h5>
                        <h6 class="subheader">'.$row->TYPEPROGRAMME.'</h6>
                        <h7 class="subheader">'.$row->DATE.' '.$row->HEURE.'</h7>
                    </div>
                </div>
            </a>';
        }
        return $retour;
    }
}
?>

<?php
class MyPDO extends PDO
{
    public function __construct($dsn, $user=NULL, $password=NULL)
    {
        parent::__construct($dsn, $user, $password);
//dire comment on veut traiter les erreurs ici gestion avec les exceptions try catch
        $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
	
//méthode exec pour les requêtes de type INSERT, UPDATE et DELETE
    public function exec($sql)
    {		
		return (parent::exec($sql));
    }
	
//méthode query pour les requêtes de type SELECT
    public function query($sql)
    {   
		$result = parent::query($sql);	
		$result->setFetchMode(PDO::FETCH_OBJ); 
//resultat de la requête retournée sous la forme d'objets     
        return $result;
    }

    public function return_chaines()
    {
        $requete = 'SELECT * FROM CHAINE;';
        $result = $this->query($requete);
        if ($result) {
            if ($result->rowCount() >= 1) {
                return ($result);
            }
        }
    }

    public function return_programmes()
    {
        $requete = 'SELECT * FROM PROGRAMME as P INNER JOIN TYPE as T ON P.ID_T = T.ID INNER JOIN DIFFUSER as D ON P.CODE = D.CODE;';
        $result = $this->query($requete);
        if ($result) {
            if ($result->rowCount() >= 1) {
                return ($result);
            }
        }
    }

    public function return_programmes_chaine($chaine)
    {
        $requete = 'SELECT * FROM PROGRAMME as P INNER JOIN TYPE as T ON P.ID_T = T.ID INNER JOIN DIFFUSER as D ON P.CODE = D.CODE WHERE D.ID = '.$chaine.';';
        $result = $this->query($requete);
        if ($result) {
            if ($result->rowCount() >= 1) {
                return ($result);
            }
        }
    }
}
?>	
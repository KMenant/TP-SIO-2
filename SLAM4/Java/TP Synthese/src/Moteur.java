import java.util.ArrayList;

public class Moteur {

	protected TypeMoteur type;
	protected String cylindre;
	protected double prix;
	
	public Moteur(String cyl, double pri){
		cylindre = cyl;
		prix = pri;
	}
	
	public String toString(){
		String result = "Moteur : " + type + " Cylindre : " + cylindre;
		return result;
	}
	
	public double getPrix(){
		return prix;
	}
}
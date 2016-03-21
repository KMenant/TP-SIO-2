import java.util.ArrayList;

public class Vehicule {

	protected double prix;
	protected String nom;
	protected ArrayList<Option> options = new ArrayList();
	protected Marque nomMarque;
	protected Moteur moteur;
	
	public Vehicule(){}
	
	public Vehicule(String nom, double prix){
		this.nom=nom;
		this.prix=prix;
	}	
	
	public String toString(){
		double total = 0;
		String result = "Voiture " + nomMarque + " : " + nom + "\n";
		result += moteur.toString() + " " + prix + "\n[";
		for(Option o : options)
		{
			result += o.getClass().getName() + " (" + o.getPrix() + "), ";
			total += o.getPrix();
		}
		total += prix;
		result += "]\nPrix total : " + total + "e\n\n";
		return result;
	}
	
	public void addOption(Option opt){
		options.add(opt);
	}
	
	public void setMoteur(Moteur mot){
		moteur = mot;
	}
	
	public Marque getMarque(){
		return nomMarque;
	}
	
	public ArrayList<Option> getOptions(){
		return options;
	}
	
	public double getPrix(){
		return prix;
	}
}
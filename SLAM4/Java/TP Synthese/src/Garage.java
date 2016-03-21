import java.util.ArrayList;

public class Garage {
	
	private ArrayList<Vehicule> voitures = new ArrayList();

	public String toString(){
		String result = "";
		for(Vehicule V : voitures)
			result += V.toString() + "\n";
		return result;
	}

	public void addVoiture(Vehicule V) {
		voitures.add(V);
	}

}

public class Main {
	 public static void main(String[] args) {
		 
	 Garage garage = new Garage();
	 System.out.println(garage);
	
	 Vehicule lag1 = new Lagouna("Lagouna", 15000);
	 lag1.setMoteur(new MoteurEssence("150 Chevaux", 10256d));
	 lag1.addOption(new GPS());
	 lag1.addOption(new SiegeChauffant());
	 lag1.addOption(new VitreElectrique());
	 garage.addVoiture(lag1);
	
	 Vehicule lag2 = new Lagouna("Lagouna", 12500);
	 lag2.setMoteur(new MoteurDiesel("500 Hdi", 456987d));
	 garage.addVoiture(lag2);
	
	 Vehicule P206_1 = new P206("206", 20000);
	 P206_1.setMoteur(new MoteurHybride("ESSENCE/Electrique", 12345.95d));
	 P206_1.addOption(new VitreElectrique());
	 P206_1.addOption(new BarreDeToit());
	 garage.addVoiture(P206_1);
	
	 Vehicule P206_2 = new P206("206", 23000); 
	 P206_2.setMoteur(new MoteurElectrique("1500 W", 1234d));
	 P206_2.addOption(new Climatisation());
	 P206_2.addOption(new BarreDeToit());
	 P206_2.addOption(new SiegeChauffant());
	 garage.addVoiture(P206_2);
	
	 Vehicule c4_1 = new C4("C4", 24000);
	 c4_1.setMoteur(new MoteurDiesel("200 Hdi", 25684.80d));
	 c4_1.addOption(new BarreDeToit());
	 c4_1.addOption(new Climatisation());
	 c4_1.addOption(new GPS());
	 garage.addVoiture(c4_1);
	
	 Vehicule c4_2 = new C4("C4", 27000);
	 c4_2.setMoteur(new MoteurElectrique("100 KW", 1224d));
	 c4_2.addOption(new SiegeChauffant());
	 c4_2.addOption(new BarreDeToit());
	 c4_2.addOption(new Climatisation());
	 c4_2.addOption(new GPS());
	 c4_2.addOption(new VitreElectrique());
	 garage.addVoiture(c4_2);
	 
	 System.out.println(garage.toString());
	 }
}
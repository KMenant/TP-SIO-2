public class MoteurEssence extends Moteur {

	public MoteurEssence(String cyl, double pri){
		super(cyl, pri);
		this.type = type.ESSENCE;
	}

}
public class MoteurElectrique extends Moteur {

	public MoteurElectrique(String cyl, double pri){
		super(cyl, pri);
		this.type = type.ELECTRIQUE;
	}

}

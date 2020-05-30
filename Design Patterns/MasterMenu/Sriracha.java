public class Sriracha extends ToppingDecorator {

    public Sriracha(TexMexInterface texMex) {
        super(texMex);
    }

    public String getSauce() {
        return super.getSauce() + " Sriracha,";
    }

    public double getCost() {
        return super.getCost() + 0.5;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + super.getProtein() + " topped with "
                + super.getToppings() + " with the following sauce " + getSauce();
    }
}
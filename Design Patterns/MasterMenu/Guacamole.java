public class Guacamole extends ToppingDecorator {

    public Guacamole(TexMexInterface texMex) {
        super(texMex);
    }

    public String getToppings() {
        return super.getToppings() + " Guacamole,";
    }

    public double getCost() {
        return super.getCost() + 1.0;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + super.getProtein() + " topped with "
                + getToppings() + " with the following sauce " + super.getSauce();
    }
}
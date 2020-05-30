public class Cheese extends ToppingDecorator {

    public Cheese(TexMexInterface texMex) {
        super(texMex);
    }

    public String getToppings() {
        return super.getToppings() + " Cheese,";
    }

    public double getCost() {
        return super.getCost() + 1.5;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + super.getProtein() + " topped with "
                + getToppings() + " with the following sauce " + super.getSauce();
    }
}
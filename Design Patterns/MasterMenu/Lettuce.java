public class Lettuce extends ToppingDecorator {

    public Lettuce(TexMexInterface texMex) {
        super(texMex);
    }

    public String getToppings() {
        return super.getToppings() + " Lettuce,";
    }

    public double getCost() {
        return super.getCost() + 0.5;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + super.getProtein() + " topped with "
                + getToppings() + " with the following sauce " + super.getSauce();
    }
}
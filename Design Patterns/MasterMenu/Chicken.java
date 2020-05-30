public class Chicken extends ToppingDecorator {

    public Chicken(TexMexInterface texMex) {
        super(texMex);
    }

    public String getProtein() {
        return super.getProtein() + " Chicken,";
    }

    public double getCost() {
        return super.getCost() + 2;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + getProtein() + " topped with "
                + super.getToppings() + " with the following sauce " + super.getSauce();
    }
}
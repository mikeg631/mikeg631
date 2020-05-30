public class Steak extends ToppingDecorator {

    public Steak(TexMexInterface texMex) {
        super(texMex);
    }

    public String getProtein() {
        return super.getProtein() + " Steak,";
    }

    public double getCost() {
        return super.getCost() + 3.5;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + getProtein() + " topped with "
                + super.getToppings() + " with the following sauce " + super.getSauce();
    }
}
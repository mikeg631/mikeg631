public class Beef extends ToppingDecorator {

    public Beef(TexMexInterface texMex) {
        super(texMex);
    }

    public String getProtein() {
        return super.getProtein() + " Beef,";
    }

    public double getCost() {
        return super.getCost() + 2.5;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + getProtein() + " topped with "
                + super.getToppings() + " with the following sauce " + super.getSauce();
    }
}
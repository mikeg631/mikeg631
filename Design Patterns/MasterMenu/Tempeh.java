public class Tempeh extends ToppingDecorator {

    public Tempeh(TexMexInterface texMex) {
        super(texMex);
    }

    public String getProtein() {
        return super.getProtein() + " Tempeh,";
    }

    public double getCost() {
        return super.getCost() + 2;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + getProtein() + " topped with "
                + super.getToppings() + " with the following sauce " + super.getSauce();
    }
}
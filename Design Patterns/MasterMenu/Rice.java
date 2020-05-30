public class Rice extends ToppingDecorator {

    public Rice(TexMexInterface texMex) {
        super(texMex);
    }

    public String getToppings() {
        return super.getToppings() + " Rice,";
    }

    public double getCost() {
        return super.getCost() + 1;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + super.getProtein() + " topped with "
                + getToppings() + " with the following sauce " + super.getSauce();
    }
}
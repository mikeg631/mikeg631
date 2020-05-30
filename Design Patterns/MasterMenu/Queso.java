public class Queso extends ToppingDecorator {

    public Queso(TexMexInterface texMex) {
        super(texMex);
    }

    public String getSauce() {
        return super.getSauce() + " Queso,";
    }

    public double getCost() {
        return super.getCost() + 1;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + super.getProtein() + " topped with "
                + getToppings() + " with the following sauce " + getSauce();
    }
}
public class Habenaro extends ToppingDecorator {

    public Habenaro(TexMexInterface texMex) {
        super(texMex);
    }

    public String getSauce() {
        return super.getSauce() + " Habenaro,";
    }

    public double getCost() {
        return super.getCost() + .5;
    }

    public String getTexMex() {
        return "Base:" + super.getBase() + " with a choice of protein " + super.getProtein() + " topped with "
                + getToppings() + " with the following sauce " + getSauce();
    }
}
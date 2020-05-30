public abstract class ToppingDecorator implements TexMexInterface { // used to decorate the TexMex
    private TexMexInterface texMex;

    public ToppingDecorator(TexMexInterface texMex) {
        this.texMex = texMex;
    }

    public TexMexInterface getObject()
    {
        return this.texMex;
    }

    public void changeInside(TexMexInterface replacement) {
        this.texMex = replacement;
    }

    public String getToppings() {
        return texMex.getToppings();
    }

    public String getProtein() {
        return texMex.getProtein();
    }

    public String getSauce() {
        return texMex.getSauce();
    }

    public String getBase() {
        return texMex.getBase();
    }

    public double getCost() {
        return texMex.getCost();
    }

    public String getPacks()
    {
        return getTexMex();
    }
}
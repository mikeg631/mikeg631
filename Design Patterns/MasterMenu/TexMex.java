
public abstract class TexMex implements TexMexInterface {
    //I probably should have just made this a concrete class, and dropped the Taco/Bowl/etc ...

    private String toppings;
    private String sauce;
    private String protein;
    private double cost;
    private String base;

    
    public TexMex(String base,String protein, String toppings, String sauce, double cost) // Default constructor
    {
        this.base = base;
        this.toppings = toppings;
        this.sauce = sauce;
        this.protein = protein;
        this.cost = cost; // Is this too much just for a TexMex shell?
    }
    public TexMexInterface getObject()
    {//had to implement this
        return this;
    }

    public void changeInside(TexMexInterface replacement)// had to implement this because this is a subclass of TexMexInterface
    {
        // this doesn't make sense/shouldn't happen
    }
    public String getTexMex() {
        return "";
    }

    public String getSauce() {
        return this.sauce;
    }

    public String getProtein() {
        return this.protein;
    }

    public String getToppings() {
        return this.toppings;
    }

    public String getBase()
    {
        return this.base;
    }

    public double getCost() {
        return this.cost;
    }

    public String getPack()
    {
        return getTexMex();
    }

}
public class Taco extends TexMex {

   
    public Taco() // Default constructor 
    {
        super("Taco","","","", 2);
    }

    public TexMexInterface getObject()
    {
        return this;
    }

    public Taco(String protein, String toppings, String sauce, double cost) // Default constructor
    {
        super("Taco", protein,toppings,sauce,cost);
    }

    public String getTexMex()
    {
        return "Base: Taco with a choice of protain " + getProtein() + " topped with " + getToppings() + " with the following sauce " + getSauce();
    }


}
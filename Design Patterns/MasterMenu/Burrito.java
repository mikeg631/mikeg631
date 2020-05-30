public class Burrito extends TexMex {

   
    public Burrito() // Default constructor 
    {
        super("Burrito", "","","", 2);
    }

    public Burrito(String protein, String toppings, String sauce, double cost) // Default constructor
    {
        super("Burrito", protein,toppings,sauce,cost);
    }

    public String getTexMex()
    {
        return "Base: Burrito with a choice of protain " + getProtein() + " topped with " + getToppings() + " with the following sauce " + getSauce();
    }
}
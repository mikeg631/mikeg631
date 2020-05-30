public class Bowl extends TexMex {

   
    public Bowl() // Default constructor 
    {
        super("Bowl","","","", 2);
    }

    public Bowl(String protein, String toppings, String sauce, double cost) // Default constructor
    {
        super("Bowl", protein,toppings,sauce,cost);
    }

    public String getTexMex()
    {
        return "Base: Bowl with a choice of protein " + getProtein() + " topped with " + getToppings() + " with the following sauce " + getSauce();
    }
}
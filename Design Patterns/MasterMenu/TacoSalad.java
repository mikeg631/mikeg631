public class TacoSalad extends TexMex {

   //Didn't get this to work :(
    public TacoSalad() // Default constructor 
    {
        super("Taco Salad","","","", 6);
    }

    
    public TacoSalad(String protein, String toppings, String sauce, double cost) // Default constructor
    {
        super("Taco Salad", protein,toppings,sauce,cost);
    }

    public String getTexMex()
    {
        return "Base: Taco Salad with a choice of protein " + getProtein() + " topped with " + getToppings() + " with the following sauce " + getSauce();
    }
}
import java.util.ArrayList;
import java.util.Scanner;

//allows for creation of custom TexMex food

public class CustomTexMexCreator extends TexMexCreator {
    private TexMexInterface temp;

    public CustomTexMexCreator(ArrayList<String> proteins, ArrayList<String> toppings, ArrayList<String> sauces, Scanner in) {
        super(proteins, toppings, sauces, in);

    }

    

//Im not sure if I needed this or if just inheriting the super class's constructor would just handle this appropiately 
// Ill check in the future, I am running out of time
    public TexMexInterface create(String base) {
        temp = super.setBase(base);
        temp = setProtein(temp);
        temp = setToppings(temp);
        temp = setSauce(temp);
        temp = super.remove(temp);
        return temp;

    }

    public TexMexInterface setSauce(TexMexInterface temp) {
        boolean done = false;
        ToppingDecorator sauce = null;
        int count = 0;

        while(sauce == null && !done)
        {
            System.out.println("What sauce would you like on the taco? Your options are: ");
        for (String entry : sauces)
            System.out.print(entry + ", ");
        
        System.out.print("Enter your choice as typed above: ");
        String opt = "";
        if (in.hasNextLine()) {
            opt = in.nextLine();
        }
        if(sauces.contains(opt))
            sauce = AvailableToppings.getSauce(temp, opt);

        if(sauce == null)
         {
            System.out.println("Could not find that option please try again.");
            continue;
         }
         temp = sauce;
         sauce = null;
         count++;
         if(count > 0)
         {
             System.out.println("You have ordered " + count + " sauces would you like another one(extra)? (Y/N)");
             String t = "";
             done = true;
             if (in.hasNextLine()) {
                 t = in.nextLine();
             }
             if (t.equalsIgnoreCase("Y"))
                 done = false;
         }
        }
        return temp;
    }

    public TexMexInterface setToppings(TexMexInterface temp)
    {
        boolean done = false;
        ToppingDecorator topping = null;
        int count = 0;

        while(topping == null && !done)
        {
            System.out.println("What topping would you like on the taco? Your options are: ");
        for (String entry : toppings)
            System.out.print(entry + ", ");
        
        System.out.print("Enter your choice as typed above: ");

        String opt = "";
        if (in.hasNextLine()) {
            opt = in.nextLine();
        }
        if(toppings.contains(opt))
            topping = AvailableToppings.getTopping(temp, opt);

        if(topping == null)
         {
            System.out.println("Could not find that option please try again.");
            continue;
         }
         temp = topping;
         topping = null;
         count++;
         if(count > 2)
         {
             done = true;
             System.out.println("You have ordered " + count + " toppings would you like another one(extra)? Y/N");
             String t = "";
             if (in.hasNextLine()) {
                 t = in.nextLine();
             }
             if(t.equalsIgnoreCase("Y"))
                done = false;
         }
    }
    return temp;
}
    
public TexMexInterface setProtein(TexMexInterface temp) {
    boolean done = false;
    ToppingDecorator protein = null;
    int count = 0;

    while (protein == null && !done) {
        System.out.println("What protein would you like on the taco? Your options are: ");
        for (String entry : proteins)
            System.out.print(entry + ", ");

        System.out.print("Enter your choice as typed above: ");
        String opt = "";
        if (in.hasNextLine()) {
            opt = in.nextLine();
        }
        if (proteins.contains(opt))
            protein = AvailableToppings.getProtein(temp, opt);

        if (protein == null) {
            System.out.println("Could not find that option please try again.");
            continue;
        }
        temp = protein;
        protein = null;
        count++;
        if (count > 0) {
            System.out.println("You have ordered " + count + " protein would you like another one(extra)? (Y/N)");
            String t = "";
            done = true;
            if (in.hasNextLine()) {
                t = in.nextLine();
            }
            if (t.equalsIgnoreCase("Y"))
                done = false;
        }
    }
    return temp;
}
}
    
import java.util.ArrayList;
import java.util.Scanner;

//This is basically an abstract Factory ( maybe abstract template??)


public abstract class TexMexCreator {
    protected ArrayList<String> proteins, toppings, sauces;
    protected Scanner in;

    public TexMexCreator(ArrayList<String> proteins, ArrayList<String> toppings, ArrayList<String> sauces, Scanner in) {
        this.proteins = proteins;
        this.toppings = toppings;
        this.sauces = sauces;
        this.in = in;

    }

    TexMexInterface temp;

    public TexMexInterface create(String base) {
        temp = setBase(base);
        temp = setProtein(temp);
        temp = setToppings(temp);
        temp = setSauce(temp);
        temp = remove(temp);
        return temp;

    }

    public TexMexInterface remove(TexMexInterface temp)
    {
        boolean done = false;
        while(!done)
        {
            //For some reason this double prints the first time. No time to fix it sorry :(
            System.out.println("Here is your current item: " + temp.getTexMex() + "\n Tt costs : " + temp.getCost());
            System.out.println("Would you like to remove anything?(Y/N)");

            if(in.hasNextLine())
            {
                String s = in.nextLine();
                if(s.equalsIgnoreCase("N"))
                {
                    done = true;
                    return temp;
                }
            }
        

        System.out.println("Enter the name of the item you would like to remove: ");
        String s = "";
        if (in.hasNextLine()) {
            s = in.nextLine();
        }
        TexMexInterface temp2 = temp;
        boolean secondTest = false;
        ToppingDecorator tempDec = null;
        System.out.println(s);
        if(proteins.contains(s)) // Maybe I should have just had one big list. Was there really even a reason to
        {// treat toppings, sauces, and proteins differently from a decorator perspective. 
            tempDec = AvailableToppings.getProtein(null, s);//just used for comparison
        } else if (toppings.contains(s)) {
        tempDec = AvailableToppings.getTopping(null, s);// just used for comparison .getClass
        } else if (sauces.contains(s)) {
            tempDec = AvailableToppings.getSauce(null, s);// just used for comparison
            }

        while (!secondTest && tempDec != null) { // comparing the decorators class to the nested object's class
            if (temp2.getObject().getClass() == tempDec.getClass()) {
                temp2.changeInside(temp2.getObject().getObject());// removing layer and re-inserting everything underneath.
                secondTest = true;

            }
            temp2 = temp2.getObject();
        }
    }
        return temp;
    }

    public TexMexInterface setBase(String base) {
        if (base == "Taco")
            return new Taco("", "", "", 2);
        else if (base == "Bowl")
            return new Bowl("", "", "", 3);
        else if (base == "Burrito")
            return new Burrito("", "", "", 3);

        return null;// error needs proper argument
    }

    public abstract TexMexInterface setSauce(TexMexInterface temp);
    public abstract TexMexInterface setToppings(TexMexInterface temp);
    public abstract TexMexInterface setProtein(TexMexInterface temp);

}
    
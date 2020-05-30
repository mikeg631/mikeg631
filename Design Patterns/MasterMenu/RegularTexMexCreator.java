import java.util.ArrayList;
import java.util.Scanner;


public class RegularTexMexCreator extends TexMexCreator {

    public RegularTexMexCreator(ArrayList<String> proteins, ArrayList<String> toppings, ArrayList<String> sauces, Scanner in) {
        super(proteins,toppings,sauces,in);

    }

    TexMexInterface temp;

    public TexMexInterface create(String base,String protein) {
        temp = super.setBase(base);
        temp = setProtein(temp);
        temp = setToppings(temp);
        temp = setSauce(temp);
        temp = super.remove(temp);
        return temp;

    }

    public TexMexInterface setSauce(TexMexInterface temp) {//default sauce
        return new SourCream(temp);
    }

    public TexMexInterface setProtein(TexMexInterface temp)//Just select your protein!!
    {
        int n = 8;
    System.out.println("What protein you like to add to your meal you like to order");
    System.out.println("1. Beef - $2.5");
    System.out.println("2. Steak - $3.5");
    System.out.println("3. Chicken - $2.5");
    System.out.println("4. Tempeh - $2");
    System.out.println("5. None");
    System.out.println("All come with Lettuce, Cheese, Tomatoes and is sauced with  Sour Cream");
    boolean correctInput = false;

    while (!correctInput) {
      System.out.println("Please enter the corresponding number.");
      if (in.hasNextInt()) {
        n = in.nextInt();
      }
      switch (n) {
        case 1:
          temp = new Beef(temp);
          break;
        case 2:
          temp = new Steak(temp);
          break;
        case 3:
          temp = new Chicken(temp);
          break;
        case 4:
        temp = new Tempeh(temp);
          break;
        case 5:
        break;
        default:
          continue;

      }
      correctInput = true;

    }
    return temp;
}


    public TexMexInterface setToppings(TexMexInterface temp)
    {
        return new Tomatoes(new Cheese(new Lettuce(temp)));//deafult toppings
    }

    
}
    
import java.util.ArrayList;
import java.util.Scanner;



public class Client {
  public static ArrayList<String> proteins, toppings, sauces;

  public static Order orderBasicTaco(TexMexCreator creator, Scanner in) {
    int n = 8;
    System.out.println("What Taco you like to order?");
    System.out.println("1. Beef - $2.5");
    System.out.println("2. Steak - $3.5");
    System.out.println("3. Chicken - $2.5");
    System.out.println("4. Tempeh - $2");
    System.out.println("5. Custom");
    System.out.println("All tacos come with Lettuce, Cheese, Tomato and is sauced with  Sour Cream");
    boolean correctInput = false;

    TexMexInterface temp = null;
    while(!correctInput)
    {
    System.out.println("Please enter the corresponding number.");
    if (in.hasNextInt()) {
      n = in.nextInt();
    }
    switch(n) {
      case 1:
      temp = new Taco("Beef", "Lettuce, Cheese, Tomato", "Sour Cream", 2.5);
      break;
      case 2:
      temp = new Taco("Steak", "Lettuce, Cheese, Tomato", "Sour Cream", 3.5);
      break;
      case 3:
      temp = new Taco("Chicken", "Lettuce, Cheese, Tomato", "Sour Cream", 2.5);
      break;
      case 4:
      temp = new Taco("Tempeh", "Lettuce, Cheese, Tomato", "Sour Cream", 2.0);
      break;
      case 5:
      temp = creator.create("Taco");
      break;
      default: 
      continue;

    }
    correctInput = true;
  }
    

    return new Order(temp);
  }

  public static Order orderBasicBurrito(TexMexCreator creator, Scanner in) {
    int n = 8;
    System.out.println("What Burritos you like to order?");
    System.out.println("1. Beef - $6");
    System.out.println("2. Steak - $6.5");
    System.out.println("3. Chicken - $6");
    System.out.println("4. Tempeh - $5");
    System.out.println("5. Custom");
    System.out.println("All Burritos come with Lettuce, Cheese, Tomato and is sauced with  Sour Cream");
    boolean correctInput = false;

    TexMexInterface temp = null;
    while (!correctInput) {
      System.out.println("Please enter the corresponding number.");
      if (in.hasNextInt()) {
        n = in.nextInt();
      }
      switch (n) {
        case 1:
          temp = new Burrito("Beef", "Lettuce, Cheese, Tomato", "Sour Cream", 6);
          break;
        case 2:
          temp = new Burrito("Steak", "Lettuce, Cheese, Tomato", "Sour Cream", 6.5);
          break;
        case 3:
          temp = new Burrito("Chicken", "Lettuce, Cheese, Tomato", "Sour Cream", 6.5);
          break;
        case 4:
          temp = new Burrito("Tempeh", "Lettuce, Cheese, Tomato", "Sour Cream", 5);
          break;
        case 5:
          temp = creator.create("Burrito");
          break;
        default:
          continue;

      }
      correctInput = true;
    }

    return new Order(temp);
  }

  public static Order orderBasic(TexMexCreator creator, Scanner in) {
    int n = 8;
    System.out.println("What Bowl you like to order?");
    System.out.println("1. Beef - $7");
    System.out.println("2. Steak - $7.5");
    System.out.println("3. Chicken - $7");
    System.out.println("4. Tempeh - $7");
    System.out.println("5. Custom");
    System.out.println("All Bowls come with Lettuce, Cheese, Tomato and is sauced with  Sour Cream");
    boolean correctInput = false;

    TexMexInterface temp = null;
    while (!correctInput) {
      System.out.println("Please enter the corresponding number.");
      if (in.hasNextInt()) {
        n = in.nextInt();
      }
      switch (n) {
        case 1:
          temp = new Bowl("Beef", "Lettuce, Cheese, Tomatoes", "Sour Cream", 7);
          break;
        case 2:
          temp = new Bowl("Steak", "Lettuce, Cheese, Tomatoes", "Sour Cream", 7.5);
          break;
        case 3:
          temp = new Bowl("Chicken", "Lettuce, Cheese, Tomatoes", "Sour Cream", 7.5);
          break;
        case 4:
          temp = new Bowl("Tempeh", "Lettuce, Cheese, Tomatoes", "Sour Cream", 7);
          break;
        case 5:
          temp = creator.create("Bowl");
          break;
        default:
          continue;

      }
      correctInput = true;
    }

    return new Order(temp);
  }

  public static TexMexInterface whichOrder(Scanner in, String base)
  {
    TexMexCreator creator;
    int n = 8;
     System.out.println("Enter 1 for pre-made option(choice of protein), or 2 for custom order");
      if (in.hasNextInt()) {
        n = in.nextInt();
      }
      switch (n) {
        case 1:
          creator = new RegularTexMexCreator(proteins, toppings, sauces, in);
          break;
          default:
          creator = new CustomTexMexCreator(proteins, toppings, sauces, in);
          break;
      }
      return creator.create(base);
  }


    public static void main(String[] args) {
      proteins = new ArrayList<String>();
      sauces = new ArrayList<String>();
      toppings = new ArrayList<String>();

      //below we initalize the available options, must be in the AvailableToppings class
      proteins.add("Steak");
      proteins.add("Beef");
      proteins.add("Chicken");
      proteins.add("Tempeh");

      sauces.add("Habenaro");
      sauces.add("Queso");
      sauces.add("Mild Sauce");
      sauces.add("Sour Cream");
      sauces.add("Sriracha");

      toppings.add("Black Beans");
      toppings.add("Cheese");
      toppings.add("Corn");
      toppings.add("Fajita Veggies");
      toppings.add("Guacamole");
      toppings.add("Tomatoes");
      toppings.add("Lettuce");
      toppings.add("Pinto Beans");
      toppings.add("Rice");


      Scanner in = new Scanner(System.in);
      


  boolean cont = true;
  while(cont)
    {
    int n = 8;
    // allow for selection of packs
    System.out.println("What would you like to order?");
    System.out.println("1. Taco");
    System.out.println("2. Bowl");
    System.out.println("3. Burrito");
    System.out.println("4. An Order of Tacos (3 tacos)");
    System.out.println("5. Travelers Pack( Two tacos, 1 burrito)");
    System.out.println("6. Sampler Pack( One taco, 1 burrito, 1 bowl)");
    System.out.println("7. Travelers Pack( 3 orders of tacos, 2 burritos, 1 bowl)");

     Packs temp = null;
      System.out.println("Please enter the corresponding number.");
      if (in.hasNextInt()) {
        n = in.nextInt();
      }
      switch (n) {
        case 1:
          temp = new Order(whichOrder(in,"Taco"));
          break;
        case 2:
          temp = new Order(whichOrder(in,"Bowl"));
          break;
        case 3:
          temp = new Order(whichOrder(in,"Burrito"));
          break;
        case 4:
          temp = new OrderOfTacos(new CustomTexMexCreator(proteins, toppings, sauces, in));
          break;
        case 5:
          temp = new TravelerPack(new RegularTexMexCreator(proteins, toppings, sauces, in));
          break;
        case 6:
          temp = new SamplerPack(new RegularTexMexCreator(proteins, toppings, sauces, in));
          break;
        case 7:
          temp = new PartyPlatter(new RegularTexMexCreator(proteins, toppings, sauces, in));
          break;
        default:
          continue;

      }
      

      System.out.println(temp.printPack());
      System.out.println("The cost is: " + temp.getCost());
  }


}
}


public class AvailableToppings
{
    //This is basically where you can add new Indgredients to the classes
    // The database of indgredient if you will


    public static ToppingDecorator getProtein(TexMexInterface temp, String opt) {
       if (opt.equalsIgnoreCase("Chicken"))
            return new Chicken(temp);
        else if (opt.equalsIgnoreCase("Beef"))
            return new Beef(temp);
        else if (opt.equalsIgnoreCase("Steak"))
            return new Steak(temp);
        else if (opt.equalsIgnoreCase("Tempeh"))
            return new Tempeh(temp);


            return null;
    }

    public static ToppingDecorator getSauce(TexMexInterface temp, String opt) {
        if (opt.equalsIgnoreCase("Habenaro"))
            return new Habenaro(temp);
        else if (opt.equalsIgnoreCase("Queso"))
            return new Queso(temp);
        else if (opt.equalsIgnoreCase("Mild Sauce"))
            return new MildSauce(temp);
        else if (opt.equalsIgnoreCase("Sour Cream"))
            return new SourCream(temp);
        else if (opt.equalsIgnoreCase("Sriracha"))
            return new Sriracha(temp);

            return null;

    }

    public static ToppingDecorator getTopping(TexMexInterface temp, String opt) {
        if (opt.equalsIgnoreCase("Black Beans"))
            return new BlackBeans(temp);
        else if (opt.equalsIgnoreCase("Cheese"))
            return new Cheese(temp);
        else if (opt.equalsIgnoreCase("Corn"))
            return new Corn(temp);
        else if (opt.equalsIgnoreCase("Fajita Veggies"))
            return new FajitaVeggies(temp);
        else if (opt.equalsIgnoreCase("Guacamole"))
            return new Guacamole(temp);
        else if (opt.equalsIgnoreCase("Lettuce"))
            return new Lettuce(temp);
        else if (opt.equalsIgnoreCase("Pinto Beans"))
            return new PintoBeans(temp);
        else if (opt.equalsIgnoreCase("Rice"))
            return new Rice(temp);
        else if (opt.equalsIgnoreCase("Tomatoes"))
            return new Tomatoes(temp);

        return null;

    }

}
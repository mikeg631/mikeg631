import java.util.ArrayList;
//Pack that reperesents order of Tacos
public class OrderOfTacos implements Packs {
    private ArrayList<Packs> packs;

    public OrderOfTacos(TexMexCreator creator) {
        packs = new ArrayList<Packs>();
        packs.add(new Order(creator.create("Taco")));
        packs.add(new Order(creator.create("Taco")));
        packs.add(new Order(creator.create("Taco")));
    }

    public String printPack() {
       String s = "Order of Tacos: \n";
       for(int i = 0; i < packs.size(); i++)
        s += "Taco " + (i+1) + ": " + packs.get(i).printPack() + "\n";

       return s;
    }

    public double getCost() {
        double c = 0;
        for (Packs item : packs)
            c += item.getCost();
        return c;

    }

}
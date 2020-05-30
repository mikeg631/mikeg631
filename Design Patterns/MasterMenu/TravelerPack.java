import java.util.ArrayList;

public class TravelerPack implements Packs
{
    //travelerpack
    ArrayList<Packs> packs;

    public TravelerPack(TexMexCreator creator)
    {
         packs = new ArrayList<Packs>();
        packs.add(new Order(creator.create("Taco")));
        packs.add(new Order(creator.create("Taco")));
        packs.add(new Order(creator.create("Burrito")));
    }

    public String printPack() {
        String temp = "Traveler Pack:\n";
        for (int i = 0; i < packs.size(); i++) {
            temp += "Item " + (i + 1) + ":\n" + packs.get(i).printPack() + "\n";
        }
        return temp;
    }

    public double getCost() {
        double c = 0;
        for (Packs item : packs)
            c += item.getCost();
        return c;

    }
 


}
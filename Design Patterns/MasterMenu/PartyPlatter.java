import java.util.ArrayList;

public class PartyPlatter implements Packs {
    ArrayList<Packs> packs;

    public PartyPlatter(TexMexCreator creator) {
        packs = new ArrayList<Packs>();
        packs.add(new OrderOfTacos(creator));
        packs.add(new OrderOfTacos(creator));
        packs.add(new OrderOfTacos(creator));
        packs.add(new Order(creator.create("Burrito")));
        packs.add(new Order(creator.create("Burrito")));
        packs.add(new Order(creator.create("Bowl")));
    }

    public String printPack() {
        String temp = "Party Platter:\n";
        for(int i = 0; i < packs.size(); i++)
        {
            temp += "Item " + (i+1) + ":\n" + packs.get(i).printPack() + "\n";
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
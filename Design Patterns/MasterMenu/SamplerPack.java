import java.util.ArrayList;

public class SamplerPack implements Packs
{
    ArrayList<Packs> packs;

    public SamplerPack(TexMexCreator creator)
    {
         packs = new ArrayList<Packs>();
        packs.add(new Order(creator.create("Taco")));
        packs.add(new Order(creator.create("Burrito")));
        packs.add(new Order(creator.create("Bowl")));
    }

    public String printPack() {
        String temp = "Sampler Pack:\n";
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
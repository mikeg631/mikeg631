public class Order implements Packs { //basically a wrapper class for the composites . 
    // Could have been avoided in Java supported multiple inheritance 
    private TexMexInterface texMex;

    public Order(TexMexInterface texMex) {     
        this.texMex = texMex;
    }

    public String printPack()
    {
        return texMex.getTexMex();
    }

    public TexMexInterface getFood()
    {
        return texMex;
    }

    public double getCost()
    {
       return texMex.getCost();
    }

    }
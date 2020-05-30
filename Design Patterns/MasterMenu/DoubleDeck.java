public class DoubleDeck extends ToppingDecorator {
    private Taco taco1, taco2;
    public DoubleDeck(Taco taco1, Taco taco2)
    {
        super(taco1);
        this.taco2 = taco2;
    }

    
  
    public String getTexMex() {
        return taco1.getTexMex() + "is decked with " + taco2.getTexMex();
}
}
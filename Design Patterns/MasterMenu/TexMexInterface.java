
public interface TexMexInterface {

 

    public String getTexMex();

    public TexMexInterface getObject();//helps remove decorators

    public void changeInside(TexMexInterface replacement);//This is for removing decorators

    public String getSauce();

    public String getProtein();

    public String getToppings();

    public String getBase();

    public double getCost();

    
}
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;

public class Enviornment
{
private ArrayList<HashMap<String, Double>> scopes;
public Enviornment() {
        scopes = new ArrayList<HashMap<String, Double>>();
}


public void addScope()
{
    scopes.add(new HashMap<String, Double>());
}

public int getScopesNum()
{
    return scopes.size();
}
public HashMap getLastScope()
{
    return scopes.get(scopes.size()-1);

}

public void popScope()
{
    if(scopes.size() > 0)
    {
  scopes.remove(scopes.size()-1);
    }
}

public Double findVar(String var)
{
    int currentScope = scopes.size()-1;
    HashMap<String, Double> m;
    Double temp;
    while(currentScope >= 0 && currentScope != -1)
    {
        m = scopes.get(currentScope);
        temp = (Double)m.get(var);
        if(temp != null)
        {
            return temp;
        }
        currentScope--;
    }
    return Double.valueOf(0);
}

    public void updateVar(String var, Double value) {
       for(int i = 0; i < scopes.size(); i++)
       {
            HashMap<String, Double> m = scopes.get(i);
           if(m.get(var) != null)
           {
               m.put(var, value);
               return;
           }
       }

       scopes.get(scopes.size()-1).put(var, value);

        }
}
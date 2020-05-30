import java.util.ArrayList;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

public class FunctionDef {
    
    private ArrayList<String> params;
    private String funcBody;
    private String functionName;
    public FunctionDef(String functionName, ArrayList<String> params, String funcBody)
    {
        this.functionName = functionName;
        this.funcBody = funcBody;
        this.params = params;
    }

    public String getName()
    {
        return this.functionName;
    }

    public int getParamsNum()
    {
        return this.params.size();
    }

    public ArrayList<String> getParams() {
        return this.params;
    }



    public String getFuncBody()
    {
        return this.funcBody;
    }
}
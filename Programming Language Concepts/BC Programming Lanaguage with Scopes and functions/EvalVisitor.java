   import java.lang.Math;
   import java.math.*;
   import java.util.HashMap;
   import java.util.Map;
   import java.util.ArrayList;
   import java.util.List;
   import java.util.Stack;
   import java.util.Scanner;
   import java.io.BufferedReader;
   import java.io.FileInputStream;
   import java.io.InputStream;
   import java.io.InputStreamReader;
   import java.io.IOException;
   import java.lang.Exception;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;
import org.antlr.v4.runtime.CharStreams;
public class EvalVisitor extends BCBaseVisitor<Double> {

    private Map<String, Double> global = new HashMap<String, Double>();
    private Enviornment currEnv = new Enviornment();
    private Stack<Enviornment> envs = new Stack<Enviornment>();
    private Map<String, FunctionDef> functions = new HashMap<String, FunctionDef>();

    public EvalVisitor()
    {
        super();
    }
    public Double visitStatements(BCParser.StatementsContext ctx)
    {
        List<BCParser.StatementContext> statements = ctx.statement();
        Double d = null;
        for(BCParser.StatementContext statement : statements)
        {
            d = this.visitStatement(statement);
            if(d != null)
            {
                System.out.println(d);
            }
        }
        return null;
    }

    public Double visitPrintString(BCParser.PrintStringContext ctx)
    {
        System.out.println(ctx.STRING().getText());
        return null;
    }

    public Double visitStatementblock(BCParser.StatementblockContext ctx)
    {
        List<BCParser.StatementContext> statements = ctx.statement();
        for(BCParser.StatementContext statement : statements)
        {
            this.visitStatement(statement);
        }
        return Double.valueOf(5);
    }
    
       public Double visitFuncStatementblock(BCParser.StatementblockContext ctx)
    {
        List<BCParser.StatementContext> statements = ctx.statement();
        Double d = null;
        for(BCParser.StatementContext statement : statements)
        {
            d = this.visitFStatement(statement);
            if(d != null)
            {
                return d;
            }
        }
     

        return d;
    }

    public Double visitExpr(BCParser.ExprContext ctx) {
        return this.visit(ctx);
    }

       
    public Double visitStatement(BCParser.StatementContext ctx)
    {
     BCParser.IfStatementContext ifS = ctx.ifStatement();
     BCParser.WhileLoopContext whileS = ctx.whileLoop();
     BCParser.ForLoopContext forS = ctx.forLoop();
     BCParser.FunctionDefineContext fdS = ctx.functionDefine();
     BCParser.ExprContext exprS = ctx.expr();
     BCParser.PrintStringContext ps = ctx.printString();

      if(ifS != null)
     {
         return visitIfStatement(ifS);
     }
        else if (whileS != null) {
            return visitWhileLoop(whileS);
        }
        else if (forS != null) {
            return visitForLoop(forS);
        }
        else if (fdS != null) {
            return visitFunctionDefine(fdS);
        }
        else if(exprS != null)
     {
         return this.visit(exprS);
     } else if(ps != null)
        {
         return this.visitPrintString(ps);
     } 


     return null;

    }

    public Double visitFStatement(BCParser.StatementContext ctx)
    {
         BCParser.IfStatementContext ifS = ctx.ifStatement();
     BCParser.WhileLoopContext whileS = ctx.whileLoop();
     BCParser.ForLoopContext forS = ctx.forLoop();
     BCParser.RetContext retS = ctx.ret();
     BCParser.ExprContext exprS = ctx.expr();

      if(ifS != null)
     {
         return visitFIfStatement(ifS);
     }
        else if (whileS != null) {
            return visitFWhileLoop(whileS);
        }
        else if (forS != null) {
            return visitFForLoop(forS);
        }
        else if(retS != null)
     {
         return this.visitRet(retS);
     } 
        else if(exprS != null)
     {
         return this.visitFExpr(exprS);
     } 
     


     return Double.valueOf(0); 
    }

    public Double visitFExpr(BCParser.ExprContext ctx)
    {
        String s = ctx.getText();
        if(s.startsWith("return"))
        {
            s = s.substring(6,s.length());
        BCLexer lexer = new BCLexer(CharStreams.fromString(s));
        BCParser parser = new BCParser(new CommonTokenStream(lexer));
        BCParser.ExprContext tree = parser.expr();
        Double value = this.visit(tree);
        return value;
        }

            if(s.startsWith("print"))
            {
                s = s.substring(5,s.length());
            BCLexer lexer = new BCLexer(CharStreams.fromString(s));
        BCParser parser = new BCParser(new CommonTokenStream(lexer));
        BCParser.ExprContext tree = parser.expr();
        Double value = this.visit(tree);
        System.out.println(value);
        return null;
        }
            
        this.visit(ctx);
        return null;
    }

    public Double visitPrint(BCParser.PrintContext ctx)
    {
        Double d = this.visit(ctx.expr());
        System.out.println(d);
        return d;
    }

    public Double visitLogOP(BCParser.LogOPContext ctx) {
    return Math.log(this.visit(ctx.expr()));
    }

    public Double visitParenOP(BCParser.ParenOPContext ctx)
    {
        return this.visit(ctx.expr());
    }

    public Double visitSqrtOP(BCParser.SqrtOPContext ctx) {
        return Math.sqrt(this.visit(ctx.expr()));
    }

    public Double visitExpOP(BCParser.ExpOPContext ctx) {
        return Math.exp(this.visit(ctx.expr()));
    }

    public Double visitSinOP(BCParser.SinOPContext ctx) {
        return Math.sin(this.visit(ctx.expr()));
    }

    public Double visitCosOP(BCParser.CosOPContext ctx) {
        return Math.cos(this.visit(ctx.expr()));
    }

    public void putVariable(String var, double value)
    {
        Double temp = this.global.get(var);
        if(temp != null || currEnv.getScopesNum() == 0)//In this case the variable is either defined globally or we are in the global scope
        {
            this.global.put(var, Double.valueOf(value));
            //System.out.println("var: " + var + " put in global scope");
        } else
        {
            this.currEnv.updateVar(var,Double.valueOf(value));
             //System.out.println("var: " + var + " put in lower scope");
        }
        
    }

    private Double getVariable(String var) {
        Double temp = global.get(var);
        if(temp != null)
        {
             //System.out.println("Found var: " + var + " in global scope value: " + temp);
            return temp;
        } else if(currEnv != null && currEnv.getScopesNum() > 0)
        {
            temp = currEnv.findVar(var);
             //System.out.println("Found var: " + var + " in lower scope value:" + temp);
            return temp;
        }  
                     //System.out.println("Var not found: " + var + " value:" + 0);
            return Double.valueOf(0);//implement
    }

    public Double visitPrefixOP(BCParser.PrefixOPContext ctx)
    {
        double test = 0;
        if (ctx.op.getText().equals("++")) {
            test = this.getVariable(ctx.temp.getText()) + 1;
            this.putVariable(ctx.temp.getText(), test);
        } else if (ctx.op.getText().equals("--")) {
            test = this.getVariable(ctx.temp.getText()) - 1;
           this.putVariable(ctx.temp.getText(), test);
        }
        return test;
    }

    public Double visitPostfixOP(BCParser.PostfixOPContext ctx) {
        double test = 0;
        if (ctx.op.getText().equals("++")) {
            test = this.getVariable(ctx.temp.getText());
            this.putVariable(ctx.temp.getText(), test + 1);
        } else if (ctx.op.getText().equals("--")) {
            test = this.getVariable(ctx.temp.getText());
            this.putVariable(ctx.temp.getText(), test- 1);
        }
        return test;
    }

    public Double visitNegateOP(BCParser.NegateOPContext ctx)
    {
        return -this.visit(ctx.expr());
    }

    public Double visitExponentOP(BCParser.ExponentOPContext ctx) {
        return Math.pow(this.visit(ctx.expr(0)), this.visit(ctx.expr(1)));//check this

    }

    public Double visitDivideOP(BCParser.DivideOPContext ctx) { 
        return this.visit(ctx.expr(0)) / this.visit(ctx.expr(1));
    }

    public Double visitMultiplyOP(BCParser.MultiplyOPContext ctx) {
            return this.visit(ctx.expr(0)) * this.visit(ctx.expr(1));
     
    }

    public Double visitModulusOP(BCParser.ModulusOPContext ctx) {
        return this.visit(ctx.expr(0)) % this.visit(ctx.expr(1));
    }

    public Double visitAdditionOP(BCParser.AdditionOPContext ctx) {
        return this.visit(ctx.expr(0)) + this.visit(ctx.expr(1));
    }

    public Double visitSubtractionOP(BCParser.SubtractionOPContext ctx) {
        return this.visit(ctx.expr(0)) - this.visit(ctx.expr(1));
    }

    public Double visitAssigmentWithCalcOP(BCParser.AssigmentWithCalcOPContext ctx) {
    String currVar = ((BCParser.AssigmentWithCalcOPContext)ctx).temp.getText();
    Double temp1 = this.getVariable(currVar); 
    Double temp2 = this.visit(ctx.expr());
    String operator = ((BCParser.AssigmentWithCalcOPContext)ctx).op.getText();
    if(operator.equals("*="))
     {
         temp1 *= temp2;
      }
      else if(operator.equals("/="))
      {
         temp1 /= temp2;
      }
      else if(operator.equals("+="))
     {
         temp1 += temp2;
      }
      else if(operator.equals("-="))
     {
         temp1 -= temp2;
      }
      else if(operator.equals("%="))
     {
         temp1 %= temp2;
      }
      else if(operator.equals("^="))
     {
         temp1 = Math.pow(temp1,temp2);
      }
    this.putVariable(currVar,temp1);
    return temp1;
    }

    public Double visitAssignmentOP(BCParser.AssignmentOPContext ctx)
    {
        Double d = this.visit(ctx.expr());
        this.putVariable(((BCParser.AssignmentOPContext)ctx).temp.getText(), d);
        return d;
    }

    public Double visitRelationalOP(BCParser.RelationalOPContext ctx)
    {
        boolean temp;
        double d1 = this.visit(ctx.expr(0));
        double d2 = this.visit(ctx.expr(1));
        String operator = ((BCParser.RelationalOPContext)ctx).op.getText();
                 //System.out.println("Relational " + d1 + operator + d2);
        if (operator.equals(">=")) {
            temp = d1 >= d2;
           return new Double((temp ? 1 : 0));
        } else if (operator.equals("<=")) {
            temp = d1 <= d2;
            return new Double((temp ? 1 : 0));
        } else if (operator.equals(">")) {
            temp = d1 > d2;
           return  new Double((temp ? 1 : 0));
        } else if (operator.equals("<")) {
            temp = d1 < d2;
            return new Double((temp ? 1 : 0));
        } else if (operator.equals("==")) {
            if(d1 == d2)
                 {
                    return Double.valueOf(1);
                }
                return Double.valueOf(0);
        } else if (operator.equals("!=")) {
            {
                if(d1 == d2)
                {
                    return Double.valueOf(0);
                }
                return Double.valueOf(1);
                
            }
        }
        return new Double(0);
    }

    public Double visitNotOP(BCParser.NotOPContext ctx)
    {
        if(this.visit(ctx.expr()) == 0){ 
            return new Double(1);
        } else {
            return new Double(0);
        }

    }

    public Double visitAndOP(BCParser.AndOPContext ctx)
    {
        if (this.visit(ctx.expr(0)) == 0 || this.visit(ctx.expr(1)) == 0) {
            return new Double(0);
        } else {
            return new Double(1);
        }
    }

     public Double visitRet(BCParser.RetContext ctx)
     {
         //System.out.println("Visit ret: " + ctx.getText());
         Double d = this.visit(ctx.expr());
         return d;
     }

    public Double visitOrOP(BCParser.OrOPContext ctx) {
        if (this.visit(ctx.expr(0)) == 0 && this.visit(ctx.expr(1)) == 0) {
            return new Double(0);
        } else {
            return new Double(1);
        }
    }

    public Double visitNumber(BCParser.NumberContext ctx)
    {
        return Double.parseDouble(ctx.getText());
    }

    public Double visitVar(BCParser.VarContext ctx) {
        //System.out.println("Finding var");
        return this.getVariable(ctx.getText());
    }

    public Double visitRead(BCParser.ReadContext ctx)
    {
    Scanner in = new Scanner(System.in);
    Double temp = new Double(0);
    temp = in.nextDouble();
    return temp;
    }

    
    public Double visitIfStatement(BCParser.IfStatementContext ctx)
    {
        Double value = this.visit(ctx.expr());
        if(value > 0)
        {
            currEnv.addScope();
            List<BCParser.StatementContext> statements = ctx.statementblock(0).statement();
            for (BCParser.StatementContext stat : statements) {
                this.visitStatement(stat);
            }
            currEnv.popScope();
        }
        else if(ctx.statementblock(1) != null)
        { 
            currEnv.addScope();
            List<BCParser.StatementContext> statements = ctx.statementblock(1).statement();
            for (BCParser.StatementContext stat : statements) {
                this.visitStatement(stat);
            }
            currEnv.popScope();
        }
        return null;
    }

    public Double visitFIfStatement(BCParser.IfStatementContext ctx)
    {
        Double value = this.visit(ctx.expr());
        Double d = null;
        if(value > 0)
        {
            currEnv.addScope();
            d = this.visitFuncStatementblock(ctx.statementblock(0));
            currEnv.popScope();
        }
        else if(ctx.statementblock(1) != null)
        { 
            currEnv.addScope();
             d = this.visitFuncStatementblock(ctx.statementblock(1));
            currEnv.popScope();      }
        return d;
    }


    public Double visitFWhileLoop(BCParser.WhileLoopContext ctx)
    {
        //System.out.println("test while");
        Double value = this.visit(ctx.expr());
        boolean temp = true;
        Double d = null;
        currEnv.addScope();
        if(value == 0)
        {
            temp = false;
        }
        List<BCParser.StatementContext> statements = ctx.statementblock().statement();
        while(temp)
        {
            currEnv.addScope();
            BCParser.BreContext tempctx = null;
            for(BCParser.StatementContext stat : statements)
            {
                
            d = this.visitFStatement(stat);
            if(d != null)
            {
                return d;
            }
            tempctx = stat.bre();
                if(tempctx != null && tempctx instanceof BCParser.BreContext)
                {
                    break;
                      }
            }
             if(tempctx != null && tempctx instanceof BCParser.BreContext)
                {
                    currEnv.popScope();
                    break;
                      }

            value = this.visit(ctx.expr());
            if(value == 0)
            {
                temp = false;
            }
            currEnv.popScope();
        }
        currEnv.popScope();
        return null;
    }

    public Double visitWhileLoop(BCParser.WhileLoopContext ctx)
    {
        //System.out.println("test while");
        Double value = this.visit(ctx.expr());
        boolean temp = true;
        currEnv.addScope();
        if(value == 0)
        {
            temp = false;
        }
        List<BCParser.StatementContext> statements = ctx.statementblock().statement();
        while(temp)
        {
            currEnv.addScope();
            BCParser.BreContext tempctx = null;
            for(BCParser.StatementContext stat : statements)
            {
                
            this.visitStatement(stat);
            tempctx = stat.bre();
                if(tempctx != null && tempctx instanceof BCParser.BreContext)
                {
                    break;
                      }
            }
             if(tempctx != null && tempctx instanceof BCParser.BreContext)
                {
                    currEnv.popScope();
                    break;
                      }

            value = this.visit(ctx.expr());
            if(value == 0)
            {
                temp = false;
            }
            currEnv.popScope();
        }
        currEnv.popScope();
        return null;
    }

    public Double visitForLoop(BCParser.ForLoopContext ctx)
    {
        //System.out.println("test for");
        currEnv.addScope();
        this.visit(ctx.expr(0));
        List<BCParser.StatementContext> statements = ctx.statementblock().statement();
        while(this.visit(ctx.expr(1)) != 0)
        {
            currEnv.addScope();
            BCParser.BreContext temp = null;
            BCParser.ContContext temp2 = null;
            for (BCParser.StatementContext stat : statements) {
                this.visitStatement(stat);
                temp = stat.bre();
                temp2 = stat.cont();
                if((temp != null && temp instanceof BCParser.BreContext) || (temp2 != null && temp2 instanceof BCParser.ContContext ))
                {
                    break;
                }
            } 
            currEnv.popScope();
            if(temp != null && temp instanceof BCParser.BreContext) {
                break;

                }
            this.visit(ctx.expr(2));
        }
        currEnv.popScope();
        return null;
    }

    public Double visitFForLoop(BCParser.ForLoopContext ctx)
    {
        Double d = null;
        //System.out.println("test for");
        currEnv.addScope();
        this.visit(ctx.expr(0));
        List<BCParser.StatementContext> statements = ctx.statementblock().statement();
        while(this.visit(ctx.expr(1)) != 0)
        {
            currEnv.addScope();
            BCParser.BreContext temp = null;
            BCParser.ContContext temp2 = null;
            for (BCParser.StatementContext stat : statements) {
                d = this.visitFStatement(stat);
                if(d != null)
                {
                    return d;
                }
                temp = stat.bre();
                temp2 = stat.cont();
                if((temp != null && temp instanceof BCParser.BreContext) || (temp2 != null && temp2 instanceof BCParser.ContContext ))
                {
                    break;
                }
            } 
            currEnv.popScope();
            if(temp != null && temp instanceof BCParser.BreContext) {
                break;

                }
            this.visit(ctx.expr(2));
        }
        currEnv.popScope();
        return null;
    }

    public Double visitFunctionCall(BCParser.FunctionCallContext ctx)
    {
    
        List<BCParser.ExprContext> exprs =  ctx.expr();
        //check if function is defined
        String functionName = ctx.VAR().getText();
        FunctionDef currentFct = functions.get(functionName);
        if(currentFct != null)
        {
            Enviornment tempEnv = new Enviornment();
            tempEnv.addScope();
            ArrayList<String> params = currentFct.getParams();
            int i = 0;
            for (BCParser.ExprContext arg : exprs) {
            Double value = this.visit(arg);
            if(i < params.size())
            {
            tempEnv.updateVar(params.get(i),value);
            }
            i++;
        }

        if(currentFct.getParamsNum() != i)
        {
            //incorrect number of params
            System.out.println("Incorrect number of parameters for function Excepted:" + params.size() + " Given: " + i);
            return new Double(0);
        }

        envs.push(currEnv);
        currEnv = tempEnv;

        //visit function call
        //System.out.println(currentFct.getFuncBody());
        BCLexer lexer = new BCLexer(CharStreams.fromString(currentFct.getFuncBody()));
        BCParser parser = new BCParser(new CommonTokenStream(lexer));
        BCParser.StatementblockContext tree = parser.statementblock();
        Double value = this.visitFuncStatementblock(tree);
        //System.out.println(value);
        //clean up env below
        currEnv = envs.pop();
        return value;
    }

    //function not found error
    System.out.println("Function " + functionName + " not found");
        return new Double(0);
    }

    public Double visitFunctionDefine(BCParser.FunctionDefineContext ctx) {
        ArrayList<String> params = new ArrayList<String>();
        String functionName = ctx.VAR(0).getText();
        int i = 1;
        //System.out.println("test func");
        while(ctx.VAR(i) != null)
        {
            params.add(ctx.VAR(i).getText());
            i++;
        }

        functions.put(functionName, new FunctionDef(functionName,params, ctx.statementblock().getText()));
        return null;
    }


}
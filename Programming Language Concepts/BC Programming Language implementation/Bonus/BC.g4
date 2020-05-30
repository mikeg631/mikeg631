grammar BC;
@parser::header {
   import java.lang.Math;
   import java.math.*;
   import java.util.HashMap;
   import java.util.Map;
   import java.util.Scanner;
   import java.io.BufferedReader;
   import java.io.FileInputStream;
   import java.io.InputStream;
   import java.io.InputStreamReader;
   import java.io.IOException;
   
	  
}

@parser::members {   
    public static Map<String, BigDecimal> variables = new HashMap<>();
	public static ArrayList<BigDecimal> tempList = new ArrayList<BigDecimal>();
    public static int scale = 0;
    public static boolean checkError = false;
	public static boolean checkPrint = true;;
    public static MathContext precisionContext = new MathContext(scale);
    public static boolean checkArray(String var, String pos)
    {
		if(Double.parseDouble(pos) >= Double.parseDouble(variables.getOrDefault(var + ".length",new BigDecimal(0)).toString()))
        {
	        System.out.println();
            System.out.print("Error: Out of bounds index!!! Zero returned by default.");
            checkError = true;
            return false;
        }
          return true;
    }

    }

	

exprList: /* */
((printExpr printExpr2*) | topExpr) ( (';'| '\n' |'\r')+ ((printExpr printExpr2*)  | topExpr))* (';'|'\n'| '\r')?  |
	('\n' | '\r' | ';')
	| EOF
; 

printExpr: 'print' s=STRING { 
	System.out.println();
    System.out.print($s.getText().substring(1,$s.getText().length()-1));}|
'print' e=expr { 
	    if($e.d != null)
        {
    System.out.println();
    System.out.print($e.d.toString());
        }
		       else if(checkError)
        {
                System.out.print(" Error! ");
	                checkError = false;
        }
    } 
;

printExpr2: ',' s=STRING { System.out.print($s.getText().substring(1,$s.getText().length()-1));}|
',' e=expr { 
	    if($e.d != null)
        {
    System.out.print($e.d.toString());
	        }  else if(checkError)
        {
                System.out.print(" Error! ");
                checkError = false;
        }
    
    
    
    } 
;

topExpr: expr
    { 
        if($expr.d != null && checkPrint)
        {
        System.out.println();
        System.out.print($expr.d.toString());
	        } else if(checkError)
        {
	            System.out.println();
                System.out.print("Error!");
	                checkError = false;
        }
    }

;



expr returns [BigDecimal d]: 
	arraydeclare { $d = new BigDecimal(0);
    checkPrint = false; } |
op = ('--' | '++') temp=VAR ('[' t2 = INT ']')? { 
	    checkPrint = true;
    String var = $temp.getText();
     if($t2 != null)
     {
	             String pos = $t2.getText();
         if(!checkArray(var,pos))
         {
	            $d = null;
             break;
         }
         var = var + "[" + pos + "]";
     }
      BigDecimal test = variables.getOrDefault(var,new BigDecimal(0));
     
     if($op.getText().equals("++"))
     {
	       test = test.add(new BigDecimal(1));
      }
      else if($op.getText().equals("--"))
     {
	    test = test.subtract(new BigDecimal(1));
      }
	   variables.put(var,test); 
       $d = test;
 } |
temp=VAR ('[' t2=INT ']')? op=('--' | '++')  {
	    checkPrint = true;
    String var = $temp.getText();
     if($t2 != null)
     {
	             String pos = $t2.getText();
         if(!checkArray(var,pos))
         {
	             $d = null;
             break;
         }
         var = var + "[" + pos + "]";
     }
	    BigDecimal test = variables.getOrDefault(var,new BigDecimal(0)); 
 if($op.getText().equals("++"))
     {
      variables.put(var,test.add(new BigDecimal(1)));
      }
      else if($op.getText().equals("--"))
     {
      variables.put(var,test.subtract(new BigDecimal(1))); 
      }
      $d = test;
 } |
 '-' e=expr { $d = $e.d.negate(); }|
<assoc = right>el = expr op = '^' er = expr {$d=BigDecimalMath.pow($el.d,$er.d, precisionContext);}  |
el=expr op=('*' | '/' | '%') er=expr {
	    checkPrint = true;
    if($op.getText().equals("/"))
{
     $d = ($el.d).divide($er.d,scale,RoundingMode.FLOOR);
}
else if($op.getText().equals("%"))
{
	$d = ($el.d).remainder($er.d);
    if($d.signum() == -1)
    {
        $d = $el.d;
    }
}
else if($op.getText().equals("*"))
{
	    int s1 = $el.d.scale();
        int s2 = $er.d.scale();
        $d = ($el.d).multiply($er.d);
         if(s1+s2 > scale)
        {
            $d = $d.setScale(Math.max(Math.max(scale,s1),s2), RoundingMode.HALF_UP);
        }
}} |
el=expr op=('+'|'-') er=expr {
	    checkPrint = true;
    if($op.getText().equals("+"))
{
	    $d = ($el.d).add($er.d);
}
else
{
	    $d = ($el.d).subtract($er.d);
}} |
'scale' '=' e=expr {
	    checkPrint = false;
    scale = ($e.d).intValue();
	    precisionContext = new MathContext(scale);
    $d = null;
} |
<assoc = right>temp=VAR ('[' t2 = INT ']')? op=('*=' | '/=' | '+=' | '-=' | '%=' | '^=') e=expr {
	    checkPrint = false;
    
	String var = $temp.getText();
     if($t2 != null)
     {
	             String pos = $t2.getText();
         if(!checkArray(var,pos))
         {
             $d = null;
             break;
         }
         var = var + "[" + pos + "]";
     }
     BigDecimal temp1 = variables.getOrDefault(var,new BigDecimal(0)); 
     BigDecimal temp2 = new BigDecimal(0);

    if($op.getText().equals("*="))
     {
	         temp2 = temp1.multiply($e.d);
      }
      else if($op.getText().equals("/="))
     {
		         temp2 = temp1.divide($e.d,scale,RoundingMode.FLOOR);
      }
      else if($op.getText().equals("+="))
     {
	         temp2 = temp1.add($e.d);
      }
      else if($op.getText().equals("-="))
     {
	         temp2 = temp1.subtract($e.d);
      }
      else if($op.getText().equals("%="))
     {
	         temp2 = temp1.remainder($e.d);
             if(temp2.signum() == -1)
             {
                 temp2 = temp1;
             }
      }
      else if($op.getText().equals("^="))
     {
	         temp2 = BigDecimalMath.pow(temp1,$e.d,precisionContext);//check
      }
    variables.put(var,temp2);
    $d = temp2;
} | 
<assoc = right>temp=VAR ('[' t2=INT ']')? '=' e=expr {
	    checkPrint = false;
    String var = $temp.getText();
     if($t2 != null)
     {
	            String pos = $t2.getText();
         if(!checkArray(var,pos))
         {
	             $d =  null;
             break;
         }
         var = var + "[" + pos + "]";
     }
    $d = $e.d;
    variables.put(var,$e.d);
} |
el=expr op=('>=' | '<=' | '>' | '<' | '==' | '!=') er=expr { 
	    checkPrint = true;
    boolean temp;
if($op.getText().equals(">="))
{
	temp = ($el.d).doubleValue() >= $er.d.doubleValue();
	$d = new BigDecimal( (temp ? 1 : 0));
}
else if($op.getText().equals("<="))
{
		temp = $el.d.doubleValue() <= $er.d.doubleValue();
$d = new BigDecimal((temp ? 1 : 0));  
}
else if($op.getText().equals(">"))
{
		temp = $el.d.doubleValue() > $er.d.doubleValue();
	$d = new BigDecimal((temp ? 1 : 0));  
}
else if($op.getText().equals("<"))
{
		temp = $el.d.doubleValue() < $er.d.doubleValue();
	$d = new BigDecimal((temp ? 1 : 0));  
}
else if($op.getText().equals("=="))
{
		temp = $el.d.doubleValue() == $er.d.doubleValue();
	$d = new BigDecimal((temp ? 1 : 0));  
}
else if($op.getText().equals("!="))
{
		temp = $el.d.doubleValue() != $er.d.doubleValue();
	$d = new BigDecimal((temp ? 1 : 0));  
}
} |
 op='!' e=expr { 
	    checkPrint = true;
    if($e.d.compareTo(new BigDecimal(0)) == 0){ 
	$d = new BigDecimal(1);
} else {
	$d = new BigDecimal(0); }}|
el = expr op = '&&' er = expr { if(($el.d.compareTo(new BigDecimal(0)) == 0) || ($er.d.compareTo(new BigDecimal(0)) == 0)){
	   $d = new BigDecimal(0);
}
else
{
	    $d = new BigDecimal(1);
} }|
el = expr op = '||' er = expr {if(($el.d.compareTo(new BigDecimal(0)) == 0) && ($er.d.compareTo(new BigDecimal(0)) == 0)){
	   $d = new BigDecimal(0);
}
else
{
	    $d = new BigDecimal(1);
}} |
//Functions start below
's(' e=expr ')' { 
	    checkPrint = true;
	    $d = BigDecimalMath.sin($e.d, precisionContext); } |
 'c(' e=expr ')' {
	     checkPrint = true;
	     $d = BigDecimalMath.cos($e.d, precisionContext);}| 
 'l(' e=expr ')' {
	     checkPrint = true;
	     $d = BigDecimalMath.log($e.d, precisionContext);} |
  'e(' e=expr ')' {
	      checkPrint = true;
	      $d = BigDecimalMath.exp($e.d, precisionContext);} |
 'sqrt(' e=expr ')' {
	     checkPrint = true;
	         $d = BigDecimalMath.sqrt($e.d, precisionContext);} |
p=(NUMBER | INT) { 
	    checkPrint = true;
	   $d = new BigDecimal($p.text);
 } |
'read()' { 
	    checkPrint = true;
    Scanner in = new Scanner(System.in);
	    $d = new BigDecimal(in.nextLine()); // get first expression     	     
}|
temp=VAR ('[' t2 = INT ']')? {
    checkPrint = true;
    String var = $temp.getText();
     if($t2 != null)
     {
	             String pos = $t2.getText();
         if(!checkArray(var,pos))
         {
	             $d = null;
             break;
         }
         var = var + "[" + pos + "]";
     }
	     $d= variables.getOrDefault(var, new BigDecimal(0)); } | 
'(' e=expr ')' { $d = $e.d;};

arraydeclare: VAR '[] = {' arraydeclare2 '}' {
	variables.put($VAR.getText() + ".length",new BigDecimal(tempList.size()));
	     int i = tempList.size()-1;
     for(BigDecimal item : tempList)
     {
      variables.put($VAR.getText() + "[" +  i + "]", item);   
      i--;
     }
		     tempList = new ArrayList<BigDecimal>();
     
	     }  |
         VAR '[' INT '] = new array' { variables.put($VAR.getText() + ".length",new BigDecimal($INT.text)); }
 ;

arraydeclare2:
	d =(NUMBER | INT) (',' arraydeclare2)* { tempList.add(new BigDecimal($d.text)); 
    ;}
    ;



//Functions below;;
read : 'read(' expr ')';


WS : [ \t]+ -> skip;
COMMENT : '/*' .*? '*/' -> skip ; // make comments work
VAR: [a-z][a-z0-9_]*| [a-z][a-z0-9_]* '.length'; //variable works
INT : [1-9][0-9]* | '0';
NUMBER : INT | [0-9]+ '.' [0-9]+; // definition of number
STRING : '"' ~["]* '"';


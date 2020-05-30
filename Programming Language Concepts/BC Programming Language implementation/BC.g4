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
    public static Map<String, Double> variables = new HashMap<>();
    public static boolean checkPrint = true;
    }

exprList: /* */
((printExpr printExpr2*) | topExpr) ( (';'| '\n' |'\r')+ ((printExpr printExpr2*)  | topExpr))* (';'|'\n'| '\r')? 
; 

printExpr: 'print' s=STRING { 
	    System.out.println();
    System.out.print($s.getText().substring(1,$s.getText().length()-1));}|
'print' e=expr { 
    System.out.println();
    System.out.print(Double.toString($e.d));} 
;

printExpr2: ',' s=STRING { System.out.print($s.getText().substring(1,$s.getText().length()-1));}|
',' e=expr { 
    System.out.print(Double.toString($e.d));} 
;

topExpr: expr
    { 
        if(checkPrint)
        {
        System.out.println();
        System.out.print(Double.toString($expr.d));
        } 

    }
;

expr returns [double d]: 
//first rule is pre increment/decrement 
op=('--' | '++') temp=VAR { 
     double test = 0;
	checkPrint = true;
     if($op.getText().equals("++"))
     {
      test = Double.parseDouble(variables.getOrDefault($temp.getText(),(double)0).toString()) + 1; 
      variables.put($temp.getText(),test); 
      }
      else if($op.getText().equals("--"))
     {
      test = Double.parseDouble(variables.getOrDefault($temp.getText(),(double)0).toString()) - 1; 
      variables.put($temp.getText(),test); 
      }
       $d = test;
 } |
 temp=VAR op=('--' | '++')  {
     double test = 0;
	     checkPrint = true;
 if($op.getText().equals("++"))
     {
      test = Double.parseDouble(variables.getOrDefault($temp.getText(),(double)0).toString()); 
      variables.put($temp.getText(),(test+1)); 
      }
      else if($op.getText().equals("--"))
     {
     test = Double.parseDouble(variables.getOrDefault($temp.getText(),(double)0).toString()); 
      variables.put($temp.getText(),(test-1)); 
      }
      $d = test;
 } |
 '-' e=expr { $d =-$e.d; }|
<assoc=right>el=expr op='^' er=expr {$d=Math.pow($el.d,$er.d);}  |
el=expr op=('*' | '/' | '%') er=expr {
	    checkPrint = true;
    if($op.getText().equals("/"))
{
     $d = $el.d/$er.d;
}
else if($op.getText().equals("%"))
{
    $d = ((double)$el.d) % $er.d;
}
else if($op.getText().equals("*"))
{
    $d = $el.d * $er.d;
}} |
el=expr op=('+'|'-') er=expr {
    if($op.getText().equals("+"))
{
    $d = $el.d + $er.d;
}
else
{
    $d = $el.d - $er.d;
}} |
<assoc=right>temp=VAR op=('*=' | '/=' | '+=' | '-=' | '%=' | '^=') e=expr {
	    checkPrint = false;
    double temp1 = Double.parseDouble(variables.getOrDefault($temp.getText(),(double)0).toString()); 
    double temp2 = (double)$e.d;

    if($op.getText().equals("*="))
     {
         temp1 *= temp2;
      }
      else if($op.getText().equals("/="))
     {
         temp1 /= temp2;
      }
      else if($op.getText().equals("+="))
     {
         temp1 += temp2;
      }
      else if($op.getText().equals("-="))
     {
         temp1 -= temp2;
      }
      else if($op.getText().equals("%="))
     {
         temp1 %= temp2;
      }
      else if($op.getText().equals("^="))
     {
         temp1 =Math.pow(temp1,temp2);
      }
    variables.put($temp.getText(),(double)temp1);
    $d = temp1;
} |
<assoc=right>temp=VAR '=' e=expr {
	    checkPrint = false;
    $d = (double)$e.d;
    variables.put($temp.getText(),((double)$e.d));
} |
el=expr op=('>=' | '<=' | '>' | '<' | '==' | '!=') er=expr { 
    boolean temp;
	    checkPrint = true;
if($op.getText().equals(">="))
{
temp = $el.d >= $er.d;
$d = (temp ? 1 : 0);
}
else if($op.getText().equals("<="))
{
temp = $el.d <= $er.d;
$d = (temp ? 1 : 0);  
}
else if($op.getText().equals(">"))
{
temp = $el.d > $er.d;
$d = (temp ? 1 : 0);  
}
else if($op.getText().equals("<"))
{
temp = $el.d < $er.d;
$d = (temp ? 1 : 0);  
}
else if($op.getText().equals("=="))
{
temp = $el.d == $er.d;
$d = (temp ? 1 : 0);  
}
else if($op.getText().equals("!="))
{
temp = $el.d != $er.d;
$d = (temp ? 1 : 0);  
}
} |
 op='!' e=expr { if($e.d == 0){ 
	     checkPrint = true;
$d = 1; 
} else {
$d = 0; }}|
el=expr op='&&' er=expr { if($el.d == 0 || $er.d == 0){
	    checkPrint = true;
   $d = 0;
}
else
{
    $d=1;
} }|
el=expr op='||' er=expr {if($el.d == 0 && $er.d == 0){
	    checkPrint = true;
   $d = 0;
}
else
{
    $d=1;
}} |
//Functions start below
's(' e=expr ')' { 
	    checkPrint = true;
    $d = Math.sin($e.d); } |
 'c(' e=expr ')' {
	     checkPrint = true;
     $d = Math.cos($e.d);}| 
 'l(' e=expr ')' {
	     checkPrint = true;
     $d = Math.log($e.d);} |
  'e(' e=expr ')' {
	      checkPrint = true;
      $d = Math.exp($e.d);} |
 'sqrt(' e=expr ')' {
	     checkPrint = true;
     $d = Math.sqrt($e.d);} |
NUMBER {
	    checkPrint = true; 
    $d=Double.parseDouble($NUMBER.text); 
 } |
'read()' { 
    Scanner in = new Scanner(System.in);
    $d = 0;
    $d = in.nextDouble(); // get first expression 
        	     
}|
temp=VAR { 
	    checkPrint = true;
    $d= Double.parseDouble(variables.getOrDefault($temp.getText(),(double)0).toString()); } | 
'(' e = expr ')' { checkPrint = true;
 $d = $e.d; };



//Functions below;;
read : 'read(' expr ')';


WS : [ \t]+ -> skip;
COMMENT : '/*' .*? '*/' -> skip ; // make comments work
VAR : [a-z][a-z0-9_]*; //variable works?
NUMBER : [1-9][0-9]* | [0-9]+ '.' [0-9]+ | '0'; // definition of number
STRING : '"' ~["]* '"';

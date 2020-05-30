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

statements: statement statement*;

statement:
	functionDefine |
    printString |
    ifStatement | 
	whileLoop |
	forLoop |
    ret |
    cont |
    bre |
	expr ';' 
;
printString: 'print' STRING;
statementblock: '{' statement statement* '}';

ret: RET expr ';';
bre: BRE;
cont: CONT;
 


ifStatement:
		'if' '(' expr ')' statementblock ('else' statementblock)?;

whileLoop: 'while' '(' expr ')' statementblock;

forLoop: 'for(' e1=expr ';' e2=expr ';' e3=expr ')' statementblock;

functionDefine: 'define' f=VAR '(' (VAR (',' VAR)*)? ')' statementblock;


expr returns [double d]: 
//first rule is pre increment/decrement 
op=('--' | '++') temp=VAR #prefixOP  |
 temp=VAR op=('--' | '++') #postfixOP  |
 '-' e=expr { $d =-$e.d; } #negateOP |
<assoc=right>el=expr op='^' er=expr #exponentOP  |
el=expr op='*' er=expr #multiplyOP |
el = expr op = '/' er = expr #divideOP |
el = expr op = '%' er = expr #modulusOP |
el = expr op = '+' er = expr #additionOP | 
el=expr op= '-' er=expr #subtractionOP |
<assoc=right>temp=VAR op=('*=' | '/=' | '+=' | '-=' | '%=' | '^=') e=expr #assigmentWithCalcOP |
<assoc=right>temp=VAR '=' e=expr #assignmentOP |
el=expr op=('>=' | '<=' | '>' | '<' | '==' | '!=') er=expr #relationalOP |
 op='!' e=expr #notOP |
el=expr op='&&' er=expr #andOP |
el=expr op='||' er=expr #orOP |
//Functions start below
's(' e=expr ')' #sinOP |
 'c(' e=expr ')' #cosOP | 
 'l(' e=expr ')' #logOP |
  'e(' e=expr ')' #expOP |
 'sqrt(' e=expr ')' #sqrtOP |
'read()' #read |
'print' e=expr #print |
NUMBER #number|
temp=VAR #var |
'(' e = expr ')' { System.out.println("Test"); } # parenOP |
VAR '(' (expr (',' expr)*)? ')' #functionCall;


WS : [ \t\r\n]+ -> skip;
COMMENT : '/*' .*? '*/' -> skip ; // make comments work
RET: 'return';
CONT: 'continue';
BRE: 'break';
VAR : [a-z][a-z0-9_]*; //variable works?
NUMBER : [1-9][0-9]* | [0-9]+ '.' [0-9]+ | '0'; // definition of number
STRING : '"' ~["]* '"';
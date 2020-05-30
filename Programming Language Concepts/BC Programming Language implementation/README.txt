Developed by: Michael Gordon

Hello welcome to my implementation of the BC programming language.

Getting Started:
To run you must first generate java code from the gammar using a command like  "antlr4 BC.g4".
Next compile the with "javac *BC.java". Make sure that the classpath has the antlr4 library.
Run using exprList as the top rule: grun BC exprList  testFile.bc
Note the Bonus is included in the Bonus directory. Instructions for running the bonus below

What's in the box?

1. Comments ex: /* Junk here */
Test using commentTest.bc

2. Basic Expressions with variable (Example code seperated by ';')
a++; a--;
--a; a++;
a = 5;
a+=b; a-=b; a*=b; a/=b; a%=b; a^=b;
a*b+c*(-d+f)^2;

Test using VarOpsTest.bc

3. Boolean Expressions:
a && b || !c

Test using BooleanTest.bc (grun BC exprList  BooleanTest.bc -gui)

4. Precedence: From bc manual https://www.gnu.org/software/bc/manual/html_mono/bc.html#SEC12 
(lowest to highest)
|| operator, left associative
&& operator, left associative
! operator, nonassociative
Relational operators, left associative
Assignment operator, right associative
+ and - operators, left associative
*, / and % operators, left associative
^ operator, right associative
unary - operator, nonassociative
++ and -- operators, nonassociative

Test using PrecedenceTest.bc

5. read();
Examples in readTest.bc

6. Printing 
See PrintingTest.bc

7. Math Library plus sqrt()
s, c , l, e and sqrt implemented

See fctTest.bc for examples

BONUS:

Arrays:
Arrays are intilaized in two ways.
1) a[] = {1,2,3,4};
2) b[4] = new array;

In both cases the length is fixed and can be accessed by arrayName.length (a.length or b.length in the cases above).
Indexing starts at 0 and ends at length-1.
Access elements: ex: a=a[2];
Assigment operations can be done just like normal variables.
Accessing out of bounds will cause error to print. If an operations are attempted with this element, then the program will crash.

Test with arrayTest.bc

Arbitrary Precision:
I used the BigDecimal library and BigDecimalMath(more info here: https://github.com/eobermuhlner/big-math/blob/master/README.md) to implement Arbitrary Precision.
Scale is default set to 0, like in bc. Scale is set by changing the value of the scale variable ex: scale = 5. Sets the scale to 5.

Operation	Preferred Scale of Result
Add	         max(addend.scale(), augend.scale())
Subtract	  max(minuend.scale(), subtrahend.scale())
Multiply	   multiplier.scale() + multiplicand.scale() or max(multiplier.scale(), multiplicand.scale(), global scale) if multipler.scale() + multiplicand.scale() > global scale
Divide	      the global scale

See PrecTest.bc for examples
Developed by Michael Gordon

RPN in OCAML

Welcome to my implmentation of RPN in OCAML. Some key assumputions were made during the development of this program:
*Only valid operators will be used ('^', '*' , '/', '+', '-'), can cause handled errors.
*Numbers will be entered in valid formats e.g 5, 5., 5.0. Numbers 5.4.3 like will errors.
*The only input will be numbers and valid operators seperated by spaces

It should be noted that errors in formatting of a RPN expression will cause handled errors (not fatal). E.g '5+5' or 5 5 5 + will print "Error: not enough arguments to evaluate all numbers" to the console.

Some example test cases are included in the tests.txt. Here are the expected results: 
5 3 2 * +                           =   11.
12 3 - 3 /                          =   3.
15 7 1 1 + - / 3 * 2 1 1 + + -      =   5.
17 7 1 1 + - / 3 * 2 1 1 + + -      =   6.2
9 5 3 + 2 4 ^ - +                   =   1.
2.5 3 11.3 + 5 - *                  =   23.25
13 7 2.4 1 + ^ / 3 / 2 5.3 1 + * -  =   -12.5941991884
5 + 5                               =   Error: not enough operands
5 7 + -                             =   Error: not enough operands
5 3 5 +                             =   Error: not enough arguments to evaluate all numbers
5 5 &                               =   Error: incorrect operator
5.4.3 4 *                           =   Error: incorrect number format
4.3f 5 *                            =   Error: incorrect number format

Note the last 3 examples are intended negative test cases.

Running the Program:

I have included a main interactive program and a verison for the oUnit tests.

For the main program compile using:
ocaml str.cma RPN.ml -o RPN^C
Then run,
ocamlrun RPN

This program reads input one line at a time from user input into the console.

To run the oUnit tests:
First compile:
 ocamlfind ocamlopt -package oUnit -linkpkg -o test str.cmxa RPNtest.ml test.ml
 This will produce a test.exe file. In windows a good way to run this is
 cmd /k test.exe
 The cmd /k ensures the prompt doesn't close right away.

A bytecode compiled verison of this test did not work for me on cgywin, however it might on linux
 ocamlfind ocamlc -package oUnit -linkpkg -o test str.cma RPNtest.ml test.ml
open OUnit
(* Test Fixture *)
let test_fixture = "RPN" >:::
[
  "parseExpr: 5 3 2 * + = 11." >:: ( fun () -> 
    assert_equal "11." (RPNtest.parseExpr "5 3 2 * +");
  );

  "parseExpr: 12 3 - 3 / = 3." >:: ( fun () -> 
    assert_equal "3." (RPNtest.parseExpr "12 3 - 3 /");
  );

  "parseExpr: 15 7 1 1 + - / 3 * 2 1 1 + + - = 5." >:: ( fun () -> 
    assert_equal "5." (RPNtest.parseExpr "15 7 1 1 + - / 3 * 2 1 1 + + -");
  );
  
  "parseExpr: 17 7 1 1 + - / 3 * 2 1 1 + + - = 6.2" >:: ( fun () -> 
    assert_equal "6.2" (RPNtest.parseExpr "17 7 1 1 + - / 3 * 2 1 1 + + -");
  );

   "parseExpr: 9 5 3 + 2 4 ^ - + = 1." >:: ( fun () -> 
    assert_equal "1." (RPNtest.parseExpr "9 5 3 + 2 4 ^ - +");
  );

  "parseExpr: 2.5 3 11.3 + 5 - * = 23.25" >:: ( fun () -> 
    assert_equal "23.25" (RPNtest.parseExpr "2.5 3 11.3 + 5 - *");
  );

  "parseExpr: 13 7 2.4 1 + ^ / 3 / 2 5.3 1 + * - = -12.59" >:: ( fun () -> 
    assert_equal "-12.5941991884" (RPNtest.parseExpr "13 7 2.4 1 + ^ / 3 / 2 5.3 1 + * -");
  );

  "parseExpr: 5 + 5 = error" >:: ( fun () -> 
    assert_equal "Error: not enough operands" (RPNtest.parseExpr "5 + 5");
  );

  "parseExpr: 5 7 + - = error" >:: ( fun () -> 
    assert_equal "Error: not enough operands" (RPNtest.parseExpr "5 7 + -");
  );

  "parseExpr: 5 3 5 + = error" >:: ( fun () -> 
    assert_equal "Error: not enough arguments to evaluate all numbers" (RPNtest.parseExpr "5 3 5 +");
  );

  "parseExpr: 5 5 & = error" >:: ( fun () -> 
    assert_equal "Error: incorrect operator" (RPNtest.parseExpr "5 5 &");
  );

  "parseExpr: 5.4.3 4 * = error" >:: ( fun () -> 
    assert_equal "Error: incorrect number format" (RPNtest.parseExpr "5.4.3 4 *");
  );

  "parseExpr: 4.3f 5 * = error" >:: ( fun () -> 
    assert_equal "Error: incorrect number format" (RPNtest.parseExpr "4.3f 5 *");
  );


]

(* Test Runner; ~verbose:true gives info on succ tests *)
let _ = run_test_tt test_fixture
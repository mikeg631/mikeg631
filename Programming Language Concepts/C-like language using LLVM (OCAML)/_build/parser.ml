
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WHILE
    | VOID
    | VAR of (
# 11 "parser.mly"
       (string)
# 13 "parser.ml"
  )
    | TRUE
    | TIMES
    | TCNE
    | TCLT
    | TCLE
    | TCGT
    | TCGE
    | TCEQ
    | STRINGD
    | STRING of (
# 8 "parser.mly"
       (string)
# 27 "parser.ml"
  )
    | SEMICOLON
    | RPAR
    | RETURN
    | RBRACE
    | PRINTLN
    | PRINTF
    | POW
    | PLUS
    | OR
    | NOT
    | MINUS
    | LPAR
    | LBRACE
    | INTD
    | INT of (
# 5 "parser.mly"
       (int)
# 46 "parser.ml"
  )
    | INCREMENT
    | IF
    | FOR
    | FALSE
    | EQUAL
    | EOL
    | EOF
    | ELSEIF
    | ELSE
    | DOUBLED
    | DOUBLE of (
# 7 "parser.mly"
       (float)
# 61 "parser.ml"
  )
    | DIVIDE
    | DECREMENT
    | DECLARE
    | COMMA
    | BOOLD
    | AND
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState304
  | MenhirState301
  | MenhirState293
  | MenhirState290
  | MenhirState279
  | MenhirState278
  | MenhirState277
  | MenhirState272
  | MenhirState270
  | MenhirState267
  | MenhirState263
  | MenhirState262
  | MenhirState261
  | MenhirState260
  | MenhirState258
  | MenhirState257
  | MenhirState254
  | MenhirState253
  | MenhirState250
  | MenhirState247
  | MenhirState246
  | MenhirState245
  | MenhirState242
  | MenhirState240
  | MenhirState237
  | MenhirState235
  | MenhirState232
  | MenhirState231
  | MenhirState230
  | MenhirState228
  | MenhirState227
  | MenhirState226
  | MenhirState225
  | MenhirState220
  | MenhirState216
  | MenhirState215
  | MenhirState212
  | MenhirState208
  | MenhirState207
  | MenhirState202
  | MenhirState197
  | MenhirState196
  | MenhirState191
  | MenhirState187
  | MenhirState186
  | MenhirState184
  | MenhirState182
  | MenhirState179
  | MenhirState178
  | MenhirState177
  | MenhirState175
  | MenhirState174
  | MenhirState172
  | MenhirState170
  | MenhirState169
  | MenhirState167
  | MenhirState155
  | MenhirState154
  | MenhirState152
  | MenhirState151
  | MenhirState150
  | MenhirState147
  | MenhirState146
  | MenhirState145
  | MenhirState144
  | MenhirState143
  | MenhirState142
  | MenhirState141
  | MenhirState140
  | MenhirState139
  | MenhirState138
  | MenhirState137
  | MenhirState136
  | MenhirState135
  | MenhirState134
  | MenhirState133
  | MenhirState132
  | MenhirState131
  | MenhirState130
  | MenhirState129
  | MenhirState126
  | MenhirState125
  | MenhirState124
  | MenhirState122
  | MenhirState121
  | MenhirState120
  | MenhirState119
  | MenhirState118
  | MenhirState117
  | MenhirState116
  | MenhirState115
  | MenhirState114
  | MenhirState113
  | MenhirState112
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState107
  | MenhirState106
  | MenhirState105
  | MenhirState104
  | MenhirState103
  | MenhirState102
  | MenhirState101
  | MenhirState100
  | MenhirState99
  | MenhirState93
  | MenhirState88
  | MenhirState86
  | MenhirState83
  | MenhirState82
  | MenhirState78
  | MenhirState74
  | MenhirState70
  | MenhirState69
  | MenhirState65
  | MenhirState64
  | MenhirState60
  | MenhirState55
  | MenhirState52
  | MenhirState50
  | MenhirState49
  | MenhirState48
  | MenhirState47
  | MenhirState45
  | MenhirState44
  | MenhirState42
  | MenhirState41
  | MenhirState40
  | MenhirState36
  | MenhirState35
  | MenhirState34
  | MenhirState33
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState28
  | MenhirState27
  | MenhirState24
  | MenhirState23
  | MenhirState22
  | MenhirState17
  | MenhirState16
  | MenhirState15
  | MenhirState14
  | MenhirState13
  | MenhirState12
  | MenhirState10
  | MenhirState9
  | MenhirState8
  | MenhirState7
  | MenhirState6
  | MenhirState5
  | MenhirState4
  | MenhirState3
  | MenhirState2
  | MenhirState0

# 1 "parser.mly"
  
    open Ast

# 248 "parser.ml"

let rec _menhir_goto_nonempty_list_funElse_if_ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((Ast.expr * Ast.funCodeblock) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState228 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState240
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState240)
        | BOOLD | DECREMENT | DOUBLE _ | DOUBLED | FOR | IF | INCREMENT | INT _ | INTD | LPAR | MINUS | PRINTF | PRINTLN | RBRACE | RETURN | STRINGD | VAR _ | VOID | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), _, (c : (
# 11 "parser.mly"
       (string)
# 275 "parser.ml"
            ))), _), _, (code : (Ast.funCodeblock))), _, (else1 : ((Ast.expr * Ast.funCodeblock) list))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 180 "parser.mly"
                                                              ( FunIf((List.append [(Var(c),code);] else1)) )
# 283 "parser.ml"
             in
            _menhir_goto_if_Funstmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState242 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Ast.expr * Ast.funCodeblock))), _, (xs : ((Ast.expr * Ast.funCodeblock) list))) = _menhir_stack in
        let _v : ((Ast.expr * Ast.funCodeblock) list) = 
# 223 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 299 "parser.ml"
         in
        _menhir_goto_nonempty_list_funElse_if_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState246 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState250
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState250)
        | BOOLD | DECREMENT | DOUBLE _ | DOUBLED | FOR | IF | INCREMENT | INT _ | INTD | LPAR | MINUS | PRINTF | PRINTLN | RBRACE | RETURN | STRINGD | VAR _ | VOID | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (c : (Ast.expr))), _, (code : (Ast.funCodeblock))), _, (else1 : ((Ast.expr * Ast.funCodeblock) list))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 176 "parser.mly"
                                                                    ( FunIf((List.append [(c,code);] else1)) )
# 327 "parser.ml"
             in
            _menhir_goto_if_Funstmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_for_Funstmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funStatement) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (st : (Ast.funStatement)) = _v in
    let _v : (Ast.funStatement) = 
# 130 "parser.mly"
                  ( st )
# 347 "parser.ml"
     in
    _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_funElse_if : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr * Ast.funCodeblock) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ELSEIF ->
        _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState242
    | BOOLD | DECREMENT | DOUBLE _ | DOUBLED | ELSE | FOR | IF | INCREMENT | INT _ | INTD | LPAR | MINUS | PRINTF | PRINTLN | RBRACE | RETURN | STRINGD | VAR _ | VOID | WHILE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Ast.expr * Ast.funCodeblock))) = _menhir_stack in
        let _v : ((Ast.expr * Ast.funCodeblock) list) = 
# 221 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 366 "parser.ml"
         in
        _menhir_goto_nonempty_list_funElse_if_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState242

and _menhir_goto_if_Funstmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funStatement) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (st : (Ast.funStatement)) = _v in
    let _v : (Ast.funStatement) = 
# 129 "parser.mly"
                 ( st )
# 382 "parser.ml"
     in
    _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v

and _menhir_run229 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOUBLE _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
        | FALSE ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
        | LPAR ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | MINUS ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | NOT ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | TRUE ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState230 in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AND ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | DIVIDE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | LPAR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | OR ->
                _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | PLUS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState231 in
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LBRACE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232)
            | TCEQ ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | TCGE ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | TCGT ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | TCLE ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | TCLT ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | TCNE ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | TIMES ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_while_Funstmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funStatement) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (st : (Ast.funStatement)) = _v in
    let _v : (Ast.funStatement) = 
# 131 "parser.mly"
                    ( st )
# 480 "parser.ml"
     in
    _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_list_funStatement_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funCodeblock) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState175 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (fs : (Ast.funCodeblock))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.funCodeblock) = 
# 64 "parser.mly"
                                              ( fs )
# 503 "parser.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState179 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((_menhir_stack, _menhir_s), _, (c : (
# 11 "parser.mly"
       (string)
# 513 "parser.ml"
                ))), _), _, (f : (Ast.funCodeblock))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 203 "parser.mly"
                                            ( FunWhile(Var(c), f) )
# 521 "parser.ml"
                 in
                _menhir_goto_while_Funstmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState182 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _menhir_s), _, (c : (Ast.expr))), _, (f : (Ast.funCodeblock))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 202 "parser.mly"
                                                 ( FunWhile(c, f) )
# 534 "parser.ml"
                 in
                _menhir_goto_while_Funstmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState227 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | ELSE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_s = MenhirState228 in
                    let _menhir_stack = (_menhir_stack, _menhir_s) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | LBRACE ->
                        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState237)
                | ELSEIF ->
                    _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState228
                | BOOLD | DECREMENT | DOUBLE _ | DOUBLED | FOR | IF | INCREMENT | INT _ | INTD | LPAR | MINUS | PRINTF | PRINTLN | RBRACE | RETURN | STRINGD | VAR _ | VOID | WHILE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((((_menhir_stack, _menhir_s), _, (c : (
# 11 "parser.mly"
       (string)
# 562 "parser.ml"
                    ))), _), _, (code : (Ast.funCodeblock))) = _menhir_stack in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : (Ast.funStatement) = 
# 183 "parser.mly"
                                          ( FunIf([(Var(c),code);]))
# 570 "parser.ml"
                     in
                    _menhir_goto_if_Funstmt _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228)
            | MenhirState232 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((_menhir_stack, _menhir_s), _, (c : (
# 11 "parser.mly"
       (string)
# 583 "parser.ml"
                ))), _), _, (code : (Ast.funCodeblock))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.expr * Ast.funCodeblock) = 
# 190 "parser.mly"
                                             ( (Var(c),code) )
# 591 "parser.ml"
                 in
                _menhir_goto_funElse_if _menhir_env _menhir_stack _menhir_s _v
            | MenhirState235 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _menhir_s), _, (c : (Ast.expr))), _, (code : (Ast.funCodeblock))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.expr * Ast.funCodeblock) = 
# 189 "parser.mly"
                                                   ( (c,code) )
# 604 "parser.ml"
                 in
                _menhir_goto_funElse_if _menhir_env _menhir_stack _menhir_s _v
            | MenhirState237 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((((_menhir_stack, _menhir_s), _, (c : (
# 11 "parser.mly"
       (string)
# 613 "parser.ml"
                ))), _), _, (code : (Ast.funCodeblock))), _), _, (else1 : (Ast.funCodeblock))) = _menhir_stack in
                let _6 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 182 "parser.mly"
                                                                     ( FunIf([(Var(c),code); (Boolean(true),else1);]) )
# 622 "parser.ml"
                 in
                _menhir_goto_if_Funstmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState240 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((((_menhir_stack, _menhir_s), _, (c : (
# 11 "parser.mly"
       (string)
# 631 "parser.ml"
                ))), _), _, (code : (Ast.funCodeblock))), _, (else1 : ((Ast.expr * Ast.funCodeblock) list))), _, (else2 : (Ast.funCodeblock))) = _menhir_stack in
                let _7 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 181 "parser.mly"
                                                                                       ( FunIf(List.append (List.append [(Var(c),code);] else1) [(Boolean(true),else2);]) )
# 640 "parser.ml"
                 in
                _menhir_goto_if_Funstmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState245 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | ELSE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_s = MenhirState246 in
                    let _menhir_stack = (_menhir_stack, _menhir_s) in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | LBRACE ->
                        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState247
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState247)
                | ELSEIF ->
                    _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | BOOLD | DECREMENT | DOUBLE _ | DOUBLED | FOR | IF | INCREMENT | INT _ | INTD | LPAR | MINUS | PRINTF | PRINTLN | RBRACE | RETURN | STRINGD | VAR _ | VOID | WHILE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _, (c : (Ast.expr))), _, (code : (Ast.funCodeblock))) = _menhir_stack in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : (Ast.funStatement) = 
# 179 "parser.mly"
                                                ( FunIf([(c,code);]))
# 672 "parser.ml"
                     in
                    _menhir_goto_if_Funstmt _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState246)
            | MenhirState247 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((((_menhir_stack, _menhir_s), _, (c : (Ast.expr))), _, (code : (Ast.funCodeblock))), _), _, (else1 : (Ast.funCodeblock))) = _menhir_stack in
                let _6 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 178 "parser.mly"
                                                                           ( FunIf([(c,code); (Boolean(true),else1);]) )
# 690 "parser.ml"
                 in
                _menhir_goto_if_Funstmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState250 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((((_menhir_stack, _menhir_s), _, (c : (Ast.expr))), _, (code : (Ast.funCodeblock))), _, (else1 : ((Ast.expr * Ast.funCodeblock) list))), _, (else2 : (Ast.funCodeblock))) = _menhir_stack in
                let _7 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 177 "parser.mly"
                                                                                             ( FunIf(List.append (List.append [(c,code);] else1) [(Boolean(true),else2);]) )
# 704 "parser.ml"
                 in
                _menhir_goto_if_Funstmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState267 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((((_menhir_stack, _menhir_s), _, (a : (Ast.assignment))), _, (c : (
# 11 "parser.mly"
       (string)
# 713 "parser.ml"
                ))), _), _, (i : (Ast.increment))), _, (f : (Ast.funCodeblock))) = _menhir_stack in
                let _7 = () in
                let _5 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 197 "parser.mly"
                                                                             ( FunFor(a,Var(c), i,f))
# 722 "parser.ml"
                 in
                _menhir_goto_for_Funstmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState272 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((((_menhir_stack, _menhir_s), _, (a : (Ast.assignment))), _, (c : (Ast.expr))), _, (i : (Ast.increment))), _, (f : (Ast.funCodeblock))) = _menhir_stack in
                let _7 = () in
                let _5 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 196 "parser.mly"
                                                                                   ( FunFor(a,c, i,f))
# 736 "parser.ml"
                 in
                _menhir_goto_for_Funstmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState174 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((_menhir_stack, _menhir_s, (_1 : (string))), (_2 : (
# 11 "parser.mly"
       (string)
# 745 "parser.ml"
                ))), _, (_3 : (Ast.argList))), _, (_4 : (Ast.funCodeblock))) = _menhir_stack in
                let _v : (Ast.global) = 
# 78 "parser.mly"
                                            ( DefineFunc(_1,_2,_3,_4) )
# 750 "parser.ml"
                 in
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (f : (Ast.global)) = _v in
                let _v : (Ast.global) = 
# 55 "parser.mly"
                ( f )
# 758 "parser.ml"
                 in
                _menhir_goto_global _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                _menhir_fail ())
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState290 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Ast.funStatement))), _, (xs : (Ast.funCodeblock))) = _menhir_stack in
        let _v : (Ast.funCodeblock) = 
# 213 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 776 "parser.ml"
         in
        _menhir_goto_list_funStatement_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run186 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 785 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
    | FALSE ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState186
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
    | LPAR ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState186
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState186
    | NOT ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState186
    | STRING _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
    | TRUE ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState186
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState186 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | OR ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState187 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 835 "parser.ml"
            ))), _), _, (e : (
# 11 "parser.mly"
       (string)
# 839 "parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.assignment) = 
# 172 "parser.mly"
                               ( AssignVar(v,Var(e)) )
# 846 "parser.ml"
             in
            _menhir_goto_assignment _menhir_env _menhir_stack _menhir_s _v
        | TCEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | TCGE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | TCGT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | TCLE ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | TCLT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | TCNE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186

and _menhir_reduce67 : _menhir_env -> (('ttv_tail * _menhir_state * (Ast.expr)) * _menhir_state) * _menhir_state * (
# 11 "parser.mly"
       (string)
# 875 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 881 "parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : (Ast.expr) = 
# 122 "parser.mly"
                                        ( Add(e1, Var(e2)) )
# 887 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_nonempty_list_funArgs_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funArg list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 907 "parser.ml"
            ))), _), _, (e : (
# 11 "parser.mly"
       (string)
# 911 "parser.ml"
            ))), _, (e2 : (Ast.funArg list))) = _menhir_stack in
            let _5 = () in
            let _2 = () in
            let _v : (Ast.expr) = 
# 93 "parser.mly"
                                      ( FunCall(v,(List.append [VarArg(e);] e2)) )
# 918 "parser.ml"
             in
            _menhir_goto_funCall _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Ast.funArg))), _, (xs : (Ast.funArg list))) = _menhir_stack in
        let _v : (Ast.funArg list) = 
# 223 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 934 "parser.ml"
         in
        _menhir_goto_nonempty_list_funArgs_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 949 "parser.ml"
            ))), _), _, (e : (Ast.expr))), _, (e2 : (Ast.funArg list))) = _menhir_stack in
            let _5 = () in
            let _2 = () in
            let _v : (Ast.expr) = 
# 92 "parser.mly"
                                       ( FunCall(v,(List.append [Arg(e);] e2)) )
# 956 "parser.ml"
             in
            _menhir_goto_funCall _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce38 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 248 "parser.mly"
             ( Comp(_1) )
# 974 "parser.ml"
     in
    _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v

and _menhir_run185 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 981 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_menhir_stack, _menhir_s, (_1 : (
# 11 "parser.mly"
       (string)
# 989 "parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : (Ast.increment) = 
# 208 "parser.mly"
                 ( PostInc(_1) )
# 995 "parser.ml"
     in
    _menhir_goto_increment _menhir_env _menhir_stack _menhir_s _v

and _menhir_run195 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 1002 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_menhir_stack, _menhir_s, (_1 : (
# 11 "parser.mly"
       (string)
# 1010 "parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : (Ast.increment) = 
# 210 "parser.mly"
                 ( PostDec(_1) )
# 1016 "parser.ml"
     in
    _menhir_goto_increment _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_increment : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.increment) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState262 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState267)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState270 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState272
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState272)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState290 | MenhirState175 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (s : (Ast.increment))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.funStatement) = 
# 134 "parser.mly"
                         (  StatementAssign(match s with | PreInc(s) -> AssignVar(s,Add(Var(s),Int(1))) | PostInc(s) -> AssignVar(s,Add(Var(s),Int(1))) | PostDec(s) -> AssignVar(s ,Sub(Var(s),Int(1))) |  PreDec(s) -> AssignVar(s ,Sub(Var(s),Int(1))))  )
# 1082 "parser.ml"
             in
            _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce114 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.funCodeblock) = 
# 211 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( [] )
# 1099 "parser.ml"
     in
    _menhir_goto_list_funStatement_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run176 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOUBLE _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
        | FALSE ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState177
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
        | LPAR ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState177
        | MINUS ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState177
        | NOT ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState177
        | TRUE ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState177
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState177 in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AND ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | DIVIDE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | LPAR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | OR ->
                _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | PLUS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState178 in
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LBRACE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState179
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179)
            | TCEQ ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | TCGE ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | TCGT ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | TCLE ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | TCLT ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | TCNE ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | TIMES ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 1192 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DECREMENT ->
        _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | DIVIDE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | EQUAL ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | INCREMENT ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | LPAR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | PLUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | TIMES ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184

and _menhir_run196 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
    | FALSE ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
    | LPAR ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | NOT ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | SEMICOLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState196 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.funStatement) = 
# 139 "parser.mly"
                    ( EmptyReturn(""))
# 1249 "parser.ml"
         in
        _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
    | STRING _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
    | TRUE ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState196 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | OR ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState197 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (s : (
# 11 "parser.mly"
       (string)
# 1283 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 137 "parser.mly"
                          ( ReturnVar(s) )
# 1290 "parser.ml"
             in
            _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
        | TCEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | TCGE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | TCGT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | TCLE ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | TCLT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | TCNE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196

and _menhir_run206 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOUBLE _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
        | LPAR ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | MINUS ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | STRING _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState207 in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DIVIDE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState208
            | LPAR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState208
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState208
            | PLUS ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState208
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState208 in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _, (s : (
# 11 "parser.mly"
       (string)
# 1360 "parser.ml"
                ))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 74 "parser.mly"
                            ( Println(VarString(s)) )
# 1368 "parser.ml"
                 in
                _menhir_goto_println _menhir_env _menhir_stack _menhir_s _v
            | TIMES ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState208
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState208)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run214 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOUBLE _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState215 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState215 _v
        | LPAR ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState215
        | MINUS ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState215
        | STRING _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState215 _v
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState215 in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DIVIDE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | LPAR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | PLUS ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState216 in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _, (s : (
# 11 "parser.mly"
       (string)
# 1432 "parser.ml"
                ))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.funStatement) = 
# 69 "parser.mly"
                           ( Printf(VarString(s)) )
# 1440 "parser.ml"
                 in
                _menhir_goto_printf _menhir_env _menhir_stack _menhir_s _v
            | TIMES ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState215)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run224 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOUBLE _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState225 _v
        | FALSE ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState225 _v
        | LPAR ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | MINUS ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | NOT ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | TRUE ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState225 in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AND ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | DIVIDE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | LPAR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | OR ->
                _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | PLUS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState226 in
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LBRACE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState227)
            | TCEQ ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | TCGE ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | TCGT ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | TCLE ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | TCLT ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | TCNE ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | TIMES ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState226
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState226)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState225)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run252 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BOOLD ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState253
        | DOUBLED ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState253
        | INTD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState253
        | STRINGD ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState253
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState253 in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQUAL ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState254
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState254)
        | VOID ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState253
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState253)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_nonempty_list_global_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.top) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (g : (Ast.top)) = _v in
        let _v : (Ast.top) = 
# 52 "parser.mly"
                ( g )
# 1601 "parser.ml"
         in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (Ast.top))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 42 "parser.mly"
      (Ast.top)
# 1616 "parser.ml"
            ) = 
# 49 "parser.mly"
                           ( _1 )
# 1620 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 42 "parser.mly"
      (Ast.top)
# 1627 "parser.ml"
            )) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState301 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.top)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Ast.global))) = _menhir_stack in
        let _v : (Ast.top) = 
# 223 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 1644 "parser.ml"
         in
        _menhir_goto_nonempty_list_global_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce153 : _menhir_env -> ((('ttv_tail * _menhir_state * (string)) * (
# 11 "parser.mly"
       (string)
# 1653 "parser.ml"
)) * _menhir_state) * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _ ->
    let ((((_menhir_stack, _menhir_s, (_1 : (string))), (v : (
# 11 "parser.mly"
       (string)
# 1659 "parser.ml"
    ))), _), _, (e : (Ast.expr))) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _v : (Ast.declare) = 
# 163 "parser.mly"
                                       ( DeclareVarAssign(_1, v, e) )
# 1666 "parser.ml"
     in
    _menhir_goto_vardeclare _menhir_env _menhir_stack _menhir_s _v

and _menhir_run130 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState130
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState130
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState130 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 1706 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 235 "parser.mly"
                        ( NotEqual(e1, Var(e2)) )
# 1712 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130

and _menhir_run133 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState133 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 1760 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 239 "parser.mly"
                        (  LessThan(e1, Var(e2)) )
# 1766 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133

and _menhir_run136 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState136
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState136
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState136 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 1814 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 236 "parser.mly"
                        ( LessThanEqual(e1, Var(e2)) )
# 1820 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState137)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136

and _menhir_run139 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState139 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 1868 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 238 "parser.mly"
                        ( GreaterThan(e1, Var(e2)) )
# 1874 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139

and _menhir_run142 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState142
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState142
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState142 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 1922 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 237 "parser.mly"
                        ( GreaterThanEqual(e1, Var(e2)) )
# 1928 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142

and _menhir_run145 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState145 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 1976 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 234 "parser.mly"
                        ( Equal(e1, Var(e2)) )
# 1982 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | STRING _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState49 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | COMMA | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            _menhir_reduce67 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_reduce63 : _menhir_env -> (('ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2041 "parser.ml"
)) * _menhir_state) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 2047 "parser.ml"
    ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
    let _2 = () in
    let _v : (Ast.expr) = 
# 118 "parser.mly"
                                       ( Add(Var(e1), e2) )
# 2053 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce54 : _menhir_env -> (('ttv_tail * _menhir_state * (Ast.expr)) * _menhir_state) * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
    let _2 = () in
    let _v : (Ast.expr) = 
# 109 "parser.mly"
                                        ( Add(e1, e2) )
# 2064 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState23 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | AND | COMMA | OR | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 2104 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 120 "parser.mly"
                                       ( Mul(e1,Var(e2)) )
# 2110 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run26 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : (Ast.expr) = 
# 106 "parser.mly"
                                     ( e )
# 2132 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState27 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | AND | COMMA | OR | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            _menhir_reduce67 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run33 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState33 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | AND | COMMA | OR | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 2214 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 123 "parser.mly"
                                        ( Sub(e1, Var(e2)) )
# 2220 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState30 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | AND | COMMA | OR | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 2268 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 121 "parser.mly"
                                        ( Divide(e1,Var(e2)) )
# 2274 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_goto_printf : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funStatement) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMICOLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (p : (Ast.funStatement))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.funStatement) = 
# 141 "parser.mly"
                      (p )
# 2302 "parser.ml"
         in
        _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_println : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funStatement) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMICOLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (p : (Ast.funStatement))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.funStatement) = 
# 142 "parser.mly"
                       ( p )
# 2328 "parser.ml"
         in
        _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_funArgs : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funArg) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | RPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Ast.funArg))) = _menhir_stack in
        let _v : (Ast.funArg list) = 
# 221 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 2353 "parser.ml"
         in
        _menhir_goto_nonempty_list_funArgs_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.stringExpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | STRING _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState44 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | COMMA | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (s1 : (Ast.stringExpr))), _, (s2 : (
# 11 "parser.mly"
       (string)
# 2398 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.stringExpr) = 
# 269 "parser.mly"
                              ( ConcatString(s1,VarString(s2)) )
# 2404 "parser.ml"
             in
            _menhir_goto_stringExpr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_goto_comparison : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState260 | MenhirState225 | MenhirState230 | MenhirState196 | MenhirState186 | MenhirState177 | MenhirState99 | MenhirState119 | MenhirState121 | MenhirState124 | MenhirState150 | MenhirState154 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (c : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 215 "parser.mly"
                                        ( c )
# 2438 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | AND | OR ->
            _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run263 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 2455 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DECREMENT ->
        _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState263
    | INCREMENT ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState263
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState263

and _menhir_run222 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (
# 11 "parser.mly"
       (string)
# 2484 "parser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (Ast.increment) = 
# 207 "parser.mly"
                ( PreInc(_2) )
# 2491 "parser.ml"
         in
        _menhir_goto_increment _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run264 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (
# 11 "parser.mly"
       (string)
# 2514 "parser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (Ast.increment) = 
# 209 "parser.mly"
                 ( PreDec(_2) )
# 2521 "parser.ml"
         in
        _menhir_goto_increment _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_assignment : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.assignment) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState253 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOUBLE _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _v
        | FALSE ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _v
        | LPAR ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | MINUS ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | NOT ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | TRUE ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState260 in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AND ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | DIVIDE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | LPAR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | MINUS ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | OR ->
                _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | PLUS ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | SEMICOLON ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState261 in
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | DECREMENT ->
                    _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState262
                | INCREMENT ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState262
                | VAR _v ->
                    _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState262)
            | TCEQ ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | TCGE ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | TCGT ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | TCLE ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | TCLT ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | TCNE ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | TIMES ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState261
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState261)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState260)
    | MenhirState175 | MenhirState290 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (st : (Ast.assignment))) = _menhir_stack in
        let _v : (Ast.funStatement) = 
# 133 "parser.mly"
                 ( StatementAssign(st))
# 2619 "parser.ml"
         in
        _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run175 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | DECREMENT ->
        _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
    | DOUBLED ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | FOR ->
        _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | IF ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | INCREMENT ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
    | INTD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | PRINTF ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | PRINTLN ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | RETURN ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | STRINGD ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | VAR _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | WHILE ->
        _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | RBRACE ->
        _menhir_reduce114 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175

and _menhir_run150 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
    | FALSE ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState150
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
    | LPAR ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState150
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState150
    | NOT ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState150
    | TRUE ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState150
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState150 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | OR ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | TCEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | TCGE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | TCGT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | TCLE ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | TCLT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | TCNE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | RPAR | SEMICOLON ->
            _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150

and _menhir_run154 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
    | FALSE ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
    | LPAR ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | NOT ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | TRUE ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState154 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | OR ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | TCEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | TCGE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | TCGT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | TCLE ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | TCLT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | TCNE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | RPAR | SEMICOLON ->
            _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154

and _menhir_goto_funStatement : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.funStatement) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | DECREMENT ->
        _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
    | DOUBLED ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | FOR ->
        _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | IF ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | INCREMENT ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
    | INTD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | PRINTF ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | PRINTLN ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | RETURN ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | STRINGD ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | VAR _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | WHILE ->
        _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | RBRACE ->
        _menhir_reduce114 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState290

and _menhir_goto_global : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.global) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState301
    | DECLARE ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState301
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
    | DOUBLED ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState301
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
    | INTD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState301
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState301
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState301
    | STRINGD ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState301
    | VAR _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState301
    | EOF ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Ast.global))) = _menhir_stack in
        let _v : (Ast.top) = 
# 221 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 2885 "parser.ml"
         in
        _menhir_goto_nonempty_list_global_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState301

and _menhir_reduce59 : _menhir_env -> (('ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2896 "parser.ml"
)) * _menhir_state) * _menhir_state * (
# 11 "parser.mly"
       (string)
# 2900 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 2906 "parser.ml"
    ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 2910 "parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : (Ast.expr) = 
# 114 "parser.mly"
                                      ( Add(Var(e1), Var(e2)) )
# 2916 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | STRING _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState41 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | COMMA | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (s : (
# 11 "parser.mly"
       (string)
# 2958 "parser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.funArg) = 
# 101 "parser.mly"
              ( VarArg(s))
# 2964 "parser.ml"
             in
            _menhir_goto_funArgs _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_goto_funCall : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (Ast.expr)) = _v in
    let _v : (Ast.expr) = 
# 278 "parser.mly"
                                    ( _1 )
# 2984 "parser.ml"
     in
    _menhir_goto_v_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | RPAR ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 107 "parser.mly"
                                        ( Mul(e1,e2) )
# 3019 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | AND | COMMA | MINUS | OR | PLUS | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 108 "parser.mly"
                                        ( Divide(e1,e2) )
# 3045 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | AND | COMMA | MINUS | OR | PLUS | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 110 "parser.mly"
                                        ( Sub(e1, e2) )
# 3064 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35)
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | AND | COMMA | MINUS | OR | PLUS | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.expr) = 
# 111 "parser.mly"
                                ( Neg(_2) )
# 3087 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3100 "parser.ml"
        ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 117 "parser.mly"
                                       ( Divide(Var(e1), e2) )
# 3106 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | COMMA | MINUS | PLUS | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            _menhir_reduce63 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | COMMA | PLUS | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (s1 : (Ast.stringExpr))), _, (s2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.stringExpr) = 
# 268 "parser.mly"
                              ( ConcatSEExpr(s1,s2) )
# 3142 "parser.ml"
             in
            _menhir_goto_stringExpr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PLUS ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | COMMA | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.funArg) = 
# 100 "parser.mly"
               (Arg(e))
# 3169 "parser.ml"
             in
            _menhir_goto_funArgs _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48)
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | COMMA | MINUS | PLUS | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52)
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PLUS ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState60 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 3212 "parser.ml"
            ))), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.expr) = 
# 96 "parser.mly"
                            ( FunCall(v,[Arg(e);]) )
# 3219 "parser.ml"
             in
            _menhir_goto_funCall _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60)
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | AND | COMMA | MINUS | OR | PLUS | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3242 "parser.ml"
            ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 119 "parser.mly"
                                       ( Sub(Var(e1), e2) )
# 3248 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | AND | COMMA | MINUS | OR | PLUS | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            _menhir_reduce63 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65)
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3276 "parser.ml"
        ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 116 "parser.mly"
                                       ( Mul(Var(e1),e2) )
# 3282 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PLUS ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState74 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (v : (
# 11 "parser.mly"
       (string)
# 3304 "parser.ml"
            ))), _, (s : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.declare) = 
# 161 "parser.mly"
                                          ( DeclareVarAssignString("string", v, ConcatExprString(s, String("")) ) )
# 3312 "parser.ml"
             in
            _menhir_goto_vardeclare _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
    | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3339 "parser.ml"
            ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 223 "parser.mly"
                        ( NotEqual(Var(e1), e2) )
# 3345 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103)
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3370 "parser.ml"
            ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 227 "parser.mly"
                        (  LessThan(Var(e1), e2) )
# 3376 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106)
    | MenhirState107 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3401 "parser.ml"
            ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 224 "parser.mly"
                       ( LessThanEqual(Var(e1), e2) )
# 3407 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109)
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3432 "parser.ml"
            ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 226 "parser.mly"
                        ( GreaterThan(Var(e1), e2) )
# 3438 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112)
    | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3463 "parser.ml"
            ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 225 "parser.mly"
                        ( GreaterThanEqual(Var(e1), e2) )
# 3469 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115)
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 3494 "parser.ml"
            ))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 222 "parser.mly"
                       ( Equal(Var(e1), e2) )
# 3500 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118)
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | RPAR ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TCEQ ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TCGE ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TCGT ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TCLE ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TCLT ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TCNE ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129)
    | MenhirState130 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 217 "parser.mly"
                        ( NotEqual(e1, e2) )
# 3558 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132)
    | MenhirState133 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 221 "parser.mly"
                         (  LessThan(e1, e2) )
# 3585 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135)
    | MenhirState136 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 218 "parser.mly"
                         ( LessThanEqual(e1, e2) )
# 3612 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138)
    | MenhirState139 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 220 "parser.mly"
                         ( GreaterThan(e1, e2) )
# 3639 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141)
    | MenhirState142 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 219 "parser.mly"
                         ( GreaterThanEqual(e1, e2) )
# 3666 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144)
    | MenhirState145 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 216 "parser.mly"
                         ( Equal(e1, e2) )
# 3693 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147)
    | MenhirState260 | MenhirState225 | MenhirState230 | MenhirState177 | MenhirState99 | MenhirState119 | MenhirState121 | MenhirState124 | MenhirState154 | MenhirState150 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | TCEQ ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | TCGE ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | TCGT ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | TCLE ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | TCLT ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | TCNE ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152)
    | MenhirState169 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState172 in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce153 _menhir_env (Obj.magic _menhir_stack) _menhir_s
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172)
    | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | PLUS ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState191 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 3770 "parser.ml"
            ))), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.assignment) = 
# 169 "parser.mly"
                                  ( AssignVar(v,e) )
# 3777 "parser.ml"
             in
            _menhir_goto_assignment _menhir_env _menhir_stack _menhir_s _v
        | TCEQ ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | TCGE ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | TCGT ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | TCLE ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | TCLT ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | TCNE ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191)
    | MenhirState196 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | PLUS ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState202 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 136 "parser.mly"
                             ( Return(e) )
# 3820 "parser.ml"
             in
            _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
        | TCEQ ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | TCGE ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | TCGT ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | TCLE ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | TCLT ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | TCNE ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202)
    | MenhirState207 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | PLUS ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState212 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 75 "parser.mly"
                             ( Println(ConcatExprString(e,String(""))) )
# 3864 "parser.ml"
             in
            _menhir_goto_println _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212)
    | MenhirState215 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | PLUS ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState220 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 70 "parser.mly"
                            ( Printf(ConcatExprString(e,String(""))) )
# 3896 "parser.ml"
             in
            _menhir_goto_printf _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220)
    | MenhirState257 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState258 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (_1 : (string))), (v : (
# 11 "parser.mly"
       (string)
# 3924 "parser.ml"
            ))), _, (e : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _v : (Ast.assignment) = 
# 168 "parser.mly"
                                        ( DeclareVarAssign(_1, v, e))
# 3931 "parser.ml"
             in
            _menhir_goto_assignment _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState258)
    | MenhirState278 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState279 in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce153 _menhir_env (Obj.magic _menhir_stack) _menhir_s
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState279)
    | MenhirState175 | MenhirState290 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState293 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.funStatement) = 
# 140 "parser.mly"
                     ( Expr(e) )
# 3983 "parser.ml"
             in
            _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState293)
    | MenhirState0 | MenhirState301 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | MINUS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | PLUS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState304 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.global) = 
# 57 "parser.mly"
                   ( Global2(e) )
# 4013 "parser.ml"
             in
            _menhir_goto_global _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState304)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stringExpr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.stringExpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (s1 : (
# 11 "parser.mly"
       (string)
# 4035 "parser.ml"
        ))), _), _, (s2 : (Ast.stringExpr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.stringExpr) = 
# 270 "parser.mly"
                              ( ConcatString(VarString(s1),s2) )
# 4041 "parser.ml"
         in
        _menhir_goto_stringExpr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.stringExpr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.funArg) = 
# 102 "parser.mly"
                     ( ArgString(e) )
# 4058 "parser.ml"
             in
            _menhir_goto_funArgs _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (s1 : (Ast.stringExpr))), _, (s2 : (Ast.stringExpr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.stringExpr) = 
# 266 "parser.mly"
                                     ( ConcatString(s1,s2) )
# 4075 "parser.ml"
         in
        _menhir_goto_stringExpr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (s1 : (Ast.expr))), _), _, (s2 : (Ast.stringExpr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.stringExpr) = 
# 267 "parser.mly"
                              ( ConcatExprString(s1,s2) )
# 4086 "parser.ml"
         in
        _menhir_goto_stringExpr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 4103 "parser.ml"
            ))), _), _, (e : (Ast.stringExpr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.expr) = 
# 95 "parser.mly"
                                 ( FunCall(v,[ArgString(e);]) )
# 4110 "parser.ml"
             in
            _menhir_goto_funCall _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (v : (
# 11 "parser.mly"
       (string)
# 4133 "parser.ml"
            ))), _, (s : (Ast.stringExpr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.declare) = 
# 159 "parser.mly"
                                                ( DeclareVarAssignString("string", v, s) )
# 4141 "parser.ml"
             in
            _menhir_goto_vardeclare _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 4164 "parser.ml"
            ))), _), _, (s : (Ast.stringExpr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.assignment) = 
# 171 "parser.mly"
                                           ( AssignVarString(v,s))
# 4171 "parser.ml"
             in
            _menhir_goto_assignment _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState196 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (s : (Ast.stringExpr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 138 "parser.mly"
                                   (ReturnString(s) )
# 4197 "parser.ml"
             in
            _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState207 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (s : (Ast.stringExpr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 73 "parser.mly"
                                   ( Println(s) )
# 4224 "parser.ml"
             in
            _menhir_goto_println _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState215 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (s : (Ast.stringExpr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 68 "parser.mly"
                                  ( Printf(s) )
# 4251 "parser.ml"
             in
            _menhir_goto_printf _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run168 : _menhir_env -> ('ttv_tail * _menhir_state * (string)) * (
# 11 "parser.mly"
       (string)
# 4266 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let ((_menhir_stack, _menhir_s, (_1 : (string))), (v : (
# 11 "parser.mly"
       (string)
# 4274 "parser.ml"
    ))) = _menhir_stack in
    let _3 = () in
    let _v : (Ast.declare) = 
# 157 "parser.mly"
                          ( DeclareVar(_1,v) )
# 4280 "parser.ml"
     in
    _menhir_goto_vardeclare _menhir_env _menhir_stack _menhir_s _v

and _menhir_run170 : _menhir_env -> (('ttv_tail * _menhir_state * (string)) * (
# 11 "parser.mly"
       (string)
# 4287 "parser.ml"
)) * _menhir_state -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 4291 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIVIDE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | LPAR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | PLUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | SEMICOLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState170 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s, (_1 : (string))), (v : (
# 11 "parser.mly"
       (string)
# 4314 "parser.ml"
        ))), _), _, (e : (
# 11 "parser.mly"
       (string)
# 4318 "parser.ml"
        ))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _v : (Ast.declare) = 
# 164 "parser.mly"
                                      ( DeclareVarAssign(_1, v, Var(e)) )
# 4325 "parser.ml"
         in
        _menhir_goto_vardeclare _menhir_env _menhir_stack _menhir_s _v
    | TIMES ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170

and _menhir_goto_nonempty_list_listOfArg_ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((string * string) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (x : (string))), (y : (
# 11 "parser.mly"
       (string)
# 4351 "parser.ml"
            ))), _, (p2 : ((string * string) list))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.argList) = let p1 = 
# 167 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( (x, y) )
# 4358 "parser.ml"
             in
            
# 83 "parser.mly"
                                             ((List.append [p1;] p2) )
# 4363 "parser.ml"
             in
            _menhir_goto_argsList _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (string * string))), _, (xs : ((string * string) list))) = _menhir_stack in
        let _v : ((string * string) list) = 
# 223 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( x :: xs )
# 4379 "parser.ml"
         in
        _menhir_goto_nonempty_list_listOfArg_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_argsList : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.argList) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (t : (string))), (v : (
# 11 "parser.mly"
       (string)
# 4401 "parser.ml"
            ))), _, (args : (Ast.argList))) = _menhir_stack in
            let _5 = () in
            let _1 = () in
            let _v : (Ast.global) = 
# 58 "parser.mly"
                                                ( DeclareFunc(t,v,args) )
# 4408 "parser.ml"
             in
            _menhir_goto_global _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState167 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174)
    | _ ->
        _menhir_fail ()

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLD ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | DOUBLED ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | INTD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | STRINGD ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLD ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | DOUBLED ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | INTD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | RPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState83 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.argList) = 
# 81 "parser.mly"
            ( [] )
# 4475 "parser.ml"
         in
        _menhir_goto_argsList _menhir_env _menhir_stack _menhir_s _v
    | STRINGD ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce50 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 105 "parser.mly"
                                ( _1 )
# 4498 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce34 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4505 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 11 "parser.mly"
       (string)
# 4511 "parser.ml"
    ))) = _menhir_stack in
    let _v : (Ast.expr) = 
# 244 "parser.mly"
      ( Var(_1) )
# 4516 "parser.ml"
     in
    _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v

and _menhir_run101 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4523 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState101 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState102
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState102
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState102
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState102
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState102
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 4560 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 4564 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 229 "parser.mly"
                      ( NotEqual(Var(e1), Var(e2)) )
# 4570 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101

and _menhir_run104 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4585 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState104 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 4622 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 4626 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 233 "parser.mly"
                       (  LessThan(Var(e1), Var(e2)) )
# 4632 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104

and _menhir_run107 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4647 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState107 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 4684 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 4688 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 230 "parser.mly"
                       ( LessThanEqual(Var(e1), Var(e2)) )
# 4694 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107

and _menhir_run110 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4709 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState110 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 4746 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 4750 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 232 "parser.mly"
                       ( GreaterThan(Var(e1), Var(e2)) )
# 4756 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110

and _menhir_run113 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4771 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState113 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 4808 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 4812 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 231 "parser.mly"
                       ( GreaterThanEqual(Var(e1), Var(e2)) )
# 4818 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113

and _menhir_run116 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4833 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState116 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | AND | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 4870 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 4874 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 228 "parser.mly"
                       ( Equal(Var(e1), Var(e2)) )
# 4880 "parser.ml"
             in
            _menhir_goto_comparison _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116

and _menhir_run119 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4895 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | FALSE ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | LPAR ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | NOT ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | TRUE ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState119 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | OR ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | TCEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | TCGE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | TCGT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | TCLE ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | TCLT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | TCNE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | RPAR | SEMICOLON ->
            _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119

and _menhir_run121 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 4963 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
    | FALSE ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
    | LPAR ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | NOT ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | TRUE ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState121 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | OR ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | TCEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | TCGE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | TCGT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | TCLE ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | TCLT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | TCNE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | RPAR | SEMICOLON ->
            _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121

and _menhir_goto_condition : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (c : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 252 "parser.mly"
                                       ( c )
# 5051 "parser.ml"
             in
            _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState150 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (c1 : (Ast.expr))), _, (c2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 250 "parser.mly"
                                  ( Or(c1,c2) )
# 5074 "parser.ml"
             in
            _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState154 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (c1 : (Ast.expr))), _, (c2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 249 "parser.mly"
                                  ( And(c1,c2) )
# 5091 "parser.ml"
         in
        _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v
    | MenhirState124 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.expr) = 
# 251 "parser.mly"
                ( Not(_2) )
# 5110 "parser.ml"
             in
            _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState121 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (c1 : (
# 11 "parser.mly"
       (string)
# 5125 "parser.ml"
        ))), _), _, (c2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 253 "parser.mly"
                            ( And(Var(c1),c2) )
# 5131 "parser.ml"
         in
        _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v
    | MenhirState119 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR | RPAR | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (c1 : (
# 11 "parser.mly"
       (string)
# 5146 "parser.ml"
            ))), _), _, (c2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 254 "parser.mly"
                           ( Or(Var(c1),c2) )
# 5152 "parser.ml"
             in
            _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (v : (
# 11 "parser.mly"
       (string)
# 5177 "parser.ml"
            ))), _, (c : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.declare) = 
# 158 "parser.mly"
                                              ( DeclareVarAssignBool("bool", v, c))
# 5185 "parser.ml"
             in
            _menhir_goto_vardeclare _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState177 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState182
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState182)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 5236 "parser.ml"
            ))), _), _, (c : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.assignment) = 
# 170 "parser.mly"
                                       ( AssignVarBool(v,c) )
# 5243 "parser.ml"
             in
            _menhir_goto_assignment _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState196 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (c : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.funStatement) = 
# 135 "parser.mly"
                                  ( ReturnBool(c) )
# 5271 "parser.ml"
             in
            _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState230 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState235)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState225 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState245
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState245)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState260 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DECREMENT ->
                _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState270
            | INCREMENT ->
                _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState270
            | VAR _v ->
                _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState270 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState270)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run5 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 5368 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState5 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | AND | COMMA | OR | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            _menhir_reduce59 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run3 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 5414 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState3 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | AND | COMMA | OR | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 5451 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 5455 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 112 "parser.mly"
                                      ( Mul(Var(e1),Var(e2)) )
# 5461 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_goto_vardeclare : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.declare) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState301 | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (v : (Ast.declare)) = _v in
        let _v : (Ast.global) = 
# 56 "parser.mly"
                ( Global(v) )
# 5483 "parser.ml"
         in
        _menhir_goto_global _menhir_env _menhir_stack _menhir_s _v
    | MenhirState290 | MenhirState175 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (st : (Ast.declare)) = _v in
        let _v : (Ast.funStatement) = 
# 132 "parser.mly"
                 ( StatementDeclare(st))
# 5493 "parser.ml"
         in
        _menhir_goto_funStatement _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run12 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 5502 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | STRING _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState12 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | COMMA | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            _menhir_reduce59 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_run7 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 5550 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState7 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | AND | COMMA | OR | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 5587 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 5591 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 115 "parser.mly"
                                      ( Sub(Var(e1), Var(e2)) )
# 5597 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run9 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 5612 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | RPAR ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState9 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 5635 "parser.ml"
        ))), _) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _v : (Ast.expr) = 
# 97 "parser.mly"
                    ( FunCall(v,[]) )
# 5642 "parser.ml"
         in
        _menhir_goto_funCall _menhir_env _menhir_stack _menhir_s _v
    | STRING _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState9 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | RPAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState10 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (v : (
# 11 "parser.mly"
       (string)
# 5672 "parser.ml"
            ))), _), _, (e : (
# 11 "parser.mly"
       (string)
# 5676 "parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.expr) = 
# 94 "parser.mly"
                          ( FunCall(v,[VarArg(e);]) )
# 5683 "parser.ml"
             in
            _menhir_goto_funCall _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_run14 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 11 "parser.mly"
       (string)
# 5700 "parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState14 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | AND | COMMA | OR | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (
# 11 "parser.mly"
       (string)
# 5737 "parser.ml"
            ))), _), _, (e2 : (
# 11 "parser.mly"
       (string)
# 5741 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 113 "parser.mly"
                                     ( Divide(Var(e1),Var(e2)) )
# 5747 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 5762 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (s : (
# 8 "parser.mly"
       (string)
# 5770 "parser.ml"
    )) = _v in
    let _v : (Ast.stringExpr) = 
# 265 "parser.mly"
              ( String(String.sub s 1 ((String.length s )- 2)) )
# 5775 "parser.ml"
     in
    _menhir_goto_stringExpr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_typeP : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LPAR ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState86 in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _menhir_s), _, (x : (string))), (y : (
# 11 "parser.mly"
       (string)
# 5827 "parser.ml"
                ))) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _v : (Ast.argList) = let p1 = 
# 167 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( (x, y) )
# 5834 "parser.ml"
                 in
                
# 82 "parser.mly"
                                  ( [p1;] )
# 5839 "parser.ml"
                 in
                _menhir_goto_argsList _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_3 : (
# 11 "parser.mly"
       (string)
# 5864 "parser.ml"
            )) = _v in
            let ((_menhir_stack, _menhir_s), _, (_2 : (string))) = _menhir_stack in
            let _1 = () in
            let _v : (string * string) = 
# 88 "parser.mly"
                ((_2,_3))
# 5871 "parser.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | RPAR ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, (x : (string * string))) = _menhir_stack in
                let _v : ((string * string) list) = 
# 221 "/home/michael/.opam/default/lib/menhir/standard.mly"
    ( [ x ] )
# 5886 "parser.ml"
                 in
                _menhir_goto_nonempty_list_listOfArg_ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState301 | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQUAL ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState167 in
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | DOUBLE _v ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
                | INT _v ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
                | LPAR ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState169
                | MINUS ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState169
                | VAR _v ->
                    _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169)
            | LPAR ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | SEMICOLON ->
                _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState253 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQUAL ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | DOUBLE _v ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
                | INT _v ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
                | LPAR ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState257
                | MINUS ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState257
                | VAR _v ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState290 | MenhirState175 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQUAL ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState277 in
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | DOUBLE _v ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
                | INT _v ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
                | LPAR ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState278
                | MINUS ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState278
                | VAR _v ->
                    _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState278)
            | SEMICOLON ->
                _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState277
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState277)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_v_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState301 | MenhirState290 | MenhirState278 | MenhirState175 | MenhirState257 | MenhirState215 | MenhirState207 | MenhirState169 | MenhirState0 | MenhirState145 | MenhirState142 | MenhirState139 | MenhirState136 | MenhirState133 | MenhirState130 | MenhirState116 | MenhirState113 | MenhirState110 | MenhirState107 | MenhirState104 | MenhirState101 | MenhirState69 | MenhirState3 | MenhirState5 | MenhirState7 | MenhirState9 | MenhirState49 | MenhirState44 | MenhirState41 | MenhirState12 | MenhirState14 | MenhirState16 | MenhirState33 | MenhirState30 | MenhirState27 | MenhirState23 | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState260 | MenhirState225 | MenhirState230 | MenhirState196 | MenhirState186 | MenhirState177 | MenhirState99 | MenhirState119 | MenhirState121 | MenhirState124 | MenhirState154 | MenhirState150 | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE | MINUS | PLUS | RPAR | SEMICOLON | TCEQ | TCGE | TCGT | TCLE | TCLT | TCNE | TIMES ->
            _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack)
        | AND | OR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 247 "parser.mly"
         ( _1)
# 6054 "parser.ml"
             in
            _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (string) = 
# 152 "parser.mly"
          ("string")
# 6074 "parser.ml"
     in
    _menhir_goto_typeP _menhir_env _menhir_stack _menhir_s _v

and _menhir_run80 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (string) = 
# 149 "parser.mly"
        ( "bool" )
# 6086 "parser.ml"
     in
    _menhir_goto_typeP _menhir_env _menhir_stack _menhir_s _v

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 6093 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AND ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | DIVIDE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | LPAR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | OR ->
        _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | PLUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TCEQ ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TCGE ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TCGT ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TCLE ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TCLT ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TCNE ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TIMES ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | RPAR | SEMICOLON ->
        _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100

and _menhir_run123 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 245 "parser.mly"
       ( Boolean(true) )
# 6141 "parser.ml"
     in
    _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v

and _menhir_run124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _v
    | FALSE ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState124
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _v
    | LPAR ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState124
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState124
    | NOT ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState124
    | TRUE ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState124
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState124 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | DIVIDE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | LPAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | MINUS ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | OR ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | PLUS ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | TCEQ ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | TCGE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | TCGT ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | TCLE ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | TCLT ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | TCNE ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | RPAR | SEMICOLON ->
            _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124

and _menhir_run126 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | FALSE ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | LPAR ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | NOT ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TRUE ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | VAR _v ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 246 "parser.mly"
        ( Boolean(false) )
# 6244 "parser.ml"
     in
    _menhir_goto_condition _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState304 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState301 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState293 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState290 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState279 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState278 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState277 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState272 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState270 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState267 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState263 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState262 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState261 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState260 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState258 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState257 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState254 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState253 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState250 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState247 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState246 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState245 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState242 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState240 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState237 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState235 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState232 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState231 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState230 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState228 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState227 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState226 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState225 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState220 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState216 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState215 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState212 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState208 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState207 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState202 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState197 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState196 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState191 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState187 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState184 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState182 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState179 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState178 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState177 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState175 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState174 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState172 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState170 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState169 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState167 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState155 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState154 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState152 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState151 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState150 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState147 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState146 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState145 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState144 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState143 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState142 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState141 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState140 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState139 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState137 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState136 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState135 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState134 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState133 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState132 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState130 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState129 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState125 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState124 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState122 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState121 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState120 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState119 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState117 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState115 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState112 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState109 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState108 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState107 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState105 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (string) = 
# 153 "parser.mly"
       ( "void" )
# 6891 "parser.ml"
     in
    _menhir_goto_typeP _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 6898 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIVIDE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | LPAR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | MINUS ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | PLUS ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | TIMES ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DOUBLE _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | INT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | LPAR ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | MINUS ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | STRING _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | VAR _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState69 in
                let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | DIVIDE ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | LPAR ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | MINUS ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | PLUS ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | SEMICOLON ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_s = MenhirState70 in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), (v : (
# 11 "parser.mly"
       (string)
# 6970 "parser.ml"
                    ))), _, (s : (
# 11 "parser.mly"
       (string)
# 6974 "parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (Ast.declare) = 
# 160 "parser.mly"
                                         ( DeclareVarAssignString("string", v, VarString(s)) )
# 6982 "parser.ml"
                     in
                    _menhir_goto_vardeclare _menhir_env _menhir_stack _menhir_s _v
                | TIMES ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState70
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | VAR _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | VAR _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run76 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (string) = 
# 150 "parser.mly"
        ( "int" )
# 7058 "parser.ml"
     in
    _menhir_goto_typeP _menhir_env _menhir_stack _menhir_s _v

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "parser.mly"
       (int)
# 7065 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 5 "parser.mly"
       (int)
# 7073 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 279 "parser.mly"
                                    ( Int(_1))
# 7078 "parser.ml"
     in
    _menhir_goto_v_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run77 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (string) = 
# 151 "parser.mly"
          ( "double" )
# 7090 "parser.ml"
     in
    _menhir_goto_typeP _menhir_env _menhir_stack _menhir_s _v

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "parser.mly"
       (float)
# 7097 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 7 "parser.mly"
       (float)
# 7105 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 280 "parser.mly"
                                    (Double(_1))
# 7110 "parser.ml"
     in
    _menhir_goto_v_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run78 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLD ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | DOUBLED ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | INTD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | STRINGD ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DOUBLE _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
            | FALSE ->
                _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | INT _v ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
            | LPAR ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | MINUS ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | NOT ->
                _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | TRUE ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | VAR _v ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 42 "parser.mly"
      (Ast.top)
# 7200 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DECLARE ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DOUBLE _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | DOUBLED ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | INTD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAR ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | MINUS ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRINGD ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | VOID ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "/home/michael/.opam/default/lib/menhir/standard.mly"
  

# 7244 "parser.ml"

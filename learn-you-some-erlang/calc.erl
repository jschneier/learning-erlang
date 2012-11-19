-module(calc).
-compile(export_all).

rpn(L) when is_list(L) ->
    [Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " ")),
    Res.

rpn("sum", Stack) -> [lists:sum(Stack)];
rpn("prod", Stack) -> [lists:foldl(fun erlang:'*'/2, 1, Stack)];
rpn("log10", [X|Xs]) -> [math:log10(X)|Xs];
rpn("ln", [X|Xs]) -> [math:log(X)|Xs];
rpn("^", [X|Xs]) -> [math:pow(X)|Xs];
rpn("/", [X1,X2|Xs]) -> [X2/X1|Xs];
rpn("*", [X1,X2|Xs]) -> [X2*X1|Xs];
rpn("-", [X1,X2|Xs]) -> [X2-X1|Xs];
rpn("+", [X1,X2|Xs]) -> [X2+X1|Xs];
rpn(X, Stack) -> [read(X)|Stack].

read(N) ->
    case string:to_float(N) of
        {error, no_float} -> list_to_integer(N);
        {F, _} -> F
    end.

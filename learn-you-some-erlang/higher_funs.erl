-module(hfuns).
-compile(export_all).

map(_, []) -> [];
map(F, [H|T]) ->
    [F(H)|map(F,T)].

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).
filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
    case Pred(H) of
        true -> filter(Pred, T, [H|Acc]);
        false -> filter(Pred, T, Acc)
    end.

fold(F, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).

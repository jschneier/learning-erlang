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

max([H|T]) -> max([H|T], 0).
max([], Max) -> Max;
max([H|T], Max) when H > Max -> max(T, H);
max([_|T], Max) -> max(T, Max).

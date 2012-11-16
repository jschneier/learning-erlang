-module(test).
-export([zip/2, t_zip/2, t_diff_zip/2, quicksort/1]).

zip([], []) -> [];
zip([X|Xs], [Y|Ys]) ->
    [{X,Y} | zip(Xs, Ys)].

t_zip([X|Xs], [Y|Ys]) -> t_zip([X|Xs], [Y|Ys], []).
t_zip([], [], Acc) -> lists:reverse(Acc);
t_zip([X|Xs], [Y|Ys], Acc) -> 
    t_zip(Xs, Ys, [{X,Y}|Acc]).

t_diff_zip([X|Xs], [Y|Ys]) -> t_diff_zip([X|Xs], [Y|Ys], []).
t_diff_zip([], _, Acc) -> lists:reverse(Acc);
t_diff_zip(_, [], Acc) -> lists:reverse(Acc);
t_diff_zip([X|Xs], [Y|Ys], Acc) ->
    t_diff_zip(Xs, Ys, [{X,Y}|Acc]).

length([H|T]) -> length([H|T], 0).
length([], Acc) -> Acc;
length([_|T], Acc) -> length(T, Acc+1).

fac(N) -> fac(N, 1).
fac(1, Acc) -> Acc;
fac(N, Acc) -> fac(N-1, Acc*N).

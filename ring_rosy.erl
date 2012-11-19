-module(ring_rosy).
-export([start/1, timer/0, zeroth/1, ring/2, other/1]).

%% ring of Erlang processes, dies after one pass

start(N) ->
    Zeroth = spawn(ring_rosy, zeroth, [spawn(ring_rosy, timer, [])]),
    First = ring(N-1, Zeroth),
    First ! nothing.

zeroth(Timer) ->
    receive
        _ ->
            Timer ! done
    end.

other(Pid) ->
    receive
        Msg ->
            Pid ! Msg,
            io:format("Inside of process~n")
    end.

timer() ->
    statistics(runtime),
    receive
        done ->
            {_, RunTime} = statistics(runtime),
            io:format("Runtime of ~p.~n", [RunTime])
        end.

ring(0, Pid) -> Pid;
ring(N, Pid) ->
    io:format("creating process ~b.~n", [N]),
    ring(N-1, spawn(ring_rosy, other, [Pid])).

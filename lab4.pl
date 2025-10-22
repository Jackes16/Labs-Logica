edge(entrance, a).
edge(a, b).
edge(a, c).
edge(b, exit).
edge(c, b).

blocked(a, c).

can_move(X, Y) :-
    edge(X, Y),
    \+ blocked(X, Y).

reason(X, Y, 'path is open') :- can_move(X, Y).
reason(X, Y, 'path is blocked') :- blocked(X, Y).
reason(_, Y, 'destination reached') :- Y == exit.

move(X, Y, Visited, [Y|Visited]) :-
    can_move(X, Y),
    format('Moving from ~w to ~w.~n', [X, Y]),
    reason(X, Y, R),
    format('Reason: ~w.~n', [R]).

move(X, Y, Visited, Path) :-
    can_move(X, Z),
    \+ member(Z, Visited),
    format('Exploring from ~w to ~w...~n', [X, Z]),
    reason(X, Z, R),
    format('Reason: ~w.~n', [R]),
    move(Z, Y, [Z|Visited], Path).

find_path(X, Y, Path) :-
    move(X, Y, [X], RevPath),
    reverse(RevPath, Path),
    format('~nFinal path found: ~w~n', [Path]).

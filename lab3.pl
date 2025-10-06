edge(a,b).
edge(b,c).
edge(a,d).
edge(d,c).

edge(room1,room2).
edge(room2,room3).
edge(room2,room4).
edge(room4,room5).
edge(room3,room5).
edge(room5,exit).

path(X,Y) :- path(X,Y,[]).
path(X,Y,_) :- edge(X,Y).
path(X,Y,Visited) :-
    edge(X,Z),
    \+ member(Z,Visited),
    path(Z,Y,[X|Visited]).

path_nodes(X,Y,Path) :- path_nodes(X,Y,[X],Path).
path_nodes(Current,Goal,Acc,Path) :-
    edge(Current,Goal),
    append(Acc,[Goal],Path).
path_nodes(Current,Goal,Acc,Path) :-
    edge(Current,Next),
    \+ member(Next,Acc),
    append(Acc,[Next],Acc2),
    path_nodes(Next,Goal,Acc2,Path).

all_paths(A,B,Paths) :- findall(P, path_nodes(A,B,P), Paths).

maze_path(Entry,Exit,Path) :- path_nodes(Entry,Exit,Path).

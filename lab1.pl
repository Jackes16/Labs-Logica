% 1. FAMILY TREE KNOWLEDGE BASE

parent(john, michael).
parent(john, sarah).
parent(michael, robert).
parent(michael, linda).
parent(sarah, james).
parent(sarah, patricia).
parent(emily, john).
parent(emily, anna).
parent(david, robert).
parent(david, linda).

grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

sibling(X, Y) :- parent(X, P), parent(Y, P), X \= Y.

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% 2. FOOD PREFERENCES

likes(alicia, pizza).
likes(bobby, pizza).
likes(carla, sushi).
likes(daniel, sushi).
likes(emily, pasta).
likes(frank, pasta).
likes(george, burger).
likes(hannah, burger).
likes(ivan, salad).
likes(julia, salad).

food_friend(X, Y) :- likes(X, Food), likes(Y, Food), X \= Y.

% 3. MATH UTILITY

factorial(0, 1).
factorial(N, Result) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, R1),
    Result is N * R1.

sum_list([], 0).
sum_list([H|T], Sum) :-
    sum_list(T, Rest),
    Sum is H + Rest.

% 4. LIST PROCESSING

length_list([], 0).
length_list([_|T], Length) :-
    length_list(T, Rest),
    Length is Rest + 1.

append_list([], L, L).
append_list([H|T], L2, [H|Result]) :-
    append_list(T, L2, Result).


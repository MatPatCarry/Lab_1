getByIndex([X], 1, X).
getByIndex([H|_], 1, H).
getByIndex([_|T], I, E) :- NewIndex is I-1, getByIndex(T, NewIndex, E).

:- consult('get_deser_obiad.pl').
:- consult('get_slone.pl').


:- module('examples/pl_rm/numbers', []).

:- use_module(library(project)).
:- use_module(library('pl_rm/numbers')).

add_example([O1, O2, O3]) :-
    make_integer(O1, 3),
    make_integer(O2, 5),
    call_slot(add(O1, O2, O3)),
    call_slot(data(O3, 8)).

add_many_example(I) :-
    add_example(Os),
    add_ints(Os, I).

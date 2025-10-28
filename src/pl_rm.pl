:- module(pl_rm, [hello/0]).

:- use_module(library(project)).

hello :- print("Hello").

make_resource(O, Label, Data) :-
    call_slot(make_obj(root, [
                           (label(Self, Label), true),
                           (label(Self, Data), true)                           
                       ],
                      O))

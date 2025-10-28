:- module('pl_rm/numbers', [make_integer/2, add_ints/2]).

:- use_module(library(project), [call_slot/1, slot/3]).

:- call_slot(make_obj(root, [
                          (name(Self, integer), true),
                          (inherits(Self, root), true)
                      ],
                      _)).
    
make_integer(O, Data) :-
    is_of_type(integer, Data),
    call_slot(name(Integer, integer)),
    call_slot(make_obj(Integer, [
                           (data(Self, Data), true),
                           (holds_on_use(Self), true),
                           (holds_on_intro(Self), true),
                           (always_true(Self), (
                                call_slot(data(Self, DataField)),
                                is_of_type(integer, DataField)
                            )),
                           (add(Self, ToAdd, NewInt), (
                                call_slot(data(Self, DataField1)),
                                call_slot(data(ToAdd, DataField2)),
                                NewData is DataField1 + DataField2,
                                make_integer(NewInt, NewData)))
                       ],
                       O)).

add_ints([I], I).
add_ints([I1, I2|Is], I) :-
    call_slot(add(I1, I2, INew)),
    add_ints([INew|Is], I).
    

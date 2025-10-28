:- module('pl_rm/env', []).

:- use_module(library(project), [call_slot/1, slot/3]).

make_env(O, Consumed, Created, CompOperation, TransactionData) :-
    call_slot(make_obj(root, [
                           (consumed(Self, Consumed), true),
                           (created(Self, Created), true),
                           (operation(Self, CompOperation), true),
                           (transaction_data(Self, TransactionData))
                       ],
                       O)).

make_env(O) :- make_env(O, [], [], _{}).

:- make_env(O), assertz(environment(O)).


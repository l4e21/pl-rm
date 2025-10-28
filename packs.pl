:- use_module(library(prolog_pack)).
:- attach_packs(packs, []).

:- initialization(install, main).

pack(project, [url("https://github.com/l4e21/PROJECT.git"),
               git(true),
               interactive(false),
               rebuild(true)]).

:- pack_install_local(pack, packs, []).

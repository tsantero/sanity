-module(sanity).

-ifdef(TEST).
-ifdef(EQC).

-include_lib("eqc/include/eqc.hrl").
-include_lib("eunit/include/eunit.hrl").

-export([prop_reverse/0,
         prop_fail/0]).

%% ====================================================================
%% EQC property
%% ====================================================================

%% this should always pass
prop_reverse() ->
    ?FORALL(Ls, eqc_gen:list(eqc_gen:int()), Ls =:= lists:reverse(lists:reverse(Ls))).

%% this should always fail
prop_fail() ->
    ?FORALL(Ls, eqc_gen:list(eqc_gen:int()), Ls /= lists:reverse(lists:reverse(Ls))).

-endif.
-endif.

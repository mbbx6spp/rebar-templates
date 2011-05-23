%%%'   HEADER
%% @author    {{author_name}} <{{author_email}}>
%% @copyright {{copyright_year}} {{author_name}}
%% @doc       EUnit test suite module {{name}}.
%% @end

-module({{name}}_tests).
-author('{{author_name}} <{{author_email}}>').

-define(NOTEST, true).
-define(NOASSERT, true).
-include_lib("eunit/include/eunit.hrl").

-define(MODNAME, {{name}}).
%%%.
%%%' TEST GENERATOR
%% @spec {{name}}_test_() -> List
%% where
%%       List = [term()]
{{name}}_test_() ->
  %% add your asserts in the returned list, e.g.:
  %% [
  %%   ?assert(?MODNAME:double(2) =:= 4),
  %%   ?assertMatch({ok, Pid}, ?MODNAME:spawn_link()),
  %%   ?assertEqual("ba", ?MODNAME:reverse("ab")),
  %%   ?assertError(badarith, ?MODNAME:divide(X, 0)),
  %%   ?assertExit(normal, ?MODNAME:exit(normal)),
  %%   ?assertThrow({not_found, _}, ?MODNAME:func(unknown_object))
  %% ]
  [].
%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:


%-*- mode: erlang -*-
%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc {{description}}
%%% @end
-module({{name}}_sup).

-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).

-define(SERVER, ?MODULE).
%%%.
%%%'   PUBLIC API
start_link() ->
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%.
%%%'   CALLBACKS
init([]) ->
  {ok, { {one_for_one, 5, 10}, []} }.

%%%.
% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

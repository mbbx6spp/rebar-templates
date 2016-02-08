%-*- mode: erlang -*-
%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc {{description}}
%%% @end

-module({{name}}_app).
-behaviour(application).

-export([start/2, stop/1]).
%%%.
%%%'   CALLBACKS
start(_StartType, _StartArgs) ->
  Dispatch = cowboy_router:compile(dispatch()),
  Port = application:get_env(port, 9292),
  {ok, _} = cowboy:start_http(http, 100, [{port, Port}], [
    {env, [{dispatch, Dispatch}]}
  ]),
  {{name}}_sup:start_link().

stop(_State) ->
  ok.
%%%.
%%%'   PRIVATE FUNCTIONS
dispatch() ->
  [{'_',
    [
      % { "/path", some_handler, []}
    ]
  }].

%%%.
% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

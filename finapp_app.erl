%-*- mode: erlang -*-
%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}> 
%%% @since {{date}}
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc {{description}}
%%% @end

-module({{name}}_app).
-behaviour(application).

-export([start/2, stop/1]).
%%%.
%%%'   CALLBACKS
start(_StartType, _StartArgs) ->
  {{name}}_sup:start_link().

stop(_State) ->
  ok.
%%%.
%%%'   PRIVATE FUNCTIONS

%%%.
% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

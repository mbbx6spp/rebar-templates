#!/usr/bin/env escript
%% -*- mode: erlang -*-
%%%'   HEADER
%% @author    {{author_name}} <{{author_email}}>
%% @copyright {{copyright_year}} {{author_name}}
%% @doc       {{description}}
%% @end
-export([main/1]).
-define(CMD, filename:basename(escript:script_name())).
%%%.
%%%'   PUBLIC API
%% @spec main(Args) -> void()
%% where
%%       Args = [string()]
main(_)->
  usage().

%%%.
%%%'   PRIVATE FUNCTIONS
%% @private
usage() ->
  io:format("Usage: ~s ...~n", [?CMD]),
  halt(1).

%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

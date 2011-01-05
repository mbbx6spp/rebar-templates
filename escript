#!/usr/bin/env escript
%% -*- mode: erlang -*-
-export([main/1]).

-define(CMD, filename:basename(escript:script_name())).

%% External API

main([])->
  usage().

usage() ->
  io:format("Usage: ~s ...~n", [?CMD]),
  halt(1).

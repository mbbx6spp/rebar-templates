%%%----------------------------------------------------------------------
%%% File    : {{name}}.erl
%%% Author  : {{author_name}}
%%% Purpose : gen_event that ....
%%%----------------------------------------------------------------------
-module({{name}}).
-author({{author_name}}).

-behaviour(gen_event).

-export([init/1, handle_event/2, terminate/2]).

% initializes gen_event
init(Args) ->
  {ok, Args}.

% handle/log error event
handle_event(Message, State) ->
  {ok, State}.

% terminates gen_event
terminate(_Args, _State) ->
  ok.

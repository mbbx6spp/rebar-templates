%%%----------------------------------------------------------------------
%%% File    : {{name}}.erl
%%% Author  : {{author_name}}
%%% Purpose : gen_server that ....
%%%----------------------------------------------------------------------
-module({{name}}).
-author({{author_name}}).

-behaviour(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2]).
-export([code_change/3]).
-export([stop/0, terminate/2]).

% start_link
start_link() ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

% init
init(State) ->
  {ok, State}.

% handle_call
handle_call(Req, From, State) ->
  {reply, State}.

% handle_cast
handle_cast(stop, State) ->
  {stop, normal, State};
handle_cast(Req, State) ->
  {noreply, State}.

% handle_info
handle_info(Info, State) -> 
  {noreply, State}.

% code_change
code_change(OldVsn, State, Extra) ->
  {ok, State}.

% stop
stop() ->
  gen_server:cast(?MODULE, stop).

% terminate
terminate(normal, State) ->
  ok;
terminate(shutdown, State) ->
  ok;
terminate({shutdown, Reason}, State) ->
  ok;
terminate(Reason, State) ->
  ok.

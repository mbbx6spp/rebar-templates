%%%'   HEADER
%%% @author {{author_name}} <{{author_name}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc gen_server-based Zotonic module:
%%% {{description}}
%%% @end

-module(mod_{{module_name}}).
-author('{{author_name}} <{{author_email}}>').
-behaviour(gen_server).

-mod_title("{{module_title}}").
-mod_description("{{description}}").
-mod_prio({{module_priority}}).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-export([start_link/1]).

-include_lib("zotonic.hrl").
-record(state, {context}).

%%%.
%%%'   PUBLIC API

%% @doc starts gen_server implementation and caller links to the process too.
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% where
%%       Pid = pid(),
%%       Error = {already_started, Pid} | term()
start_link(Args) when is_list(Args) ->
  gen_server:start_link(?MODULE, Args, []).

%% @doc stops gen_server implementation process
%% @spec stop() -> ok
stop() ->
  gen_server:cast(?MODULE, stop).

% TODO: define public API here.
%%%.
%%%'   CALLBACKS
%% @private
init(Args) ->
  process_flag(trap_exit, true),
  {context, Context} = proplists:lookup(context, Args),
  {ok, #state{context=z_context:new(Context)}}.

%% @private
handle_call(Req, _From, State) ->
  %{reply, State}.
  {stop, {unknown_call, Req}, State}.

%% @private
handle_cast(stop, State) ->
  {stop, normal, State};
handle_cast(Req, State) ->
  %{noreply, State}.
  {stop, {unknown_call, Req}, State}.

%% @private
handle_info(_Info, State) -> 
  {noreply, State}.

%% @private
code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

%% @private
terminate(normal, _State) ->
  ok;
terminate(shutdown, _State) ->
  ok;
terminate({shutdown, _Reason}, _State) ->
  ok;
terminate(Reason, _State) ->
  ok.

%%%.
%%%'   PRIVATE FUNCTIONS
% TODO: Add private helper functions here.

%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

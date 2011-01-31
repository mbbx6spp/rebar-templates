%%%'   HEADER
%%% @author {{author_name}} <{{author_name}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc gen_event that {{description}}
%%% @end
-module({{name}}).
-author('{{author_name}} <{{author_email}}>').

-behaviour(gen_event).

-export([init/1, handle_event/2, terminate/2]).

-ifdef(TEST).
-compile(export_all).
-endif.
%%%.
%%%'   CALLBACKS
%% @private
%% @spec init(Args0) -> {ok, Args1}
%% where
%%       Args0 = Args1 = [term()]
%% @doc initializes gen_event
init(Args) ->
  {ok, Args}.

%% @private
%% @spec handle_event(Event, State0) -> {ok, State1} | {ok, State1, hibernate} |
%%         {swap_handler, Args1, State1, Handler2, Args2} | remove_handler
%% where
%%       Event = term()
%%       State0 = State1 = term()
%%       Args1 = Args2 = term()
%%       Handler2 = Module2 | {Module2, Id}
%%       Module2 = atom()
%%       Id = term()
%% @doc handle/log event
handle_event(_Message, State) ->
  {ok, State}.

%% @spec terminate(Args, State0) -> ok
%% where
%%       State0 = term()
%%       Args = term() | {stop, Reason} | stop | remove_handler |
%%         {error, {'EXIT', Reason}} | {error, Term}
%%       Reason = Term = term()
%% terminates gen_event
terminate(_Args, _State) ->
  ok.

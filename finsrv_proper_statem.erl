%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc gen_server PropEr Abstract State Machine.
%%% @end
-module({{name}}_srv_asm).

-behaviour(proper_statem).

-include_lib("proper/include/proper.hrl").

-export([test/0, sample/0]).
-export([initial_state/0, command/1,
  precondition/2, postcondition/3,
  next_state/3]).

-define(SERVER, {{name}}_srv).

%%%.
%%%'   STATEM CALLBACKS
test() ->
  proper:quickcheck(?MODULE:prop_{{name}}()).

sample() ->
  proper_gen:pick(commands(?MODULE)).

prop_{{name}}() ->
  ?FORALL(Cmds, commands(?MODULE),
    ?TRAPEXIT(
      begin
          ?SERVER:start_link(),
          {History, State, Result} = run_commands(?MODULE, Cmds),
          ?SERVER:stop(),
          ?WHENFAIL(
            io:format("History: ~w\nState: ~w\nResult: ~w\n",
              [History, State, Result]),
            aggregate(command_names(Cmds), Result =:= ok))
      end
    )).

initial_state() ->
  % TODO: specify initial state
  [].

command(State) ->
  % TODO: specify list of commands with appropriate frequency
  % weights to generate
  frequency([]).

% TODO: flesh out precondition function clauses
precondition(State, Request) ->
  true.

% TODO: flesh out next_state logic clauses
next_state(State, Value, Request) ->
  State.

% TODO: flesh out postcondition function clauses
postcondition(State, Request) ->
  true.

%%%.
%%%'   PRIVATE FUNCTIONS

%% @private
matches(X, X) -> 1;
matches(_, _) -> 0.
%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

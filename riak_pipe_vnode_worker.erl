%%% -*- mode: erlang -*-
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:
%%%'   HEADER
%%% @copyright {{copyright_year}} {{author_name}} <{{author_email}}>
%%% @license   {{license}}
%%% @doc
%%% {{description}}
%%% @end
-module({{name}}_vnode_worker).

-behavior(riak_pipe_vnode_worker).

-export([
  init/2,
  process/3,
  done/1
]).

-include("riak_pipe.hrl").
-include("riak_pipe_log.hrl").

-record(state,
  { partition :: riak_pipe_vnode:partition()
  , fitting_details :: riak_pipe_fitting:details()
  }
).
-opaque state() :: #state{}.

% TODO: Add macros or records here if pertinent


%%%.
%%%'   PUBLIC API

%% @doc Initialization stores the partition and fitting details
%%      in the module's state record so it can send outputs from
%%      {@link process/3}.
-spec init(Partition, FittingDetails) -> {ok, state()}
  when
      Partition :: riak_pipe_vnode:partition(),
      FittingDetails :: riak_pipe_vnode:details().
init(_Partition, _FittingDetails) ->
  % TODO: Implement
  not_implemented.

%% @doc
-spec process(Input, Last, State) -> {ok, NewState}
  when
      Input     :: any(),
      Last      :: any(),
      State     :: state(),
      NewState  :: state().
process(_Input, _Last, _State) ->
  % TODO: Implement
  not_implemented.

-spec done(State :: state()) -> ok.
done(_State) ->
  % TODO: Implement
  not_implemented.

%%%.
%%%'   PRIVATE FUNCTIONS
% TODO: Add private helper functions here.

%%%.

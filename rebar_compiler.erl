%%%----------------------------------------------------------------------
%%% @author {{author_name}} <{{author_name}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc rebar compiler to {{description}}
%%% @end
%%%----------------------------------------------------------------------
-module({{compiler_name}}).
-author('{{author_name}} <{{author_email}}>').

-export([compile/2]).

-ifdef(TEST).
-compile(export_all).
-endif.

-include_lib("rebar/include/rebar.hrl").

%% ===================================================================
%% Public API
%% ===================================================================

%% @spec compile(Config, AppFile) -> ok | skipped
%% @doc Compiles files compiler is *interested* in.
compile(Config, _AppFile) ->
  ok

%% ===================================================================
%% Internal functions
%% ===================================================================

%% @private
%% @doc returns default value for matching compiler option
%% @end
%% TODO: Add clauses to default/1 below for each option with a default.
default(CompilerOpt) -> "".

%% TODO: Add other internal functions below here...


%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}> 
%%% @since {{date}}
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc {{description}}
%%% @end
-module(tint_sup).

-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).
%%%.
%%%'   PUBLIC API
start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%%%.
%%%'   CALLBACKS
init([]) ->
  {ok, { {one_for_one, 5, 10}, []} }.

%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

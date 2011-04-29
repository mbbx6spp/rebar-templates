%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc Nitrogen action: {{description}}
%%% @end
-module({{app_name}}_{{name}}_action).
-author('{{author_name}} <{{author_email}}>').

-include_lib("nitrogen_core/include/wf.hrl").
-export([render_action/1]).

%% TODO: Make sure to add record definition to your app's header file. 

%%%.
%%%'   NITROGEN CALLBACKS

%% @hidden
render_action(Record) ->
  Target = Record#{{name}}_action.target,
  % TODO change script below to something you want JS to do.
  Script = "toString()",
  [wf:f("objs('~s').", [Target], Script)].

%%%.
%%%'   PRIVATE FUNCTIONS

%% TODO: Add private functions for element module here.

%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

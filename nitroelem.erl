%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc Nitrogen element: {{description}}
%%% @end
-module({{app_name}}_{{name}}_element).
-author('{{author_name}} <{{author_email}}>').

-include_lib("nitrogen_core/include/wf.hrl").
-export([reflect/0, render_element/1]).

%% TODO: Make sure to add record definition to your app's header file. 

%%%.
%%%'   NITROGEN CALLBACKS

%% @hidden
reflect() -> record_info(fields, {{app_name}}_{{name}}_element).

%% @hidden
render_element(Record) ->
  wf_tags:emit_tag('div', "", [{class, [{{name}}]}]).

%%%.
%%%'   PRIVATE FUNCTIONS

%% TODO: Add private functions for element module here.

%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

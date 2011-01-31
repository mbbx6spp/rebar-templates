%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}>
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc Nitrogen page handler for {{description}}
%%% @end
-module({{app_name}}_{{page_name}}_page).
-author('{{author_name}} <{{author_email}}>').

-include_lib("nitrogen_core/include/wf.hrl").
-compile(export_all).
%%%.
%%%'   NITROGEN CALLBACKS
main() -> #template { file="./templates/{{page_name}}.html" }.

%%%.
%%%'   TEMPLATE CALLBACKS
title() ->
  "{{description}}".

%%%.
%%%'   EVENT CALLBACKS
event(_) -> ok.

%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

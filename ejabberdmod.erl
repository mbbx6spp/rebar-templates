%%%'   HEADER
%% @author {{author_name}} <{{author_email}}>
%% @copyright {{copyright_year}} {{author_name}}
%% @doc ejabberd module that ... listens to packets sent & received by users.
%% @end

-module(mod_{{name}}).
-author('{{author_name}} <{{author_email}}>').

-behaviour(gen_mod).

-export([start/2, init/2, stop/1,
   send_packet/3, receive_packet/4]).

-include_lib("ejabberd/include/ejabberd.hrl").
-include("ejabberd/include/jlib.hrl").

-define(PROCNAME, ejabberd_{{name}}).

-ifdef(TEST).
-compile(export_all).
-endif.

%%%.
%%%'   CALLBACKS

start(Host, Opts) ->
  Opt1 = gen_mod:get_opt(opt1, Opts, "default value"),
  % capture packets sent by user
  ejabberd_hooks:add(user_send_packet, Host, ?MODULE, send_packet, 90),
  % capture packets received by user
  ejabberd_hooks:add(user_receive_packet, Host, ?MODULE, receive_packet, 90),
  % register the module process for Host and spawn.
  register(gen_mod:get_module_proc(Host, ?PROCNAME),
    spawn(?MODULE, init, [Host, Opt1])).

stop(Host) ->
  % remove hook for packets sent by user
  ejabberd_hooks:delete(user_send_packet, Host, ?MODULE, send_packet, 90),
  % remove hook for packets received by user
  ejabberd_hooks:delete(user_receive_packet, Host, ?MODULE, receive_packet, 90),
  % send stop message to process
  Proc = gen_mod:get_module_proc(Host, ?PROCNAME),
  Proc ! stop,
  {wait, Proc}.

init(Host, Opt1) ->
  % do something here instead of nothing
  loop(Host, Opt1).

loop(Host, Opt1) ->
  receive
    {persist, E} ->
      persist(E),
      loop(Host, Opt1);
    stop ->
      ok;
    _ ->
      loop(Host, Opt1)
  end.

%%%.
%%%'   PUBLIC API

%% @spec send_packet(FromJID, ToJID, P) -> ??
%% @doc 
%% @end
send_packet(FromJID, ToJID, P) ->
    Host = FromJID#jid.lserver,
    Proc = gen_mod:get_module_proc(Host, ?PROCNAME),
    Proc ! {persist, {send, FromJID, ToJID, P}}.

%% @spec receive_packet(FromJID, ToJID, P) -> ??
%% @doc 
%% @end
receive_packet(_JID, From, To, P) ->
    Host = To#jid.lserver,
    Proc = gen_mod:get_module_proc(Host, ?PROCNAME),
    Proc ! {persist, {recv, From, To, P}}.

%%%.
%%%'   PRIVATE FUNCTIONS

%% @private
persist({recv, From, To, P}) ->
  % do something with this data...like persist it somehow
  ok;
persist({send, FromJID, ToJID, P}) -> 
  % do something with this data...like persist it somehow
  ok.
%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

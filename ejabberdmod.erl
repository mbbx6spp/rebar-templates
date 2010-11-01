%%%----------------------------------------------------------------------
%%% File    : mod_{{name}}.erl
%%% Author  : {{author_name}}
%%% Purpose : ejabberd module that ... listens to packets sent & received 
%%%           by users.
%%%----------------------------------------------------------------------

-module(mod_{{name}}).
-author({{author_name}}).

-behaviour(gen_mod).

-export([start/2, init/7, stop/1,
	 send_packet/3, receive_packet/4]).

-include("ejabberd.hrl").
-include("jlib.hrl").

-define(PROCNAME, ejabberd_{{name}}).

%% -------------------
%% Module control
%% -------------------
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

%% -------------------
%% Loop
%% -------------------
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

%% -------------------
%% Public/Exported
%% -------------------
send_packet(FromJID, ToJID, P) ->
    Host = FromJID#jid.lserver,
    Proc = gen_mod:get_module_proc(Host, ?PROCNAME),
    Proc ! {persist, {send, FromJID, ToJID, P}}.

receive_packet(_JID, From, To, P) ->
    Host = To#jid.lserver,
    Proc = gen_mod:get_module_proc(Host, ?PROCNAME),
    Proc ! {persist, {recv, From, To, P}}.

%% -------------------
%% Private
%% -------------------
persist({recv, From, To, P}) ->
  % do something with this data...like persist it somehow
  ok;
persist({send, FromJID, ToJID, P}) -> 
  % do something with this data...like persist it somehow
  ok.

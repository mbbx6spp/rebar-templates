%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}>
%%% @copyright {{copyright_year}} {{author_name}}.
%%% @doc {{description}}

-module({{app_name}}_{{name}}_resource).
-author('{{author_name}} <{{author_email}}>').

% Webmachine callback exports
-export([init/1, resource_exists/2, is_authorized/2, forbidden/2]).
-export([malformed_request/2, allowed_methods/2, content_types_provided/2]).
-export([content_types_accepted/2, charsets_provided/2, encodings_provided/2]).
-export([previously_existed/2, moved_permanently/2, moved_temporarily/2]).
-export([last_modified/2, expires/2, generate_etag/2, finish_request/2]).
% to_X callback exports
-export([to_json/2, to_plain_text/2, to_html/2]).

-include_lib("webmachine/include/webmachine.hrl").

-define(DEFAULT_ENCODINGS, [{"identity", fun (X) -> X end}]).
-define(DEFAULT_CONTENT_TYPES, [
    {"application/json", to_json},
    {"text/plain", to_plain_text},
    {"text/html", to_html}
  ]).

-ifdef(TEST).
-compile(export_all).
-endif.
%%%.
%%%'   WEBMACHINE CALLBACKS
-spec init(InitArgs) -> {ok, State} | {error, Reason}
  when
      InitArgs :: list(),
      State :: any(),
      Reason :: term().
init([]) -> {ok, undefined}.

-spec resource_exists(ReqData, State) -> 
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: boolean() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
resource_exists(ReqData, State) ->
  {true, ReqData, State}.

-spec service_available(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: boolean() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
service_available(ReqData, State) ->
  {true, ReqData, State}.

-spec is_authorized(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: boolean() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
is_authorized(ReqData, State) ->
  {true, ReqData, State}.

-spec forbidden(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: boolean() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
forbidden(ReqData, State) ->
  {false, ReqData, State}.

-spec malformed_request(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: boolean() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
malformed_request(ReqData, State) ->
  {false, ReqData, State}.

-spec allowed_methods(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: list(atom()) | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
allowed_methods(ReqData, State) ->
  % TODO: Determine what methods are relevant to incoming request.
  Methods = ['GET', 'POST', 'PUT', 'DELETE', 'HEAD', 'OPTIONS'],
  % NOTE By default will return empty list to force developer to think about this!:)
  {[], ReqData, State}.

-spec content_types_provided(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: [{MimeType :: string(), MimeTypeConverter :: function()}] |
        [] | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
content_types_provided(ReqData, State) ->
  ContentTypes = ?DEFAULT_CONTENT_TYPES,
  {ContentTypes, ReqData, State}.

-spec content_types_accepted(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: [{MimeType :: string(), MimeTypeConverter :: function()}] |
        [] | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
content_types_accepted(ReqData, State) ->
  ContentTypes = ?DEFAULT_CONTENT_TYPES,
  {ContentTypes, ReqData, State}.

-spec charsets_provided(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: [{Charset :: string(), CharsetConverter :: function()}] | 
        no_charset | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
charsets_provided(ReqData, State) ->
  Charsets = [
  ],
  {Charsets, ReqData, State}.

-spec encodings_provided(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: [{Charset :: string(), CharsetConverter :: function()}] | 
        no_charset | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
encodings_provided(ReqData, State) ->
  Encodings = case wrq:method(ReqData) of
    'GET' ->
      [ {"gzip", fun (X) -> zlib:gzip(X) end} | ?DEFAULT_ENCODINGS ];
    _OtherMethod ->
      ?DEFAULT_ENCODINGS
  end,
  {Encodings, ReqData, State}.

-spec previously_existed(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: boolean() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
previously_existed(ReqData, State) ->
  {false, ReqData, State}.

-spec moved_permanently(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: boolean() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
moved_permanently(ReqData, State) ->
  {false, ReqData, State}.

-spec moved_temporarily(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: boolean() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
moved_temporarily(ReqData, State) ->
  {false, ReqData, State}.

-spec last_modified(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Year :: integer(4),
      Month :: integer(2),
      Date :: integer(2),
      Hour :: integer(2),
      Minute :: integer(2),
      Second :: integer(2),
      Result :: undefined | { {Year, Month, Date}, {Hour, Minute, Second} } | 
        {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
last_modified(ReqData, State) ->
  % TODO: Figure out way to set this appropriately for resource
  {undefined, ReqData, State}.

-spec expires(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Year :: integer(4),
      Month :: integer(2),
      Date :: integer(2),
      Hour :: integer(2),
      Minute :: integer(2),
      Second :: integer(2),
      Result :: undefined | { {Year, Month, Date}, {Hour, Minute, Second} } | 
        {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
expires(ReqData, State) ->
  % TODO: Figure out way to set this appropriately for resource
  {undefined, ReqData, State}.

-spec generate_etag(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: undefined | string() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
generate_etag(ReqData, State) ->
  % TODO: Figure out way to set this appropriately for resource
  {undefined, ReqData, State}.

-spec finish_request(ReqData, State) ->
  {Result, NewReqData, NewState}
  when
      ReqData :: #wm_reqdata{},
      State :: any(),
      Result :: undefined | string() | {error, term()} | {halt, integer()},
      NewReqData :: #wm_reqdata{},
      NewState :: any().
finish_request(ReqData, State) ->
  % TODO: Modify ReqData object returned to effect processing of HTTP request
  % since value returned is actually ignored by Webmachine.
  {true, ReqData, State}.
%%%.
%%%'   OUTPUT FUNCTIONS
to_html(ReqData, State) ->
  {"<html><body></body></html>", ReqData, State}.

to_plain_text(ReqData, State) ->
  {"OK", ReqData, State}.

to_json(ReqData, State) ->
  {"{'status': 200, 'text': 'OK'}", ReqData, State}.
%%%.
%%%'   PRIVATE FUNCTIONS
% TODO: Add private functions here...

%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

%%%'   HEADER
%%% @author {{author_name}} <{{author_email}}> 
%%% @since {{date}}
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc {{description}}
%%% @end

-module({{name}}_SUITE).
%% Note: This directive should only be used in test suites.
-compile(export_all).
-include_lib("common_test/include/ct.hrl").
%%%.
%%%' CALLBACKS

%% @doc returns list of tuples to set default properties for the suite.
-spec suite() -> Config
  when
      Config :: proplist().
suite() ->
  [{timetrap,{minutes,10}}].

%% @doc runs initialization before matching test suite is executed. 
%%      This function may add key/value pairs to Config.
-spec init_per_suite(Config0) ->
  Config1 | {skip, Reason} | {skip_and_save, Reason, Config1}
  when
      Config0 :: proplist(),
      Config1 :: proplist(),
      Reason :: term().
init_per_suite(Config) ->
  Config.

%% @doc runs cleanup after matching test suite is executed.
-spec end_per_suite(Config0) -> ok | {save_config, Config1}
  when
      Config0 :: proplist(),
      Config1 :: proplist().
end_per_suite(_Config) ->
  ok.

%% @doc runs initialization before matching test group is executed.
-spec init_per_group(GroupName, Config0) ->
  Config1 | {skip, Reason} | {skip_and_save, Reason, Config1}
  when
      GroupName :: string(),
      Config0 :: proplist(),
      Config1 :: proplist(),
      Reason :: term().
init_per_group(_GroupName, Config) ->
  Config.

%% @doc runs cleanup after matching test group is fully executed.
-spec end_per_group(GroupName, Config0) -> ok | {save_config, Config1}
  when
      GroupName :: string(),
      Config0 :: proplist(),
      Config1 :: proplist().
end_per_group(_GroupName, _Config) ->
  ok.

%% @doc runs initialization before matching test case. Should not alter or 
%%      remove any key/value pairs to the Config, but may add to it.
-spec init_per_testcase(TestCase, Config0) ->
  when
      TestCase :: atom(),
      Config0 :: proplist(),
      Config1 :: proplist(),
      Reason :: term().
init_per_testcase(_TestCase, Config) ->
  Config.

%% @doc runs cleanup for matching test case.
-spec end_per_testcase(TestCase, Config0) ->
  ok | {save_config, Config1} | {fail, Reason}
  when
      TestCase :: atom(),
      Config0 :: proplist(),
      Config1 :: proplist(),
      Reason :: term().
end_per_testcase(_TestCase, _Config) ->
  ok.

%% @doc returns list of test case group definitions.
-spec groups() -> [Group]
  when
      Group :: {GroupName, Properties, Members},
      GroupName :: atom(),
      Properties :: [parallel | sequence | Shuffle | {RepeatType, N}],
      Members :: [Group | {group, GroupName} | TestCase],
      TestCase :: atom(),
      Shuffle :: shuffle | {shuffle, Seed},
      Seed :: {integer(), integer(), integer()},
      RepeatType :: repeat | repeat_until_all_ok | repeat_until_all_fail |
        repeat_until_any_ok | repeat_until_any_fail
      N :: integer() | forever.
groups() ->
  [].

%% @doc returns list of tests (group or testcase) to be run for all of suite.
-spec all() -> Tests | {skip, Reason}
  when
      Test :: {group, GroupName} | TestCase,
      Tests :: [Test],
      GroupName :: atom(),
      TestCase :: atom(),
      Reason :: term().
all() ->
  [my_test_case].

%%%.
%%%'   TESTCASES

%% @doc returns list of tuples to set info properties for the test case.
-spec my_test_case() -> Info
  when
      Info :: proplist().
my_test_case() -> 
  [].

%% @doc the test function.
@spec TestCase(Config0) ->
        ok | exit() | {skip, Reason} | {comment, Comment} |
        {save_config, Config} | {skip_and_save, Reason, Config1}
  when
  Config0 :: Config1 :: proplist(),
      Reason :: term(),
      Comment :: term()
my_test_case(_Config) -> 
  ok.
%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:

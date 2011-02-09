%%% @author {{author_name}} <{{author_email}}> 
%%% @copyright {{copyright_year}} {{author_name}}
%%% @doc Test suite for {{name}} module which {{description}}
%%% @end

-module({{name}}_SUITE).
%% Note: This directive should only be used in test suites.
-compile(export_all).
-include_lib("common_test/include/ct.hrl").

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS
%%--------------------------------------------------------------------

%% @spec suite() -> Config
%% where
%%       Config = [tuple()]
%% @doc returns list of tuples to set default properties for the suite.
suite() ->
  [{timetrap,{minutes,10}}].

%% @spec init_per_suite(Config0) -> 
%%         Config1 | {skip, Reason} | {skip_and_save, Reason, Config1}
%% where
%%       Config0 = Config1 = [tuple()],
%%       Reason = term()
%% @doc runs initialization before matching test suite is executed. 
%%      This function may add key/value pairs to Config.
init_per_suite(Config) ->
  Config.

%% @spec end_per_suite(Config0) -> ok | {save_config, Config1}
%% where
%%       Config0 = Config1 = [tuple()]
%% @doc runs cleanup after matching test suite is executed.
end_per_suite(_Config) ->
  ok.

%% @spec init_per_group(GroupName, Config0) -> 
%%         Config1 | {skip, Reason} | {skip_and_save, Reason, Config1}
%% where
%%       GroupName = atom(),
%%       Config0 = Config1 = [tuple()],
%%       Reason = term()
%% @doc runs initialization before matching test group is executed.
init_per_group(_GroupName, Config) ->
  Config.

%% @spec end_per_group(GroupName, Config0) -> ok | {save_config, Config1}
%% where
%%       GroupName = atom(),
%%       Config0 = Config1 = [tuple()]
%% @doc runs cleanup after matching test group is fully executed.
end_per_group(_GroupName, _Config) ->
    ok.

%% @spec init_per_testcase(TestCase, Config0) ->
%%         Config1 | {skip, Reason} | {skip_and_save, Reason, Config1}
%% where
%%       TestCase = atom(),
%%       Config0 = Config1 = [tuple],
%%       Reason = term()
%% @doc runs initialization before matching test case. Should not alter or 
%%      remove any key/value pairs to the Config, but may add to it.
init_per_testcase(_TestCase, Config) ->
  Config.

%% @spec end_per_testcase(TestCase, Config0) ->
%%         ok | {save_config, Config1} | {fail, Reason}
%% where
%%       TestCase = atom(),
%%       Config0 = Config1 = [tuple()],
%%       Reason = term()
%% @doc runs cleanup for matching test case.
end_per_testcase(_TestCase, _Config) ->
  ok.

%% @spec groups() -> [Group]
%% where
%%       Group = {GroupName, Properties, Members},
%%       GroupName = atom(),
%%       Properties = [parallel | sequence | Shuffle | {RepeatType, N}],
%%       Members = [Group | {group, GroupName} | TestCase],
%%       TestCase = atom(),
%%       Shuffle = shuffle | {shuffle, Seed},
%%       Seed = {integer(), integer(), integer()},
%%       RepeatType = repeat | repeat_until_all_ok | repeat_until_all_fail |
%%         repeat_until_any_ok | repeat_until_any_fail
%%       N = integer() | forever
%% @doc returns list of test case group definitions.
groups() ->
  [].

%% @spec all() -> Tests | {skip, Reason}
%% where
%%       Tests = [{group, GroupName} | TestCase],
%%       GroupName = atom(),
%%       TestCase = atom(),
%%       Reason = term()
%% @doc returns list of tests (group or testcase) to be run for all of suite.
all() ->
  [test_compile_2_ok].

%%--------------------------------------------------------------------
%% TEST CASES
%%--------------------------------------------------------------------

%% @spec TestCase() -> Info
%% where
%%       Info = [tuple()]
%% @doc returns list of tuples to set properties for the test case.
test_compile_2_ok() -> 
  %% TODO: modify proplist below for success case.
  [{compiler_config, []}, {compiler_appfile, ""}].

%% @spec TestCase(Config0) ->
%%         ok | exit() | {skip, Reason} | {comment, Comment} |
%%         {save_config, Config} | {skip_and_save, Reason, Config1}
%% where
%%       Config0 = Config1 = [tuple()],
%%       Reason = term(),
%%       Comment = term()
%% @doc runs the test case function. Verifies the cases where 
%% {{name}}_compiler:compile/2 should return ok.
test_compile_2_ok(Config) -> 
  CompilerConfig = proplists:get_value(compiler_config, Config),
  CompilerAppfile = proplists:get_value(compiler_appfile, Config),
  ok = {{name}}:compile(CompilerConfig, CompilerAppfile),
  ok.

%% @spec TestCase() -> Info
%% where
%%       Info = [tuple()]
%% @doc returns list of tuples to set properties for the test case.
test_compile_2_skipped() -> 
  %% TODO: modify proplist below for skipped case.
  [{compiler_config, []}, {compiler_appfile, ""}].

%% @spec TestCase(Config0) ->
%%         ok | exit() | {skip, Reason} | {comment, Comment} |
%%         {save_config, Config} | {skip_and_save, Reason, Config1}
%% where
%%       Config0 = Config1 = [tuple()],
%%       Reason = term(),
%%       Comment = term()
%% @doc runs the test case function. Verifies the cases where 
%% {{name}}_compiler:compile/2 should return ok.
test_compile_2_skipped(Config) -> 
  CompilerConfig = proplists:get_value(compiler_config, Config),
  CompilerAppfile = proplists:get_value(compiler_appfile, Config),
  skipped = {{name}}:compile(CompilerConfig, CompilerAppfile),
  ok.


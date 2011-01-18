%%% @author {{author_name}} <{{author_email}}> 
%%% @since {{date}}
%%% @doc {{description}}
%%% @end

-module({{suite_name}}_SUITE).
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
    [my_test_case].

%%--------------------------------------------------------------------
%% TEST CASES
%%--------------------------------------------------------------------

%% @spec TestCase() -> Info
%% where
%%       Info = [tuple()]
%% @doc returns list of tuples to set properties for the test case.
my_test_case() -> 
    [].
%%--------------------------------------------------------------------
%% Function: TestCase(Config0) ->
%%               ok | exit() | {skip,Reason} | {comment,Comment} |
%%               {save_config,Config1} | {skip_and_save,Reason,Config1}
%%
%% Config0 = Config1 = [tuple()]
%%   A list of key/value pairs, holding the test case configuration.
%% Reason = term()
%%   The reason for skipping the test case.
%% Comment = term()
%%   A comment about the test case that will be printed in the html log.
%%
%% Description: Test case function. (The name of it must be specified in
%%              the all/0 list or in a test case group for the test case
%%              to be executed).
%%--------------------------------------------------------------------
%% @spec TestCase(Config0) ->
%%         ok | exit() | {skip, Reason} | {comment, Comment} |
%%         {save_config, Config} | {skip_and_save, Reason, Config1}
%% where
%%       Config0 = Config1 = [tuple()],
%%       Reason = term(),
%%       Comment = term()
%% @doc the test function.
my_test_case(_Config) -> 
    ok.


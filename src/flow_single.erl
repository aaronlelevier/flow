%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 09. Jun 2022 6:13 AM
%%%-------------------------------------------------------------------
-module(flow_single).
-author("Aaron Lelevier").

-behaviour(gen_statem).

%% API
-export([
  start/0
]).

%% gen_statem callbacks
-export([
  init/1,
  terminate/3,
  code_change/4,
  callback_mode/0
]).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

start() ->
  gen_statem:start(?MODULE, [], []).

%%%===================================================================
%%% gen_statem callbacks
%%%===================================================================

init([]) ->
  {ok, idle, #state{}}.

-spec callback_mode() -> handle_event_function | state_functions.
callback_mode() ->
  state_functions.

terminate(_Reason, _StateName, _State = #state{}) ->
  ok.

code_change(_OldVsn, StateName, State = #state{}, _Extra) ->
  {ok, StateName, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 09. Jun 2022 6:13 AM
%%%-------------------------------------------------------------------
-module(flow_meter).
-author("Aaron Lelevier").

-behaviour(gen_statem).

%% API
-export([
  start/1,
  open/3,
  get_data/1
]).

%% gen_statem callbacks
-export([
  init/1,
  terminate/3,
  code_change/4,
  callback_mode/0,
  handle_event/3
]).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

start(Config) ->
  gen_statem:start(?MODULE, Config, []).

get_data(Pid) ->
  gen_statem:call(Pid, get_data).

%%%===================================================================
%%% gen_statem callbacks
%%%===================================================================

init(Config) ->
  State = open,
  Data = #{
    config => Config,
    state => #{
      gph => 0
    }
  },
  {ok, State, Data}.

-spec callback_mode() -> handle_event_function | state_functions.
callback_mode() ->
  state_functions.

terminate(_Reason, _StateName, _State = #state{}) ->
  ok.

code_change(_OldVsn, StateName, State = #state{}, _Extra) ->
  {ok, StateName, State}.

%% State callbacks
open(EventType, EventContent, Data) ->
  handle_event(EventType, EventContent, Data).

%% Handle events common to all states
handle_event({call, From}, get_data, Data) ->
  {keep_state, Data, [{reply, From, Data}]};
handle_event(_, _, Data) ->
  %% Ignore all other events
  {keep_state, Data}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

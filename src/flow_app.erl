%%%-------------------------------------------------------------------
%% @doc flow public API
%% @end
%%%-------------------------------------------------------------------

-module(flow_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    lager:start(),
    lager:info("lager start"),
    flow_sup:start_link().

stop(_State) ->
    ok.

%% internal functions

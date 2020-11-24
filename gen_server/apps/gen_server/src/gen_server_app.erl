%%%-------------------------------------------------------------------
%% @doc gen_server public API
%% @end
%%%-------------------------------------------------------------------

-module(gen_server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    gen_server_sup:start_link().

stop(_State) ->
    ok.

%% internal functions

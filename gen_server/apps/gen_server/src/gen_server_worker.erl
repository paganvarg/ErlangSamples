-module(gen_server_worker).

-behaviour(gen_server).

-export([start_link/0, stop/0]).
-export([init/1, handle_call/3, handle_cast/2,
handle_info/2, code_change/3, terminate/2]).

start_link() ->
gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
 
stop() -> gen_server:call(?MODULE, stop).

init(_Config) ->
    process_flag(trap_exit, true),
    io:format("Starting worker", []),
    {ok, {}}.

handle_call(stop, _From, State) ->
    io:format("Stop Call message", []),
    {stop, normal, ok, State};

handle_call(Msg, _From, State) ->
    io:format("Call message ~p", [Msg]),
    {reply, ok, State}.

handle_cast(Msg, State) ->
    io:format("Cast message ~p", [Msg]),
    {noreply, State}.

handle_info(Msg, State) ->
    io:format("Info message ~p", [Msg]),
    {noreply, State}.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

terminate(Reason, State) ->
    io:format("Reason ~p State ~p", [Reason, State]),
    ok.
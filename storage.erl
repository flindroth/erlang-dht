% storage.erl - object storage for erlang-dht
%

-module(storage).
-export([store/2,retrieve/1,init/1]).

store(Key,Value) ->
	storage ! {store,Key,Value}.

retrieve(Key) ->
	storage ! {get,self(),Key},
	receive
		{result,Value} -> Value;
		_ -> error
	end.


storage_srv(Path) ->
	receive
		{get, PID, Key} ->
			PID ! file:read_file(Path+Key),
			storage_srv(Path);
		Other ->
			io:format("Unknown message: ~p~n", [Other]),
			storage_srv(Path)
		end.

init(Path) ->
	register(storage,spawn(storage,storage_srv,[Path])).


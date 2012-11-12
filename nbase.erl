-module(nbase).
-export([ntoten/2,tenton/2]).

tenton(Number,Base) ->
	list_to_integer(integer_to_list(Number,Base)).

ntoten(Number,Base) ->
	List = integer_to_list(Number),
	listtoten(List,Base).	

listtoten([], _) ->
	0;	
listtoten([H|T],Base) ->
	io:format("Step: List length ~p, list head ~p~n",[length([H|T]),H]),
	Digit = case H of
		48 -> 0;
		49 -> 1;
		50 -> 2;
		51 -> 3;
		52 -> 4;
		53 -> 5;
		54 -> 6;
		55 -> 7;
		58 -> 9
	end,
	io:format("Digit: ~p -> ~p. Remaining: ~p~n", [H,Digit,T]),	
%	((Digit)*power:pow_bin(Base,(length([H|T])-1))) + listtoten(T,Base).
%	1 + listtoten(T,Base).
	Position = length([H|T])-1,
	Digit * power:pow_bin(Base,Position) + listtoten(T,Base).


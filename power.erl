-module(power).
-compile([pow_bin/2]).
-export([pow_bin/2]).
pow_bin(_, 0) ->
	1;
pow_bin(0, _) ->
	0;
pow_bin(X, N) ->
pow_bin(X, N, 1).

pow_bin(X, N, Acc) when (N rem 2) =:= 0 ->
pow_bin(X * X, N div 2, Acc);
pow_bin(X, N, Acc) ->
NewAcc = Acc * X,
case N div 2 of
0 ->
NewAcc;
_ ->
pow_bin(X * X, N div 2, Acc * X)
end.

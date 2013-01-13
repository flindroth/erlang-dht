-module(leaf_table).
-export([list_insert/2]).

% list_insert: insert new leaves into the leaf table using insertion sort.
list_insert(Leaf,LeafTable) ->
	list_insert([],Leaf,LeafTable).

list_insert(Acc,{ID,Node},[]) ->
	lists:reverse([{ID,Node} | Acc]);
list_insert(Acc,{ID,Node},[{HID,HNode} | T]) ->
	if
		ID > HID ->
			list_insert([{HID,HNode} | Acc],{ID,Node},T);
		ID == HID ->
			lists:reverse(Acc,[{ID,Node} | T]);
		true ->
			lists:reverse(Acc,[{ID,Node} | [{HID,HNode} | T]])	
	end.	
	

add(LeafTable, {ID,Node}) ->
	list_insert({ID,Node},LeafTable).

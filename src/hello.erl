%%%-------------------------------------------------------------------
%%% @author renan.souza
%%% @copyright (C) 2017, <COMPANY>
%%%
%%% @end
%%% Created : 05. Apr 2017 14:40
%%%-------------------------------------------------------------------
-module(hello).
-import(array, [get/2]).
-export([start/0,print_list_recursion/2,print_recursion/1,print_array_recursion/2,array_add_items/4,list_add_items/4]).

%--------- types -----------%
%start() ->
%   Bin = <<10, 20>>,
%   X = binary_to_list(Bin),
%   io:fwrite('~w', [X]). show all items of the array

%start() ->
%  P = {jhon, 24, {june, 25}},
%  io:fwrite('~w', [tuple_size(P)]). show the number of terms from array

%start() ->
%  M1 = #{name=>john,age=>25},
%  io:fwrite("~w",[map_size(M1)]). <key>=><value> from a map

%start() ->
%  L = [10,20,30] ,
%  io:fwrite("~w",[length(L)]). shows the lenght of the array

%-------- variables --------%
% to create variable you only have to write her name and her value
% ex: var-name=var-value

%%start() ->
%%  X = 10,
%%  Y = 20,
%%  Result = [X+Y],
%%  io:fwrite('~w', Result). this represents a sum of variables

%% numbers
%%
%% div faz a divisão de dois numeros e exclui o resto
%% rem devolve o resto da divisão
%%
%% bases diferentes
%% o número antes da # é a base e o resto é o valor dele
%% 2#101010 = 42
%% 8#0677 = 447
%% 16#AE = 174

% ~n is equal println in java
% ~f represents a float value

%%start() ->
%%  X = 40.00,
%%  Y = 50.00,
%%  io:fwrite("~f~n",[X]),
%%  io:fwrite("~f",[Y]).

%------- operators ----------%
% == equal
% /= diference
% < minor
% > major
% <= and >= exists too
% or  || in java
% and && in java
% not
% xor if a element is true, but not both

%start() ->
% io:fwrite(false xor true).

% ------ while -------
%%fac(N) when N == 0 -> 1; escape
%%fac(N) when N > 0 -> N*fac(N-1). recursive
%%
%%start() ->
%%  X = fac(4),
%%  io:fwrite('~w', [X]).


%%len([]) -> 0; % escape(if dont have anymore item in array return 0)
%%len([_|T]) -> 1 + len(T). % run into the array, sum 1 to each item (equals lenght at java).
%%
%%start() ->
%%  X = [1,2,3,4],
%%  Y = len(X),
%%  io:fwrite('~w ', [Y]).

%%duplicate(0, _) -> [];         % if pass 0 stop
%%duplicate(N, Term) when N > 0 ->
%%  io:fwrite("~w~n",[Term]),
%%  [Term|duplicate(N-1, Term)]. %repeat the Term N Times
%%start() ->
%%  duplicate(5,1).

%%tail_len(L) -> tail_len(L, 0).             % tail_len/1 at export
%%tail_len([], Acc) -> Acc;
%%tail_len([_|T], Acc) -> tail_len(T, Acc+1).% tail_len/2 at export
%%
%%start() ->
%%  X = [1,2,3,4],
%%  Y = tail_len(X),
%%  io:fwrite('~w', [Y]).

%%tail_reverse(L) -> tail_reverse(L,[]).    invert the sequence of the array
%%
%%tail_reverse([], Acc) -> Acc;
%%tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).
%%
%%start() ->
%%  X = [1,2,3,4],
%%  Y = tail_reverse(X),
%%  io:fwrite("~w", [Y]).

% ------- for --------
%%for(0,_) ->
%%  [];
%%
%%for(N,Term) when N > 0 ->
%%  io:fwrite("~w~n", [N]),
%%  [Term|for(N-1,Term)].
%%
%%start() ->
%%  for(5,1).

%------------ using functions from other modules --------------%
%%import(test, [start/0]). if you dont import that, you can run calling test:start(parameters).

print_recursion(0) -> 0;
print_recursion(N) ->
  io:fwrite("~w~n", [N]),
  print_recursion(N-1).

print_array_recursion(Array, N) when N < 0 -> 0;
print_array_recursion(Array, Index) ->
  io:fwrite("~w~n", [array:get(Index, Array)]),
  print_array_recursion(Array, Index-1).

print_list_recursion(List, Index) when Index > length(List) -> 0;
print_list_recursion(List, Index) ->
  Item = lists:sublist(List, Index, 1),
  io:fwrite("~w~n", [Item]),
  print_list_recursion(List, Index+1).

array_add_items(Index, HowMuch, Items, Array) when HowMuch < 0 -> Array;
array_add_items(Index, HowMuch, Items, Array) ->
  X = array:set(Index, array:get(HowMuch, Items), Array),
  array_add_items(Index+1, HowMuch-1, Items, X).

list_add_items(Index, HowMuch, Items, List) when HowMuch == 0 -> List;termi
list_add_items(Index, HowMuch, Items, List) ->
  ListToAdd = lists:nth(Index, Items),
  X = lists:append(List, ListToAdd),
  list_add_items(Index+1, HowMuch-1, Items, X).

start() ->
  List = [1,2,3,4],
  Items = [[5,6,7,8], [9,10,11]],
  Xablau = list_add_items(1, 2, Items, List),
  io:fwrite("~w", [Xablau]),
  print_list_recursion(Xablau, 1),

  Map = #{"Name" := "Renan"},
  io:fwrite("~w", [Map]).


%%start() ->
%%  AnArray = array:new(),                          using array
%%  A = array:set(0, 1, AnArray),
%%  B = array:set(1, 2, A),
%%  C = array:set(2, 3, B),
%%  D = array:set(3, 4, C),
%%
%%  Array = array:new(),
%%  W = array:set(0, 1, Array),
%%  X = array:set(1, 2, W),
%%  Y = array:set(2, 3, X),
%%  Z = array:set(3, 4, Y),
%%
%%  AnotherArray = array:set(4, 5, Z),
%%  Xablau = array_add_items(5, 3, D, AnotherArray),
%%  io:fwrite("~w", [Xablau]).
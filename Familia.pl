%%Família, que é parente de quem?

pai(bill,thiago ).
pai(bill,victor ).
pai(bill,thelma ).
mae(neide,thiago).
mae(neide,thelma).
mae(neide,thais ).

pais :-
	pai(bill,X),
	mae(neide,X), nl,
	format("Bill e Neide sao os pais de ~w ~n~n", [X]).

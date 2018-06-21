pai(jose,fernando).
pai(jose,mauricio).
pai(marcos,nilton).
pai(joao,vitor).


irmao(X,Y) :-
	pai(Z,X),
	pai(Z,Y).

sequestra(dragao,princesa).
odeia(cavaleiro, X) :- sequestra(X, princesa).
ataca(cavaleiro, X) :- odeia(cavaleiro, X).

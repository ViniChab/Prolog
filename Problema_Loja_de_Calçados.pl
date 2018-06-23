%%Loja de Calçados - LMA 2018/1
%%Disponível em:
%%https://rachacuca.com.br/logica/problemas/loja-de-calcados/
%%Vinícius S. Chab, turma A.

%%Para rodar, entre "main." no console do SWI Prolog   
                      
%%O problema dá como nomes:
%%Cláudia, que eu substituí por : robocop
%%Denise, que eu substituí por : exterminador
%%Jennifer, que eu substituí por : rambo
%%Lígia, que eu substituí por : predador
%%Rebeca, que eu substituí por : norris       

%%NOMES ALTERADOS COM PEDIDO DO PROFESSOR

%%Um exemplo de entrada/saída do programa é:

%%?- main.
%%	----------------------Welcome----------------------
%%	Powered by: Vinicius S. Chab


%% 	CLIENTE 1:(verde,exterminador,sapatilha,35,23,contadora)

%% 	CLIENTE 2:(branco,norris,bota,34,25,nutricionista)

%% 	CLIENTE 3:(azul,robocop,tenis,37,20,enfermeira)

%% 	CLIENTE 4:(vermelho,rambo,salto,38,31,advogada)

%% 	CLIENTE 5:(amarelo,predador,sandalia,36,28,psiquiatra)

%% 	O tempo para a conclusao foi de:0.0 segundos.


%%	---------------------------------------------------
%%	true 

%%Adicionando biblioteca

:- set_prolog_flag(verbose,silent).
:- prompt(_, '').
:- use_module(library(readutil)).
 
cor(amarelo).
cor(azul).
cor(branco).
cor(verde).
cor(vermelho).
 
nome(robocop).
nome(exterminador).
nome(rambo).
nome(predador).
nome(norris).
 
calcado(bota).
calcado(salto).
calcado(sandalia).
calcado(sapatilha).
calcado(tenis).
 
numero(34).
numero(35).
numero(36).
numero(37).
numero(38).
 
idade(20).
idade(23).
idade(25).
idade(28).
idade(31).
 
profissao(advogada).
profissao(contadora).
profissao(enfermeira).
profissao(nutricionista).
profissao(psiquiatra).
 
% Definindo alldiferent 
alldifferent([]).
alldifferent([H|T]):- not(member(H,T)),
                      alldifferent(T).
 
start:- 

		 %%Aqui, preparo tudo para que todas as informações sejam 
		 %%printadas de forma legível. Isso inclui o tempo de 
		 %%execução, bem como a resposta para o problema.
		 
		 statistics(cputime, T0),
		 writeln("----------------------Welcome----------------------"),
		 writeln("Powered by: Vinicius S. Chab\n\n"),
	  	  clientes([C1, C2, C3, C4,C5]),
         writeln(" CLIENTE 1":C1),
         writeln("\n CLIENTE 2":C2),
         writeln("\n CLIENTE 3":C3),
         writeln("\n CLIENTE 4":C4),
         writeln("\n CLIENTE 5":C5),
		     statistics(cputime, T1),     
       	 Delta_tempo is T1 - T0,
      	 write("\n O tempo para a conclusao foi de":Delta_tempo),
      	 write(" segundos.\n\n\n"),
		     writeln("---------------------------------------------------"),
	       true.     
	     
	     %%Definindo...
          clientes([(COR1, NOME1, CALCADO1, NUMERO1, IDADE1, PROFISSAO1),
          (COR2, NOME2, CALCADO2, NUMERO2, IDADE2, PROFISSAO2),
          (COR3, NOME3, CALCADO3, NUMERO3, IDADE3, PROFISSAO3),
          (COR4, NOME4, CALCADO4, NUMERO4, IDADE4, PROFISSAO4),
          (COR5, NOME5, CALCADO5, NUMERO5, IDADE5, PROFISSAO5)]):-
         
		%%O número 1 fala que a Nutricionista está em algum lugar entre
		%%a cliente que calça 35 e a Enfermeira, nessa ordem.
		
		(
		(NUMERO1=35,PROFISSAO3=enfermeira,(PROFISSAO2=nutricionista));
		
		(NUMERO1=35,PROFISSAO4=enfermeira,		
		(PROFISSAO2=nutricionista;PROFISSAO3=nutricionista));
		
		(NUMERO1=35,PROFISSAO5=enfermeira,
		(PROFISSAO2=nutricionista;PROFISSAO3=nutricionista;PROFISSAO4=nutricionista));
		
		(NUMERO2=35,PROFISSAO4=enfermeira,(PROFISSAO3=nutricionista));
		
		(NUMERO2=35,PROFISSAO5=enfermeira,
		(PROFISSAO3=nutricionista;PROFISSAO4=nutricionista));
		
		(NUMERO3=35,PROFISSAO5=enfermeira,(PROFISSAO4=nutricionista))
		),
		
		%%O número 2 fala que a mulher mais velha está exatamente
		%%à direita de quem calça 37.
		
		(
		(NUMERO1=37,IDADE2=31);
		(NUMERO2=37,IDADE3=31);
		(NUMERO3=37,IDADE4=31);
		(NUMERO4=37,IDADE5=31)
		),
		
		%%O número 3 fala que Rebeca escolheu um calçado Branco.
		
		(
		(NOME1=norris,COR1=branco);
		(NOME2=norris,COR2=branco);
		(NOME3=norris,COR3=branco);
		(NOME4=norris,COR4=branco);
		(NOME5=norris,COR5=branco)
		),
		
		%%O número 4 fala que na quarta posição está quem escolheu
		%%um calçado Vermelho.
		
		COR4=vermelho,
		
		%%O número 5 fala que as mulheres que calçam 34 e 35 
		%%estão lado a lado.
		
		(
		(NUMERO1=34,NUMERO2=35);
		(NUMERO2=34,(NUMERO1=35;NUMERO3=35));
		(NUMERO3=34,(NUMERO2=35;NUMERO4=35));
		(NUMERO4=34,(NUMERO3=35;NUMERO5=35));
		(NUMERO5=34,NUMERO4=35)
		),
		
		%%O número 6 fala que Jennifer está em algum lugar entre 
		%%a cliente de 23 anos e a Lígia, nessa ordem.
		
		(
		(IDADE1=23,NOME3=predador,(NOME2=rambo));
		(IDADE1=23,NOME4=predador,(NOME2=rambo;NOME3=rambo));
		(IDADE1=23,NOME5=predador,(NOME2=rambo;NOME3=rambo;NOME4=rambo));
		(IDADE2=23,NOME4=predador,(NOME3=rambo));
		(IDADE2=23,NOME5=predador,(NOME3=rambo;NOME4=rambo));
		(IDADE3=23,NOME5=predador,(NOME4=rambo))
		),
		
		%%O número 7 fala que a Advogada está exatamente à 
		%%esquerda da mulher de 28 anos.
         
        (
        (PROFISSAO1=advogada,IDADE2=28);
        (PROFISSAO2=advogada,IDADE3=28);
        (PROFISSAO3=advogada,IDADE4=28);
        (PROFISSAO4=advogada,IDADE5=28)
        ),
         
        %%O número 8 fala que quem escolheu um calçado Azul está em 
        %%algum lugar à esquerda de quem escolheu uma Sandália.
        
        (
        (COR1=azul,(CALCADO2=sandalia;CALCADO3=sandalia;CALCADO4=sandalia;CALCADO5=sandalia));
        (COR2=azul,(CALCADO3=sandalia;CALCADO4=sandalia;CALCADO5=sandalia));
        (COR3=azul,(CALCADO4=sandalia;CALCADO5=sandalia));
        (COR4=azul,CALCADO5=sandalia)
        ),
        
        %%O número 9 fala que na quarta posição está a mulher 
        %%que escolheu o Salto.
         
        CALCADO4=salto,
         
        %%O número 10 fala que a cliente de 31 anos calça 38.
        
        (
        (IDADE1=31,NUMERO1=38);
        (IDADE2=31,NUMERO2=38);
        (IDADE3=31,NUMERO3=38);
        (IDADE4=31,NUMERO4=38);
        (IDADE5=31,NUMERO5=38)
        ),
        
        %%O número 11 fala que em uma das pontas está a 
        %%mulher de 28 anos.
         
        (IDADE1=28;IDADE5=28),
        
        %%O número 12 fala que a cliente mais nova está na 
        %%terceira posição.
         
        IDADE3=20,
        
        %%O número 13 fala que a cliente de 23 anos está ao lado 
        %%da mulher que escolheu uma Bota.
        
        (
        (IDADE1=23,CALCADO2=bota);
        (IDADE2=23,(CALCADO1=bota;CALCADO3=bota));
	    	(IDADE3=23,(CALCADO2=bota;CALCADO4=bota));
        (IDADE4=23,(CALCADO3=bota;CALCADO5=bota));
        (IDADE5=23,CALCADO4=bota)
        ),
         
        %%O número 14 fala que a Enfermeira está em algum lugar entre 
        %%quem escolheu a Sapatilha e a Psiquiatra, nessa ordem.
		
		(
		(CALCADO1=sapatilha,PROFISSAO3=psiquiatra,
		(PROFISSAO2=enfermeira));
		
		(CALCADO1=sapatilha,PROFISSAO4=psiquiatra,
		(PROFISSAO2=enfermeira;PROFISSAO3=enfermeira));
		
		(CALCADO1=sapatilha,PROFISSAO5=psiquiatra,
		(PROFISSAO2=enfermeira;PROFISSAO3=enfermeira;PROFISSAO4=enfermeira));
		
		(CALCADO2=sapatilha,PROFISSAO4=psiquiatra,
		(PROFISSAO3=enfermeira));
		
		(CALCADO2=sapatilha,PROFISSAO5=psiquiatra,
		(PROFISSAO3=enfermeira;PROFISSAO4=enfermeira));
		
		(CALCADO3=sapatilha,PROFISSAO5=psiquiatra,
		(PROFISSAO4=enfermeira))
		
		),
		
		%%O número 15 fala que Denise está na primeira posição.
		
		NOME1=exterminador,
		
		%%O número 16 fala que Jennifer está em algum lugar à 
		%%direita de quem escolheu um calçado Azul.
		
		(
		(COR1=azul,(NOME2=rambo;NOME3=rambo;NOME4=rambo;NOME5=rambo));
		(COR2=azul,(NOME3=rambo;NOME4=rambo;NOME5=rambo));
		(COR3=azul,(NOME4=rambo;NOME5=rambo));
		(COR4=azul,NOME5=rambo)
		),
		
		%%O número 17 fala que a cliente de 31 anos está exatamente 
		%%à esquerda de quem escolheu um calçado Amarelo.
		
		(
		(COR2=amarelo,IDADE1=31);
		(COR3=amarelo,IDADE2=31);
		(COR4=amarelo,IDADE3=31);
		(COR5=amarelo,IDADE4=31)
		),
		
		%%O número 18 fala que a mulher de 25 anos está em algum lugar 
		%%entre a mulher que calça 35 e quem escolheu um Tênis, nessa ordem.
		
		(
		(NUMERO1=35,CALCADO3=tenis,(IDADE2=25));
		(NUMERO1=35,CALCADO4=tenis,(IDADE2=25;IDADE3=25));
		(NUMERO1=35,CALCADO5=tenis,(IDADE2=25;IDADE3=25;IDADE4=25));
		(NUMERO2=35,CALCADO4=tenis,(IDADE3=25));
		(NUMERO2=35,CALCADO5=tenis,(IDADE3=25;IDADE4=25));
		(NUMERO3=35,CALCADO5=tenis,(IDADE4=25))
		),
		
		%%O número 19 fala que a cliente que escolheu um calçado Branco
		%%está exatamente à esquerda de quem escolheu um calçado Azul.
		
		(
		(COR1=branco,COR2=azul);
		(COR2=branco,COR3=azul);
		(COR3=branco,COR4=azul);
		(COR4=branco,COR5=azul)
		),
		
		%%O número 20 fala que Cláudia escolheu um Tênis.
		
		(
		(NOME1=robocop,CALCADO1=tenis);
		(NOME2=robocop,CALCADO2=tenis);
		(NOME3=robocop,CALCADO3=tenis);
		(NOME4=robocop,CALCADO4=tenis);
		(NOME5=robocop,CALCADO5=tenis)
		),
		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%unificando: NOME
 
  nome(NOME1), nome(NOME2), nome(NOME3),
  nome(NOME4), nome(NOME5), 
  alldifferent([NOME1, NOME2, NOME3, NOME4, NOME5]),
 
	%%unificando: COR
 
	cor(COR1), cor(COR2), cor(COR3), cor(COR4), cor(COR5), 
	alldifferent([COR1, COR2, COR3, COR4, COR5]),
	 
	%%unificando: CALCADO
 
	calcado(CALCADO1), calcado(CALCADO2), calcado(CALCADO3), 
	calcado(CALCADO4), calcado(CALCADO5), 
	alldifferent([CALCADO1, CALCADO2, CALCADO3, CALCADO4, CALCADO5]),
	 
	%%unificando: NUMERO
 
	numero(NUMERO1), numero(NUMERO2), numero(NUMERO3), numero(NUMERO4), 
	numero(NUMERO5), 
	alldifferent([NUMERO1, NUMERO2, NUMERO3, NUMERO4, NUMERO5]),
	
	%%unificando: PROFISSAO
 
	profissao(PROFISSAO1), profissao(PROFISSAO2), profissao(PROFISSAO3),
	profissao(PROFISSAO4), profissao(PROFISSAO5), 
	alldifferent([PROFISSAO1, PROFISSAO2, PROFISSAO3, PROFISSAO4, PROFISSAO5]),	 
	
 	%%unificando: IDADE
 
	idade(IDADE1), idade(IDADE2), idade(IDADE3), idade(IDADE4), 
	idade(IDADE5), 
	alldifferent([IDADE1, IDADE2, IDADE3, IDADE4, IDADE5]),
	
	true.
 
main:-
	start.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%FIM

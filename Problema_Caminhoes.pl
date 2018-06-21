%%Caminhões no Porto - LMA 2018/1
%%Vinícius S. Chab


%%O problema dá como motoristas:
%%Antônio, que eu substituí por : vinicius
%%Bino, que eu substituí por : joao
%%Jorge, que eu substituí por : limao
%%Pedro, que eu substituí por : carol
%%Stênio, que eu substituí por : leo       
                      
main :-
	statistics(cputime, T0),
	caminhao([CAMINHAO1, CAMINHAO2, CAMINHAO3, CAMINHAO4, CAMINHAO5]),
	format("\n CAMINHAO 1 : ~w", CAMINHAO1),
	format("\n CAMINHAO 2 : ~w", CAMINHAO2),
	format("\n CAMINHAO 3 : ~w", CAMINHAO3),
	format("\n CAMINHAO 4 : ~w", CAMINHAO4),
	format("\n CAMINHAO 5 : ~w", CAMINHAO5),
	statistics(cputime, T1),
	TEMPO_TOTAL is T1 - T0,
	format("\nO tempo total para a execucao foi de: ~10f", TEMPO_TOTAL),
	fail.

caminhao([(COR1, MOTORISTA1, DESTINO1, CARGA1, PLACA1, KM1),
		 (COR2, MOTORISTA2, DESTINO2, CARGA2, PLACA2, KM2),
		 (COR3, MOTORISTA3, DESTINO3, CARGA3, PLACA3, KM3),
		 (COR4, MOTORISTA4, DESTINO4, CARGA4, PLACA4, KM4),
		 (COR5, MOTORISTA5, DESTINO5, CARGA5, PLACA5, KM5)]):-
		  
	%%Vamos lidar com os motoristas
	
	motorista(MOTORISTA1), motorista(MOTORISTA2), motorista(MOTORISTA3),
	motorista(MOTORISTA4), motorista(MOTORISTA5), 
	alldifferent([MOTORISTA1, MOTORISTA2, MOTORISTA3, MOTORISTA4, MOTORISTA5]),

	%%O número 1 fala que Jorge é o motorista do caminhão de placa DDD-4444.
(
(MOTORISTA1==limao,PLACA1=="DDD-4444");
(MOTORISTA2==limao,PLACA2=="DDD-4444");
(MOTORISTA3==limao,PLACA3=="DDD-4444");
(MOTORISTA4==limao,PLACA4=="DDD-4444");
(MOTORISTA5==limao,PLACA5=="DDD-4444")
),
	
	%%O número 15 fala que Stênio está dirigindo para Minas Gerais.
	
(
(MOTORISTA1==leo,DESTINO1==minas_gerais);
(MOTORISTA2==leo,DESTINO2==minas_gerais);
(MOTORISTA3==leo,DESTINO3==minas_gerais);
(MOTORISTA4==leo,DESTINO4==minas_gerais);
(MOTORISTA5==leo,DESTINO5==minas_gerais)
),
	
	%%O 19 fala que Antônio é o motorista do caminhão de placa EEE-5555.
	
(
(MOTORISTA1==vinicius,PLACA1=="EEE-5555");
(MOTORISTA2==vinicius,PLACA2=="EEE-5555");
(MOTORISTA3==vinicius,PLACA3=="EEE-5555");
(MOTORISTA4==vinicius,PLACA4=="EEE-5555");
(MOTORISTA5==vinicius,PLACA5=="EEE-5555")
),
	
	%%O número 21 fala que Pedro está ao lado do caminhão que vai para 
	%%o Mato Grosso.
	
(
(MOTORISTA1==carol,DESTINO2==mato_grosso);
(MOTORISTA2==carol,(DESTINO1==mato_grosso;DESTINO3==mato_grosso));
(MOTORISTA3==carol,(DESTINO2==mato_grosso;DESTINO4==mato_grosso));
(MOTORISTA4==carol,(DESTINO3==mato_grosso;DESTINO5==mato_grosso));
(MOTORISTA5==carol,DESTINO4==mato_grosso)
),
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%Vamos lidar com as cores 
	
cor(COR1), cor(COR2), cor(COR3), cor(COR4), cor(COR5), 
alldifferent([COR1, COR2, COR3, COR4, COR5]),
	
	%%O número 4 diz que o caminhão Vermelho está em algum lugar à esquerda 
	%%do caminhão que vai para o Amazonas.
	
(
(COR1==vermelho,(DESTINO2==amazonas;DESTINO3==amazonas;DESTINO4==amazonas;DESTINO5==amazonas));
(COR2==vermelho,(DESTINO3==amazonas;DESTINO4==amazonas;DESTINO5==amazonas));
(COR3==vermelho,(DESTINO4==amazonas;DESTINO5==amazonas));
(COR4==vermelho,DESTINO5==amazonas)
),
	
	%%O número 6 fala que o caminhão Vermelho está em algum lugar entre o 
	%%caminhão que está carregando Enxofre e o caminhão Azul, nessa ordem.
	
(
(CARGA1==enxofre,COR3==azul,(COR2==vermelho));
(CARGA1==enxofre,COR4==azul,(COR2==vermelho;COR3==vermelho));
(CARGA1==enxofre,COR5==azul,(COR2==vermelho;COR3==vermelho;COR4==vermelho));
(CARGA2==enxofre,COR4==azul,(COR3==vermelho));
(CARGA2==enxofre,COR5==azul,(COR3==vermelho;COR4==vermelho));
(CARGA3==enxofre,COR5==azul,(COR4==vermelho))
),
	
	%%O número 10 fala que o caminhão Branco está em algum lugar à direita do caminhão Verde.
	
(
(COR1==verde,(COR2==branco;COR3==branco;COR4==branco;COR5==branco));
(COR2==verde,(COR3==branco;COR4==branco;COR5==branco));
(COR3==verde,(COR4==branco;COR5==branco));
(COR4==verde,COR5==branco)
),
	
	%%O número 13 fala que o caminhão Amarelo está exatamente à esquerda do 
	%%caminhão que tem 200 mil Km rodados.
	
(
(COR1==amarelo,KM2==200);
(COR2==amarelo,KM3==200);
(COR3==amarelo,KM4==200);
(COR4==amarelo,KM5==200)
),
	
	%%O número 17 fala que o veículo Azul está em algum lugar à direita do 
	%%veículo de placa AAA-1111.
	
(
(PLACA1=="AAA-1111",(COR2==azul;COR3==azul;COR4==azul;COR5==azul));
(PLACA2=="AAA-1111",(COR3==azul;COR4==azul;COR5==azul));
(PLACA3=="AAA-1111",(COR4==azul;COR5==azul));
(PLACA4=="AAA-1111",COR5==azul)
),
	
	%%O número 20 fala que o caminhão Azul está em algum lugar à 
	%%esquerda do caminhão Branco.
	
(
(COR5==branco,(COR4==azul;COR3==azul;COR2==azul;COR1==azul));
(COR4==branco,(COR3==azul;COR2==azul;COR1==azul));
(COR3==branco,(COR2==azul;COR1==azul));
(COR2==branco,COR1==azul)
),
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%Vamos lidar com os destinos

	
destino(DESTINO1), destino(DESTINO2), destino(DESTINO3), 
destino(DESTINO4), destino(DESTINO5), 
alldifferent([DESTINO1, DESTINO2, DESTINO3, DESTINO4, DESTINO5]),
	
	%%O número 2 fala que na quarta posição está o caminhão que vai 
	%%para Belo Horizonte.
	%%LEMBRANDO que Belo Horizonte fica em Minas Gerais.
	
DESTINO4==minas_gerais,
	
	%%O número 5 fala que o veículo que vai para a região Centro-oeste
	%% está ao lado do caminhão que já rodou 100 mil Km.
	%%LEMBRANDO que o Mato Grosso fica no centro-oeste.
	
(
(DESTINO1==mato_grosso,KM2==100);
(DESTINO2==mato_grosso,(KM1==100;KM3==100));
(DESTINO3==mato_grosso,(KM2==100;KM4==100));
(DESTINO4==mato_grosso,(KM3==100;KM5==100));
(DESTINO5==mato_grosso,KM4==100)
),
	
	%%O número 12 fala que quem vai para a região Nordeste está em 
	%%algum lugar à direita do caminhão Vermelho.
	%%LEMBRANDO que a Bahia fica no nordeste.
	
(
(DESTINO2==bahia,COR1==vermelho);
(DESTINO3==bahia,(COR1==vermelho;COR2==vermelho));
(DESTINO4==bahia,(COR1==vermelho;COR2==vermelho;COR3==vermelho));
(DESTINO5==bahia,(COR1==vermelho;COR2==vermelho;COR3==vermelho;COR4==vermelho))
),

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%Vamos lidar com as cargas
	
carga(CARGA1), carga(CARGA2), carga(CARGA3), carga(CARGA4), 
carga(CARGA5), 
alldifferent([CARGA1, CARGA2, CARGA3, CARGA4, CARGA5]),
	
	%%O número 9 fala que o caminhão de placa DDD-4444 está transportando Soda cáustica.
	
(
(PLACA1=="DDD-4444",CARGA1==soda_caustica);
(PLACA2=="DDD-4444",CARGA2==soda_caustica);
(PLACA3=="DDD-4444",CARGA3==soda_caustica);
(PLACA4=="DDD-4444",CARGA4==soda_caustica);
(PLACA5=="DDD-4444",CARGA5==soda_caustica)
),
	
	%%O número 16 fala que o caminhão com Adubo está em algum lugar entre o caminhão
	%%que vai para Bahia e o caminhão com Carvão, nessa ordem.
	
(
(DESTINO1==bahia,CARGA3==carvao,(CARGA2==adubo));
(DESTINO1==bahia,CARGA4==carvao,(CARGA2==adubo;CARGA3==adubo));
(DESTINO1==bahia,CARGA5==carvao,(CARGA2==adubo;CARGA3==adubo;CARGA4==adubo));
(DESTINO2==bahia,CARGA4==carvao,(CARGA3==adubo));
(DESTINO2==bahia,CARGA5==carvao,(CARGA3==adubo;CARGA4==adubo));
(DESTINO3==bahia,CARGA5==carvao,(CARGA4==adubo))
),

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%Vamos lidar com as placas
	
placa(PLACA1), placa(PLACA2), placa(PLACA3), placa(PLACA4), 
placa(PLACA5), 
	
alldifferent([PLACA1, PLACA2, PLACA3, PLACA4, PLACA5]),
	
	%%O número 8 fala que em uma das pontas está o caminhão de placa AAA-1111.
	
(PLACA1=="AAA-1111";PLACA5=="AAA-1111"),
	
	%%O número 11 fala que o veículo de placa BBB-2222 está ao lado
	%%do veículo mais rodado.
	
(
(PLACA1=="BBB-2222",KM2==250);
(PLACA2=="BBB-2222",(KM1==250;KM3==250));
(PLACA3=="BBB-2222",(KM2==250;KM4==250));
(PLACA4=="BBB-2222",(KM3==250;KM5==250));
(PLACA5=="BBB-2222",KM4==250)
),

	%%O número 14 fala que o veículo de placa CCC-3333 está exatamente
	%%à direita do veículo de placa DDD-4444.
	
(
(PLACA1=="DDD-4444",PLACA2=="CCC-3333");
(PLACA2=="DDD-4444",PLACA3=="CCC-3333");
(PLACA3=="DDD-4444",PLACA4=="CCC-3333");
(PLACA4=="DDD-4444",PLACA5=="CCC-3333")
),
	
	%%O número 18 fala que o caminhão de placa DDD-4444 está ao lado do
	%%caminhão que já rodou 100 mil Km.
	
(
(PLACA1=="DDD-4444",KM2==100);
(PLACA2=="DDD-4444",(KM1==100;KM3==100));
(PLACA3=="DDD-4444",(KM2==100;KM4==100));
(PLACA4=="DDD-4444",(KM3==100;KM5==100));
(PLACA5=="DDD-4444",KM4==100)
),
	
	%%O número 22 fala que em uma das pontas está o caminhão de placa EEE-5555.
	
(PLACA1=="EEE-5555";PLACA5=="EEE-5555"),
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	%%Vamos lidar com as quilometragens
	
km(KM1), km(KM2), km(KM3), km(KM4), km(KM5), 
	
alldifferent([KM1, KM2, KM3, KM4, KM5]),
	
	%%O número 3 diz que o caminhão menos rodado está transportando Carvão.
	
(
(KM1==50,CARGA1==carvao);
(KM2==50,CARGA2==carvao);
(KM3==50,CARGA3==carvao);
(KM4==50,CARGA4==carvao);
(KM5==50,CARGA5==carvao)
),
	
	%%O número 7 diz que na primeira posição está o caminhão que 
	%%tem 150 mil Km rodados.
	
KM1==150.
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Adicionando biblioteca

cor(amarelo).
cor(azul).
cor(branco).
cor(verde).
cor(vermelho).

motorista(vinicius).
motorista(joao).
motorista(limao).
motorista(carol).
motorista(leo).

destino(amazonas).
destino(bahia).
destino(mato_grosso).
destino(minas_gerais).
destino(parana).

carga(adubo).
carga(carvao).
carga(enxofre).
carga(soda_caustica).
carga(trigo).

placa("AAA-1111").
placa("BBB-2222").
placa("CCC-3333").
placa("DDD-4444").
placa("EEE-5555").

km(50).
km(100).
km(150).
km(200).
km(250).

%% Definindo alldiferent 

alldifferent([]).
alldifferent([H|T]):- 
	not(member(H,T)).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

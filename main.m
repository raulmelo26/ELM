
clc; clear;

%  dados = load('C:\Users\Raul Melo\Documents\ELM\dataIris.dat');
% dados = load('C:\Users\Raul Melo\Documents\ELM\coluna_vertebral.dat');
 dados = load('C:\Users\Raul Melo\Documents\ELM\dermatologia.dat');

numRealizacoes = 2;
esc = 1;
numAtributos = 34;                   % Iris 4, coluna 6, derm 34
numNeuroniosOcultos = 10;
numNeuronioSaida = 6;                % Iris 3, coluna 3, derm 6
offset = 0.5;
numPadroes = size(dados,1);

numNeuronioInicial = 2;
numNeuronioFinal = 18;
incNeuronios = 1;
deltaNeuronio = numNeuronioInicial:incNeuronios:numNeuronioFinal;

dados = [normaliza(dados(:,1:numAtributos)) dados(:,numAtributos+1:numAtributos+numNeuronioSaida)];


for i = 1:numRealizacoes

    dados = dados(randperm(numPadroes),:);
% 
    [X_treino, Y_treino, X_teste, Y_teste] = separaDados(dados, numAtributos, numNeuronioSaida, 0.8);
    dadosTreino = [X_treino Y_treino];
%     
%     [dadosTreino,dadosTeste] = separaDados(dados,0.8);
%     X_treino = dadosTreino(:,1:4);
%     Y_treino = dadosTreino(:,5:7);
%     X_teste  = dadosTeste(:,1:4);
%     Y_teste  = dadosTeste(:,5:7);
  
    
    [numNeuroniosOcultos] = melhoresParametros(deltaNeuronio, dadosTreino, numAtributos, numNeuronioSaida, esc);

    W1 = rand(numNeuroniosOcultos,(numAtributos+1))-0.5;
    W2 = rand(numNeuronioSaida,(numNeuroniosOcultos+1))-0.5;

    [H, Y] = sentidoDireto(W1,W2,X_treino, 1);
%   W = X\D é  a solução de XW = D
    M = (H\Y_treino)';

    [H, Y] = sentidoDireto(W1,M,X_teste, 1);

    acc(i) = teste(Y, Y_teste);


end

media_acuracia = mean(acc)
desvioPadrao = std(acc)






clc; clear;

numRealizacoes = 1;
esc = 2;
numAtributos = 1;
numNeuroniosOcultos = 10;
numNeuronioSaida = 1;
offset = 0.5;

numNeuronioInicial = 2;
numNeuronioFinal = 18;
incNeuronios = 1;
deltaNeuronio = numNeuronioInicial:incNeuronios:numNeuronioFinal;

% GERA DADOS 2D

x = linspace(0,10,200);
y = sin(x) + rand(size(x))-offset;
    
dados = [x' y' sin(x)'];
dados = [normaliza(dados)];
    
    
figure(1);
scatter(dados(:,1), dados(:,3),'.b');
hold on;
scatter(dados(:,1), (dados(:,2)), '.r');
hold on;
dados = dados(:,1:2);

numPadroes = size(dados,1);

for i = 1:numRealizacoes

    dados = dados(randperm(numPadroes),:);

    [X_treino, Y_treino, X_teste, Y_teste] = separaDados(dados, numAtributos, numNeuronioSaida, 0.8);
    dadosTreino = [X_treino Y_treino];
    [numNeuroniosOcultos] = melhoresParametros(deltaNeuronio, dadosTreino, numAtributos, numNeuronioSaida, esc);
    
    W1 = rand(numNeuroniosOcultos,(numAtributos+1))-0.5;
    W2 = rand(numNeuronioSaida,(numNeuroniosOcultos+1))-0.5;

    [H, Y] = sentidoDireto(W1,W2,X_treino, 2);

    M = (H\Y_treino)';
%   TESTE DA REDE
    [H, Y] = sentidoDireto(W1,M,X_teste, 2);
    MSE(i) = mean((Y - Y_teste).^2);
    
    [o, pontos] = sentidoDireto(W1,M,dados(:,1), 2);
    scatter(dados(:,1), pontos, '.black');
    title('ELM REGRESSÃO');
    legend('sin(x)', 'ruidos','função aproximada');

end

media_MSE = mean(MSE)
desvioPadrao = std(MSE)






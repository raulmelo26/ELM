function [numNeuronioEscolhido] = melhoresParametros(deltaNeuronio, dadosTreino,numNeuroniosEntrada,numNeuroniosSaida,esc)
    [k1 k2 k3 k4 k5] = divide_dados_treino(dadosTreino);
    acuracia = 0 ;
    media_acc_mse = 0;
    numNeuronioEscolhido = 0;
    grade = 0;
    for i=1 : size(deltaNeuronio,2)
        taxa_acumulada=0;
        for parte=1:5
            
            if parte == 1
                kValidacao = k1;
                dadosTreino = [k2;k3;k4;k5];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
                W1 = rand(deltaNeuronio(i),(numNeuroniosEntrada+1))-0.5;
                W2 = rand(numNeuroniosSaida,(deltaNeuronio(i)+1))-0.5;

                [H, Y] = sentidoDireto(W1,W2,atributosTreino, esc);
                
                M = (H\rotulosTreino)';
                
                [H, Y] = sentidoDireto(W1,M,atributosValidacao, esc);
                
               if(esc == 1)
                    acc(parte) = teste(Y, rotulosValidacao);
                else
                    [H, Y] = sentidoDireto(W1,M,atributosValidacao, 2);
                    acc(parte) = mean((Y - rotulosValidacao).^2);
                end
               
            end
            if parte == 2
                kValidacao = k2;
                dadosTreino = [k1;k3;k4;k5];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
                W1 = rand(deltaNeuronio(i),(numNeuroniosEntrada+1))-0.5;
                W2 = rand(numNeuroniosSaida,(deltaNeuronio(i)+1))-0.5;

                [H, Y] = sentidoDireto(W1,W2,atributosTreino, esc);
                
                M = (H\rotulosTreino)';
                
                [H, Y] = sentidoDireto(W1,M,atributosValidacao, esc);

                 if(esc == 1)
                    acc(parte) = teste(Y, rotulosValidacao);
                else
                    [H, Y] = sentidoDireto(W1,M,atributosValidacao, 2);
                    acc(parte) = mean((Y - rotulosValidacao).^2);
                end
                
            end
            if parte == 3
                kValidacao = k3;
                dadosTreino = [k1;k2;k4;k5];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
                W1 = rand(deltaNeuronio(i),(numNeuroniosEntrada+1))-0.5;
                W2 = rand(numNeuroniosSaida,(deltaNeuronio(i)+1))-0.5;

                [H, Y] = sentidoDireto(W1,W2,atributosTreino, esc);
                
                M = (H\rotulosTreino)';
                
                [H, Y] = sentidoDireto(W1,M,atributosValidacao, esc);
                if(esc == 1)
                    acc(parte) = teste(Y, rotulosValidacao);
                else
                    [H, Y] = sentidoDireto(W1,M,atributosValidacao, 2);
                    acc(parte) = mean((Y - rotulosValidacao).^2);
                end
                
                
            end
            if parte == 4
                kValidacao = k4;
                dadosTreino = [k1;k2;k3;k5];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
                W1 = rand(deltaNeuronio(i),(numNeuroniosEntrada+1))-0.5;
                W2 = rand(numNeuroniosSaida,(deltaNeuronio(i)+1))-0.5;

                [H, Y] = sentidoDireto(W1,W2,atributosTreino, esc);
                
                M = (H\rotulosTreino)';
                
                [H, Y] = sentidoDireto(W1,M,atributosValidacao, esc);

                if(esc == 1)
                    acc(parte) = teste(Y, rotulosValidacao);
                else
                    [H, Y] = sentidoDireto(W1,M,atributosValidacao, 2);
                    acc(parte) = mean((Y - rotulosValidacao).^2);
                end
               
                
            end
            if parte == 5
                kValidacao = k5;
                dadosTreino = [k1;k2;k3;k4];
                
                atributosTreino = dadosTreino(:,1:numNeuroniosEntrada);
                rotulosTreino = dadosTreino(:,numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
                
                atributosValidacao = kValidacao(:,1:numNeuroniosEntrada);
                rotulosValidacao = kValidacao(:, numNeuroniosEntrada+1:numNeuroniosEntrada+numNeuroniosSaida);
    
                W1 = rand(deltaNeuronio(i),(numNeuroniosEntrada+1))-0.5;
                W2 = rand(numNeuroniosSaida,(deltaNeuronio(i)+1))-0.5;

                [H, Y] = sentidoDireto(W1,W2,atributosTreino, esc);
                
                M = (H\rotulosTreino)';
                
                [H, Y] = sentidoDireto(W1,M,atributosValidacao, esc);

                if(esc == 1)
                    acc(parte) = teste(Y, rotulosValidacao);
                else
                    [H, Y] = sentidoDireto(W1,M,atributosValidacao, 2);
                    acc(parte) = mean((Y - rotulosValidacao).^2);
                end
                
            end
        end
        media_acc_mse(i) = sum(acc)/5;
        deltaNeuronio(i);
    end
    if(esc == 1)
          [~,k] = max(media_acc_mse);
          grade = [deltaNeuronio' media_acc_mse']
          numNeuronioEscolhido = grade(k,1);
    else
          [~,k] = min(media_acc_mse);
          grade = [deltaNeuronio' media_acc_mse']
          numNeuronioEscolhido = grade(k,1);
    end
    
end




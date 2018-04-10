function [ padroes2, h ] = sentidoDireto( W1, W2, dados, esc )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    m = size(dados,1);
    
    padroes1 = [ones(m,1) dados];
 
    Us1 = padroes1*W1';
    padroes2 = [ones(size(Us1,1),1) logsig(Us1)];
    Us2 = padroes2*W2';
    if (esc == 1)
        Y_atual = logsig(Us2);
        h = Y_atual;
    else
        Y_atual = Us2;
        h = Y_atual;
    end
end


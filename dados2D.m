function [ dados ] = dados2D(  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    x = linspace(0,10,200);
    y = sin(x) + rand(size(x))-0.5;
    
    dados = [x' y' sin(x)'];
    dados = [normaliza(dados)];
    
    
    figure(1);
    scatter(dados(:,1), dados(:,3),'.b');
    hold on;
    scatter(dados(:,1), (dados(:,2)), '.r');
    hold on;
    dados = dados(:,1:2);
end


function [ count ] = teste( Y, Y_teste )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    count = 0;
    numPadroes = size(Y_teste, 1);

    for i = 1 : numPadroes
        Y(i,:) = binariza(Y(i,:)')';
        count = count + isequal(Y(i,:), Y_teste(i,:)); 
    end
    count = 100*(count/size(Y_teste,1));

end


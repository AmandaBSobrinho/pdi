function A = abertura(original,estr)    
    %eros�o
    E = erosao(original,estr);
    
    %dilatac�o
    D = dilatacao(E,estr);
       
    % fechamento
    A = D;
end
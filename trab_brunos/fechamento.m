function F = fechamento(original,estr)    
    %dilatac�o
    D = dilatacao(original,estr);
    
    %eros�o
    E = erosao(D,estr);
    
    % fechamento
    F = E;
end
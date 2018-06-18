function F = fechamento(original,estr)    
    %dilatacão
    D = dilatacao(original,estr);
    
    %erosão
    E = erosao(D,estr);
    
    % fechamento
    F = E;
end
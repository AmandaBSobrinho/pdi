function A = abertura(original,estr)    
    %erosão
    E = erosao(original,estr);
    
    %dilatacão
    D = dilatacao(E,estr);
       
    % fechamento
    A = D;
end
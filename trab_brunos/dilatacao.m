function D = dilatacao(original,estr)
% Colocar padding de 0's em todos os lados
originalPad = padarray(original,[1 1],1);
% Inicializar a matriz D de tamanho igual ao da original com zeros
saida = ones(size(originalPad));

for i = 1:size(originalPad,1)-2 % tem que andar at� size(originalPad,1)-2 porque o elemento estruturante � 3x3
    for j = 1:size(originalPad,2)-2
        % Verifica se os elementos no trecho s�o 1 nas mesmas posi��es 
        % do elemento estruturante
        if(originalPad(i,j) == 0)
            for r = 1:size(estr,2)
                for s = 1:size(estr,2)
                    if(estr(r,s) == 1)
                        saida(i+r-1,j+s-1) = 0; % se s�o, coloca 1 na matriz D
                    end
                end
            end
        end
    end
end

D = saida;
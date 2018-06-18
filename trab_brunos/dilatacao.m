function E = dilatacao(original,estr)
% Colocar padding de 0's em todos os lados
originalPad = padarray(original,[1 1],1);
% Inicializar a matriz D de tamanho igual ao da original com zeros
saida = ones(size(originalPad));

for i = 1:size(originalPad,1)-2 % tem que andar até size(originalPad,1)-2 porque o elemento estruturante é 3x3
    for j = 1:size(originalPad,2)-2
        % Verifica se os elementos no trecho são 1 nas mesmas posições 
        % do elemento estruturante
        if(originalPad(i,j) == 0)
            for r = 1:size(estr,2)
                for s = 1:size(estr,2)
                    if(estr(r,s) == 1)
                        saida(i+r-1,j+s-1) = 0; % se são, coloca 1 na matriz D
                    end
                end
            end
        end
    end
end

E = saida;
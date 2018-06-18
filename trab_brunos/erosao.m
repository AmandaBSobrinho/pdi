function E = erosao(original,estr)
%Colocar padding de 1's em todos os lados
originalPad = padarray(original,[1 1],1);
% Inicializar a matriz D de tamanho igual ao da original com zeros
saida = ones(size(original));

for i = 1:size(originalPad,1)-2 % tem que andar até size(originalPad,1)-2 porque o elemento estruturante é 3x3
    for j = 1:size(originalPad,2)-2
        % Pega trechos 3x3 da matriz original
        trecho = originalPad(i:i+2,j:j+2);
        % Encontra os 1's no elemento estruturante
        estr1 = find(estr == 1);
        % Verifica se os elementos no trecho são 1 nas mesmas posições 
        % do elemento estruturante
        if(trecho(estr1) == 0)
            saida(i,j) = 0; % se são, coloca 1 na matriz D
        end
    end
end

E = saida;
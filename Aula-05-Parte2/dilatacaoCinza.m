function E = dilatacaoCinza(original,estr)
% Colocar padding de 0's em todos os lados
originalPad = padarray(original,[1 1]);
% Inicializar a matriz D de tamanho igual ao da original com zeros
saida = zeros(size(original));

for i = 1:size(originalPad,1)-2 % tem que andar até size(originalPad,1)-2 porque o elemento estruturante é 3x3
    for j = 1:size(originalPad,2)-2
        % Faz a operação de máximo
        saida(i,j) = max(max(uint8(originalPad(i:i+2,j:j+2) + estr)));
    end
end

E = saida;
function E = erosaoCinza(original,estr)
%Colocar padding de 255 em todos os lados
originalPad = padarray(original,[1 1],255);
% Inicializar a matriz D de tamanho igual ao da original com zeros
saida = zeros(size(original));

for i = 1:size(originalPad,1)-2 % tem que andar até size(originalPad,1)-2 porque o elemento estruturante é 3x3
    for j = 1:size(originalPad,2)-2
        % Faz a operação de mínimo
        saida(i,j) = min(min(uint8(originalPad(i:i+2,j:j+2) - estr)));
    end
end

E = saida;
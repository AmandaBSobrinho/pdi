function E = dilatacao(original,estr)
% Colocar padding de 0's em todos os lados
originalPad = padarray(original,[1 1]);
% Inicializar a matriz D de tamanho igual ao da original com zeros
saida = zeros(size(original));

for i = 1:size(originalPad,1)-2 % tem que andar até size(originalPad,1)-2 porque o elemento estruturante é 3x3
    for j = 1:size(originalPad,2)-2
        % Faz a operação AND
        saida(i,j) = sum(sum(estr & originalPad(i:i+2,j:j+2)));
        % Primeiro soma todas as colunas da matriz resultante de estr &
        % originalPad; isso resulta em um vetor, cujos elementos são
        % somados um a um, resultando em um único valor (0 ou 1).
        % Este valor é atribuído a saida(i,j)
    end
end

E = saida;
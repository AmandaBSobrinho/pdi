imagem=imread('Img3.bmp');
figure, imshow(imagem);
title('Imagem original');

imagem = rgb2gray(imagem);
imagem = imbinarize(imagem);
figure, imshow(imagem);
title('Imagem bin�ria');

% Elemento Estruturante
B = ones(13); % quadrado de 1's com lado 13

% Eros�o

originalPad = padarray(imagem,[1 1],1);
% Inicializar a matriz saida de tamanho igual ao da imagem original com zeros
saida1 = zeros(size(imagem));

for i = 1:size(originalPad,1)-12 % tem que andar at� size(originalPad,1)-12 porque o elemento estruturante � 13x13
    for j = 1:size(originalPad,2)-12
        % Pega trechos 13x13 da matriz original
        trecho = originalPad(i:i+12,j:j+12);
        % Encontra os 1's no elemento estruturante
        estr1 = find(B == 1);
        % Verifica se os elementos no trecho s�o 1 nas mesmas posi��es 
        % do elemento estruturante
        if(trecho(estr1) == 1)
            saida1(i,j) = 1; % se s�o, coloca 1 na matriz de saida
        end
    end
end

figure, imshow(saida1);
title('Resultado da Eros�o');

% Dilata��o - entrada � saida1

% Colocar padding de 0's em todos os lados
originalPad2 = padarray(saida1,[1 1]);
% Inicializar a matriz saida de tamanho igual ao da original com zeros
saida = zeros(size(saida1));

for i = 1:size(originalPad2,1)-12 % tem que andar at� size(originalPad,1)-12 porque o elemento estruturante � 13x13
    for j = 1:size(originalPad2,2)-12
        % Faz a opera��o AND
        saida(i,j) = sum(sum(B & originalPad2(i:i+12,j:j+12)));
        % Primeiro soma todas as colunas da matriz resultante de estr &
        % originalPad; isso resulta em um vetor, cujos elementos s�o
        % somados um a um, resultando em um �nico valor (0 ou 1).
        % Este valor � atribu�do a saida(i,j)
    end
end

figure, imshow(saida);
title('Resultado da Dilata��o');
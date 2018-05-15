imagem=imread('Img4.bmp');
figure, imshow(imagem);
title('Imagem original');

imagem = rgb2gray(imagem);
[m,n] = size(imagem);
imagem1 = zeros(m,n);

% Limiariza��o
for i=1:m
    for j=1:n
        if imagem(i,j) <= 220
            imagem1(i,j) = 1;
        else
            imagem1(i,j) = 0;
        end
    end
end

figure, imshow(imagem1);
title('Limiariza��o');

% Elemento Estruturante
B = ones(7);

% Eros�o

originalPad = padarray(imagem1,[1 1],1);
% Inicializar a matriz saida de tamanho igual ao da imagem original com zeros
saida1 = zeros(size(imagem1));

for i = 1:size(originalPad,1)-6
    for j = 1:size(originalPad,2)-6
        % Pega trechos da matriz original
        trecho = originalPad(i:i+6,j:j+6);
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

for i = 1:size(originalPad2,1)-6
    for j = 1:size(originalPad2,2)-6
        % Faz a opera��o AND
        saida(i,j) = sum(sum(B & originalPad2(i:i+6,j:j+6)));
    end
end

figure, imshow(saida);
title('Resultado da Dilata��o');
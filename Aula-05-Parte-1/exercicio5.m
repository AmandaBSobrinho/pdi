imagem=imread('Img2.bmp');
figure, imshow(imagem);
title('Imagem original');

imagem = rgb2gray(imagem);
imagem = imbinarize(imagem);
figure, imshow(imagem);
title('Imagem binária');

% ==== Abertura ====

% Elemento Estruturante
B1 = [1 1];

% Erosão
originalPad = padarray(imagem,[0 1],1);
% Inicializar a matriz saida de tamanho igual ao da imagem original com zeros
saida1 = zeros(size(imagem));

for i = 1:size(originalPad,1)
    for j = 1:size(originalPad,2)-1
        % Pega trechos da matriz original
        trecho = originalPad(i,j:j+1);
        % Encontra os 1's no elemento estruturante
        estr1 = find(B1 == 1);
        % Verifica se os elementos no trecho são 1 nas mesmas posições 
        % do elemento estruturante
        if(trecho(estr1) == 1)
            saida1(i,j) = 1; % se são, coloca 1 na matriz de saida
        end
    end
end
%figure, imshow(saida1);
%title('Resultado da Erosão');

% Dilatação - entrada é saida1
B2 = ones(4);

% Colocar padding de 0's em todos os lados
originalPad2 = padarray(saida1,[1 1]);
% Inicializar a matriz saida de tamanho igual ao da original com zeros
saida2 = zeros(size(saida1));

for i = 1:size(originalPad2,1)-3
    for j = 1:size(originalPad2,2)-3
        % Faz a operação AND
        saida2(i,j) = sum(sum(B2 & originalPad2(i:i+3,j:j+3)));
    end
end
%figure, imshow(saida2);
%title('Abertura');


% ==== Fechamento ====

B3 = ones(3);

% Dilatação - entrada é a imagem original
saida3 = dilatacao(imagem,B3);
figure, imshow(saida3);
title('Dilatação');

% Erosão - entrada é saida3
saida3 = imbinarize(saida3);
saida4 = erosao(saida3,B3);
figure, imshow(saida4);
title('Fechamento');
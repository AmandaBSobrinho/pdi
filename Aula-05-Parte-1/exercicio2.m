arq=input('Nome do arquivo: ','s');
ext=input('Extensão do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
figure;
imshow(imagem);
title('Imagem original');

imagem = rgb2gray(imagem);
imagem = imbinarize(imagem);
figure;
imshow(imagem);
title('Imagem binária');

% Elementos Estruturantes
B4 = [0 1 0
    1 1 1
    0 1 0];

B8 = [1 1 1
    1 1 1
    1 1 1];

% Erosão B4;
img1 = erosao(imagem,B4);
figure, imshow(img1);
title('Erosão B4');

% Erosão B8;
img2 = erosao(imagem,B8);
figure, imshow(img2);
title('Erosão B8');

% Dilatação B4;
img3 = dilatacao(imagem,B4);
figure, imshow(img3);
title('Dilatação B4');

% Dilatação B8;
img4 = dilatacao(imagem,B8);
figure, imshow(img4);
title('Dilatação B8');

% Abertura (Erosão + Dilatação)
img5 = dilatacao(img2,B8);
figure, imshow(img5);
title('Abertura B8');

% Fechamento (Dilatação + Erosão)
img4 = imbinarize(img4);
img6 = erosao(img4,B8);
figure, imshow(img6);
title('Fechamento B8');
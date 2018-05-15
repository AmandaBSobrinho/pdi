arq=input('Nome do arquivo: ','s');
ext=input('Extensão do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
figure;
imshow(imagem);
title('Imagem original');

imagem = rgb2gray(imagem);
imagem = imbinarize(imagem);
figure, imshow(imagem);
title('Imagem binária');

% Elemento Estruturante
B = ones(3);

% Erosão
E = erosao(imagem,B);
figure, imshow(E);
title('Erosão');

% Dilatação
D = dilatacao(imagem,B);
D = imbinarize(D);
figure, imshow(D);
title('Dilatação');

% Gradiente Interno (A - (A erosão B))
saida1 = imagem - E;
figure, imshow(saida1);
title('Gradiente Interno');

% Gradiente Externo (A dilatação B) - A
saida2 = D - imagem;
figure, imshow(saida2);
title('Gradiente Externo');

% Gradiente Morfológico (A dilatação B) - (A erosão B)
saida3 = D - E;
figure, imshow(saida3);
title('Gradiente Morfológico');
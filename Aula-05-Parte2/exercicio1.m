arq=input('Nome do arquivo: ','s');
ext=input('Extens�o do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
figure;
imshow(imagem);
title('Imagem original');

imagem = rgb2gray(imagem);
imagem = imbinarize(imagem);
figure, imshow(imagem);
title('Imagem bin�ria');

% Elemento Estruturante
B = ones(3);

% Eros�o
E = erosao(imagem,B);
figure, imshow(E);
title('Eros�o');

% Dilata��o
D = dilatacao(imagem,B);
D = imbinarize(D);
figure, imshow(D);
title('Dilata��o');

% Gradiente Interno (A - (A eros�o B))
saida1 = imagem - E;
figure, imshow(saida1);
title('Gradiente Interno');

% Gradiente Externo (A dilata��o B) - A
saida2 = D - imagem;
figure, imshow(saida2);
title('Gradiente Externo');

% Gradiente Morfol�gico (A dilata��o B) - (A eros�o B)
saida3 = D - E;
figure, imshow(saida3);
title('Gradiente Morfol�gico');
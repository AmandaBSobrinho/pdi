arq=input('Nome do arquivo: ','s');
ext=input('Extens�o do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
figure;
imshow(imagem);
title('Imagem original');

fatiamento8(imagem);
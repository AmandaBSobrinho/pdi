arq=input('Nome do arquivo: ','s');
ext=input('Extensão do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
figure;
imshow(imagem);
title('Imagem original');

fatiamento8(imagem);
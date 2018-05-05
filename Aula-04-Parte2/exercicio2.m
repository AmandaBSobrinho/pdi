arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
info=imfinfo(strcat(arq,'.',ext));

figure,imshow(imagem);
title('Imagem Original');

rgb1 = imagem(:, :, 1);
rgb2 = imagem(:, :, 2);
rgb3 = imagem(:, :, 3);

rgb1eq = equalizacao(rgb1,info);
rgb2eq = equalizacao(rgb2,info);
rgb3eq = equalizacao(rgb3,info);

%Imagem final equalizada
saida = cat(3, rgb1eq, rgb2eq, rgb3eq);
figure,imshow(saida);
title('Imagem Equalizada Final');
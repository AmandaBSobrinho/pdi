arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);

figure,imshow(imagem);
title('Imagem Original');

fatiamento18(imagem);

red = double(imagem(:, :, 1));
green = double(imagem(:, :, 2));
blue = double(imagem(:, :, 3));

imgHSI = rgbParahsi(red,green,blue);
figure,imshow(uint8(imgHSI));
title('Imagem HSI');

fatiamento18HSI(uint8(imgHSI));

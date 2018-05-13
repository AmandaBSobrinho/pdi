arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
info=imfinfo(strcat(arq,'.',ext));

figure,imshow(imagem);
title('Imagem Original');

red = double(imagem(:, :, 1));
green = double(imagem(:, :, 2));
blue = double(imagem(:, :, 3));

imgHSI = rgbParahsi(red,green,blue);

imgHSI = uint8(imgHSI);
figure,imshow(imgHSI);
title('Imagem HSI');
%imsave; % Para salvar a imagem (teste)

chH = imgHSI(:, :, 1);
chS = imgHSI(:, :, 2);
chI = imgHSI(:, :, 3);

%chHEq = equalizacao(chH,info);
%chSEq = equalizacao(chS,info);
chIEq = equalizacao(chI,info);

%Imagem final equalizada
saida = cat(3, chH, chS, chIEq);
figure,imshow(saida);
title('Imagem Equalizada Final');


imagem = imread('LCM1.jpg');
info = imfinfo('LCM1.jpg');

%converte para HSI
imagem_hsi = rgb_to_hsi(double(imagem)/255);

%equaliza somente a camada I
imagem_hsi(:,:,3) = histo_eq(uint8(imagem_hsi(:,:,3) .* 255), info);
figure, imshow(imagem_hsi); title('Imagem HSI');

%segmenta a imagem usando threshold multilevel de otsu
[imagem_seg_1, imagem_seg_2] = segment(imagem_hsi(:,:,3));
figure, imshow(imagem_seg_1); title('Imagem seg 1');
figure, imshow(imagem_seg_2); title('Imagem seg 2');

%elementos estruturantes
B4 = [0 1 0
      1 1 1
      0 1 0];

B8 = [1 1 1
      1 1 1
      1 1 1];

%filtros morfológicos
% - imagem_seg_1: fechamento(abertura(imagem_seg_1,B8), B8) 
imagem_morf_1 = erosao(imagem_seg_1,B4);
figure, imshow(imagem_morf_1); title('Imagem1 erosao B4');

imagem_morf_1 = dilatacao(imagem_morf_1,B4);
figure, imshow(imagem_morf_1); title('Imagem1 dilatacao B4');

% - imagem_seg_2: 

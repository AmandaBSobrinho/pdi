imagem = imread('LCM1.jpg');
info = imfinfo('LCM1.jpg');

%converte para HSI
imagem_hsi = rgb_to_hsi(double(imagem)/255);

%equaliza somente a camada I
imagem_hsi(:,:,3) = histo_eq(uint8(imagem_hsi(:,:,3) .* 255), info);

%segmenta a imagem usando threshold multilevel de otsu
[imagem_seg_1, imagem_seg_2] = segment(imagem_hsi(:,:,3));
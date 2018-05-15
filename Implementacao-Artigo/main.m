% Lê imagem
%arq=input('Nome do arquivo: ','s');
%ext=input('Extensao do arquivo (jpg, jpeg, png): ','s'); 

%img_input=imread(arq,ext);
img_input=imread('lena','jpg');
figure; imshow(img_input); title('Imagem original');


%%============================= Compressão ==============================%%
% Divide imagem em blocos de 8x8 e aplica o DCT nos 3 canais de cor
img_dct = blockproc(img_input, [8 8], @dct_rgb);
figure; imshow(img_dct); title('Após aplicacação DCT');

% Quantização da imagem aplicada sobre cada bloco DCT
img_quant = round(blockproc(img_dct, [8 8], @dct_quantization));
figure; imshow(img_quant); title('Após aplicacação Quantização');

% Huffman encode
[img_encoded, img_dict] = huffman_encode(img_quant);
%figure; imshow(img_encoded); title('Após aplicação da codificação de Huffman');

%%=========================== Descompressão =============================%%

% Huffman decode
img_decoded = huffman_decode(img_encoded, img_dict);
%figure; imshow(img_decoded); title('Após aplicação da decodificação de Huffman');

img_decoded_recovery = reshape(img_decoded, size(img_quant));
figure;
imshow(img_decoded_recovery);
title('Após aplicação da decodificação de Huffman');
% Dequantização da imagem aplicada sobre cada bloco DCT
img_dequant = blockproc(im2double(img_decoded_recovery), [8 8], @dct_dequantization);
figure; imshow(img_dequant); title('Após aplicacação Dequantização');

% Divide imagem em blocos de 8x8 e aplica o DCT inverso nos 3 canais de cor
img_idct = blockproc(img_dequant, [8 8], @idct_rgb);
figure; imshow(uint8(img_idct)); title('Após aplicacação iDCT');

%%=========== Funções prontas mas ainda não utilizadas ==================%%
% Aplicação Ziz-Zag em cada bloco
%img_zigzag = blockproc(img_quant(:,:,1), [8 8], @dct_zigzag);



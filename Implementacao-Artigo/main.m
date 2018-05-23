% L� imagem
%arq=input('Nome do arquivo: ','s');
%ext=input('Extensao do arquivo (jpg, jpeg, png): ','s'); 

%img_input=imread(arq,ext);
img_input=double(imread('lena','jpg'));
figure; imshow(uint8(img_input)); title('Imagem original');

%% ============================= Compress�o ==============================%%
% Divide imagem em blocos de 8x8 e aplica o DCT nos 3 canais de cor
img_dct = blockproc(img_input, [8 8], @dct_rgb);
figure; imshow(uint8(img_dct)); title('Ap�s aplicaca��o DCT');

% Quantiza��o da imagem aplicada sobre cada bloco DCT
img_quant = blockproc(img_dct, [8 8], @quantization, 'PadPartialBlocks',true);
figure; imshow(uint8(img_quant)); title('Ap�s aplicaca��o Quantiza��o');

% Huffman dicion�rio
img_dict = huffman_dict(img_quant);

% Huffman encode
img_encoded = huffman_encode(img_quant, img_dict);

%% =========================== Descompress�o =============================%%
% Huffman decode
img_decoded = huffman_decode(img_encoded, img_dict);
img_decoded = reshape(img_decoded, size(img_quant));

% Dequantiza��o da imagem aplicada sobre cada bloco DCT
img_dequant = blockproc(img_decoded, [8 8], @dequantization);
figure; imshow(uint8(img_dequant)); title('Ap�s aplicaca��o Dequantiza��o');

% Divide imagem em blocos de 8x8 e aplica o DCT inverso nos 3 canais de cor
img_idct = blockproc(img_dequant, [8 8], @idct_rgb);
figure; imshow(uint8(img_idct)); title('Ap�s aplicaca��o iDCT');


%% =========== Fun��es prontas mas ainda n�o utilizadas ==================%%
% Aplica��o Ziz-Zag em cada bloco
%img_zigzag = blockproc(img_quant, [8 8], @dct_zigzag);
%img_zigzag = rgb2gray(reshape(img_zigzag, size(img_quant)));

% Aplica��o Ziz-Zag em cada bloco
%img_qdtree = qtdecomp(img_zigzag,0.5);


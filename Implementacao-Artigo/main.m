% L� imagem
%arq=input('Nome do arquivo: ','s');
%ext=input('Extensao do arquivo (jpg, jpeg, png): ','s'); 

%img_input=imread(arq,ext);
img_input=imread('lena','jpg');
figure; imshow(uint8(rgb2gray(img_input))); title('Imagem original');

tamBloco=8;
threshold=0.2;

%% ============================= Compress�o ============================== %%
% Divide imagem em blocos de 8x8 e aplica o DCT nos 3 canais de cor
img_dct = blockproc(img_input, [tamBloco tamBloco], @dct_rgb);
figure; imshow(uint8(img_dct)); title('Ap�s aplicaca��o DCT');

% Quantiza��o da imagem aplicada sobre cada bloco DCT
img_quant = blockproc(img_dct, [tamBloco tamBloco], @quantization, 'PadPartialBlocks',true);
figure; imshow(uint8(img_quant)); title('Ap�s aplicaca��o Quantiza��o');

% Fractal encoding
[img_fractal_encoded, posicao_bloco] = fractal_encode(img_input, threshold, tamBloco);
img_fractal_encoded = full(img_fractal_encoded);
figure,imshow(uint8(full(img_fractal_encoded))); title('Ap�s aplicaca��o da compress�o Fractal');

% Huffman dicion�rio
img_dict = huffman_dict(posicao_bloco);

% Huffman encoding
img_huffman_encoded = huffman_encode(posicao_bloco, img_dict);

%% =========================== Descompress�o ============================= %%
% Huffman decoding
img_huffman_decoded = huffman_decode(img_huffman_encoded, img_dict);

% Fractal decoding
img_fractal_decoded = fractal_decode(posicao_bloco);
figure,imshow(uint8(img_fractal_decoded));title('Ap�s aplicaca��o da descompress�o Fractal');

% Dequantiza��o da imagem aplicada sobre cada bloco DCT
img_dequant = blockproc(uint8(img_fractal_decoded), [tamBloco tamBloco], @dequantization_gray);
figure; imshow(double(img_dequant)); title('Ap�s aplicaca��o Dequantiza��o');

% Divide imagem em blocos de 8x8 e aplica o DCT inverso nos 3 canais de cor
img_idct = blockproc(img_dequant, [tamBloco tamBloco], @idct_gray);
figure; imshow(uint8(img_idct)); title('Ap�s aplicaca��o iDCT');


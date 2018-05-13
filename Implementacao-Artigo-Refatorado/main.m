% Lê imagem
arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s'); 

%img = rgb2gray(img_input); % converte imagem para escala de cinza

% Leitura da Imagem
img_input=imread(arq,ext);
figure; imshow(img_input); title('Imagem original');

% Divide imagem em blocos de 8x8 e aplica o DCT em cada nível de cor, R, G e B
img_block = blockproc(img_input, [8 8], @dct_rgb);
figure; imshow(img_block); title('Após aplicacação DCT');

% Quantização da imagem aplicada sobre cada bloco DCT
img_quant = blockproc(img_block, [8 8], @dct_quantization);
figure; imshow(img_quant); title('Após aplicacação Quantização');

% Aplicação Ziz-Zag em cada bloco
%img_zigzag = blockproc(img_quant(:,:,1), [8 8], @dct_zigzag);

% Converte Imagem para escala de cinza
img=rgb2gray(img_input);
[x,y] = size(img);

% Huffman encode
[img_compress, img_dict] = huffman_encode(img);
figure; imshow(img_compress); title('Huffman encoded');

% Huffnab decode
img_decompress = huffman_decode(img_compress, img_dict);
figure; imshow(img_decompress); title('Huffman encoded');
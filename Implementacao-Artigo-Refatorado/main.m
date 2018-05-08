% Lê imagem
arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s'); 

%img = rgb2gray(img_input); % converte imagem para escala de cinza

% Leitura da Imagem
img_input=imread(arq,ext);
figure; imshow(img_input);

% Divide imagem em blocos de 8x8 e aplica o DCT em cada nível de cor, R, G e B
img_block = blockproc(img_input, [8 8], @dct_rgb);
figure; imshow(img_block);

% Quantização da imagem aplicada sobre cada bloco DCT
img_quant = blockproc(img_block, [8 8], @dct_quantization);
figure; imshow(img_quant);

% Aplicação Ziz-Zag em cada bloco
%img_zigzag = blockproc(img_quant(:,:,1), [8 8], @dct_zigzag);

% Converte Imagem para escala de cinza
img=rgb2gray(img_input);
[x,y] = size(img);

% Calcula quantidade de blocos relativo a cada tamanho
% Em x
qtdCaixaX = floor(x/8);

% Em y
qtdCaixaY = floor(y/8);

% Bloco fractal
% Obtém as intensidades I de cada bloco para cada tamanho de caixa i
blocoFractal = fractal_bloco(img, 8, qtdCaixaX, qtdCaixaY);
    
% Total de caixas T obtido a partir da dimensão da imagem
T = qtdCaixaX*qtdCaixaY;
    
% Total de caixas Q contadas na imagem com alguma informação (intensidade luminosa)
Q = blocoFractal./8; 

% Dimensão fractal de cada bloco
dimensaoFractal = Q/T;
     
% Calcular distância Euclidiana com vizinhança 8 para os blocos

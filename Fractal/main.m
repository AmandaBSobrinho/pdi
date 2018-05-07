% Leitura da Imagem
clear;
arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s'); 

% Leitura da Imagem
imagem=imread(arq,ext);

% Converte Imagem para escala de cinza
img=rgb2gray(imagem);
[x,y] = size(img);

%=================Implementação usando blockproc======================%

% Define o tamanho do bloco inicial
if x <= y
  tamanhoBlocoInicial = x;
else
  tamanhoBlocoInicial = y;
end

% Inícia vetor de tamanhos de blocos possíveis e de intensidades
tamanhoBloco = zeros(1, floor(log2(tamanhoBlocoInicial)));

% Preenche os tamanhos dos blocos
tamanhoBloco(1) = tamanhoBlocoInicial;
[~,qtdBlocos] = size(tamanhoBloco);
for i=2:qtdBlocos
   tamanhoBloco(i) = floor(tamanhoBloco(i-1)/2);
end

% Calcula quantidade de blocos relativo a cada tamanho
for i=1:qtdBlocos
    % Em x
    qtdBlocoX = floor(x/tamanhoBloco(i));

    % Em y
    qtdBlocoY = floor(y/tamanhoBloco(i));
    
    maiorIntensidade = bloco(img, tamanhoBloco, i, qtdBlocoX, qtdBlocoY);
    
end
%======================================================================%







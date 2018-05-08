% Leitura da Imagem
clear;
arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s'); 

% Leitura da Imagem
imagem=imread(arq,ext);

% Converte Imagem para escala de cinza
img=rgb2gray(imagem);
[x,y] = size(img);

% Define o tamanho do bloco inicial
if x <= y
  lmax = x;
else
  lmax = y;
end

% Inícia vetor de tamanhos de blocos possíveis e de intensidades
L = zeros(1, floor(log2(lmax)));

% Define o tamanho (L) das caixas 
L(1) = lmax;
[~,qtdCaixas] = size(L);
for i=2:qtdCaixas
   L(i) = floor(L(i-1)/2);
end

% Calcula quantidade de blocos relativo a cada tamanho
T = zeros(1, qtdCaixas);
Q = zeros(1, qtdCaixas);
for i=1:qtdCaixas
    % Em x
    qtdCaixaX = floor(x/L(i));

    % Em y
    qtdCaixaY = floor(y/L(i));
    
    % Obtem as intensidades I de cada bloco para cada tamanho de caixa i
    I = bloco(img, L, i, qtdCaixaX, qtdCaixaY);
    
    % Total de caixas T(L) obtido a partir da dimensão da imagem
    T(i) = qtdCaixaX*qtdCaixaY;
    
    % Total de caixas Q(L) contadas na imagem com alguma informação (intensidade luminosa)
    Q(i) = sum(I/L(i));
    
end
%======================================================================%







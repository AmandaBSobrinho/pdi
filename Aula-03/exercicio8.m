%arq=input('Nome do arquivo: ','s');
%ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
%imagem=imread(arq,ext);
imagem=imread('frutas','bmp');
%imagem=rgb2gray(imagem);
[m,n] = size(imagem);
disp('Escolha um ruido:');
disp('1- Sal e pimenta');
disp('2- Uniforme');
disp('3- Gaussiana');
disp('4- Poisson');
opcao = input('');
intensidade = input('Informe a porcentagem de ruido desejada: ');
img = zeros(m,n,'double');
aleatoria = rand(size(imagem));

switch opcao
    
    case 1
        img(aleatoria < intensidade/2)=1;
        img(aleatoria >= intensidade/2 & aleatoria < intensidade)=2;
        imagem = im2double(imagem);
        imgruido = imagem;
        for i = 1:m
            for j =1:n
                if(img(i,j) ~= 0)
                    imgruido(i,j) = img(i,j)-1;
                end
            end
        end
        
        figure;
        imshowpair(imagem, imgruido, 'montage');
        title('Imagem com ruído sal e pimenta');
        
    case 2
        a = input('Intervalo a: ');
        b = input('Intervalo b: ');
        img = randi([a,b],m,n)*(1/(b-a));
        imagem = im2double(imagem);
        imgruido = imagem;
        for i = 1:m
            for j =1:n
                if(rand() < intensidade)
                    imgruido(i,j) = img(i,j);
                end
            end
        end
        
        figure;
        imshowpair(imagem, imgruido, 'montage');
        title('Imagem com ruído uniforme');
        
    case 3
        media = input('Informe a media: ');
        var = input('Informe a variancia: ');
        img = im2double(img);
        img = sqrt(var)*randn(size(img)) + media;
        img = img + -min(img);
        img = img/max(img(:));
        imagem = im2double(imagem);
        imgruido = imagem;
        for i = 1:m
            for j =1:n
                if(aleatoria(i,j) < intensidade)
                    imgruido(i,j) = img(i,j);
                end
            end
        end
        figure;
        imshowpair(imagem, imgruido, 'montage');
        title('Imagem de ruido gausiano');
        
    case 4
        lambda = input('Informe o valor de lambda: ');
        imgPoisson = zeros(size(imagem),'double');
        [m,n] = size(imagem);
        for i = 1:m
            for j = 1:n
                L = exp(-lambda);
                k = 1;
                p = rand();
                while p > L
                    k = k + 1;
                    p = p * rand();
                end
                imgPoisson(i,j) = k - 1;
            end
        end
        img = imgPoisson;
        img = img/max(img(:));
        imagem = im2double(imagem);
        imgruido = imagem;
        for i = 1:m
            for j =1:n
                if(aleatoria(i,j) < intensidade)
                    imgruido(i,j) = img(i,j);
                end
            end
        end
        figure;
        imshowpair(imagem, imgruido, 'montage');
        title('Imagem de ruido poisson');
        
    otherwise
        disp('Valor informado fora do intervalo!');
        quit;
        
end

%filtros

disp('Escolha um filtro:');
disp('1- Passa-Baixa - 3x3');
disp('2- Passa-Baixa - 5x5');
disp('3- Passa-Baixa - 7x7');
disp('4- Passa-Alta - mascara 1 (-1 4 -1)');
disp('5- Passa-Alta - mascara 2 (-1 8 -1)');
disp('6- Mediana 3x3');
disp('7- Mediana 5x5');
opcao = input('');


switch opcao
    
    case 1
        mascara(1:3,1:3) = 1/9;
        imgfiltro = filtroMascara(imgruido, mascara);
        
    case 2
        mascara(1:5,1:5) = 1/25;
        imgfiltro = filtroMascara(imgruido, mascara);
        
    case 3
        mascara(1:7,1:7) = 1/49;
        imgfiltro = filtroMascara(imgruido, mascara);
        
    case 4
        mascara = zeros(3,3);
        mascara(1:2:3,2) = -1;
        mascara(2,1:2:3) = -1;
        mascara(2,2) = 4;
        imgfiltro = filtroMascara(imgruido, mascara);
        
    case 5
        mascara(1:3,1:3) = -1;
        mascara(2,2) = 8;
        imgfiltro = filtroMascara(imgruido, mascara);
        
    case 6
        imgfiltro = mediana(imgruido, 3);
        
    case 7
        imgfiltro = mediana(imgruido, 5);
        
    otherwise
        disp('Valor informado fora do intervalo!');
end

figure;
imshowpair(imgruido, imgfiltro, 'montage');
title('Imagem de ruido X Imagem com filtro');

%ufa
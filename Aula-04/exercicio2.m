arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
imagem=imresize(imagem,[256 256]);
figure;
imshow(imagem);
s= sprintf('Entropia: %f', entropia(imagem));
title(s);

if(size(imagem,3)) == 3
    imgcinza = (rgb2gray(imagem));
else
    imgcinza = imagem;
end
[m,n] = size(imagem);

disp('Escolha um ruido:');
disp('1- Sal e pimenta');
disp('2- Uniforme');
disp('3- Gaussiana');
disp('4- Poisson');
opcao = input('');
intensidade = input('Informe a porcentagem de ruido desejada: ');
img = zeros(256,256,'uint8');
aleatoria = rand(size(imagem));

switch opcao
    
    case 1
        a = input('Intervalo a: ');
        b = input('Intervalo b: ');
        Maux = find(aleatoria < intensidade/2);
        img(Maux) = a; % Minimum value
        Maux = find(aleatoria >= intensidade/2 & aleatoria < intensidade);
        img(Maux) = b; % Maximum (saturated) value
        figure;
        imshow(img);
        title('Imagem de ruido  - Sal e pimenta');
        
    case 2
        a = input('Intervalo a: ');
        b = input('Intervalo b: ');
        p = 1/(b-a);
        j = a;
        aleatoria = aleatoria * intensidade;
        for i=p:p:1
            Maux = find(aleatoria >= i-p & aleatoria < i);
            j = j + 1;
            img(Maux) = j;
        end
        figure;
        imshow(img);
        title('Imagem de ruido  - Uniforme');
        
    case 3
        aleatoria = aleatoria * intensidade;
        media = input('Informe a media: ');
        var = input('Informe a variancia: ');
        i = 255;
        img = im2double(img);
        for  z=0:0.003921569:1
            p = (1/(sqrt(2*pi*var)))*exp((-(z-media).^2)/(2*var));
            Maux = find(aleatoria <= p*intensidade);
            img(Maux) = i;
            i = i - 1;
        end
        figure;
        imshow(uint8(img));
        title('Imagem de ruido  - Gaussiana');
        
    case 4
        aleatoria = aleatoria * intensidade;
        lambda = input('Informe lambda: ');
        img = im2double(img);
        for z=0:255
            p = (exp(-lambda)*lambda.^z)/(factorial(z));
            Maux = find(aleatoria <= p*intensidade);
            img(Maux) = z;
        end
        figure;
        imshow(uint8(img));
        title('Imagem de ruido  - Poisson');
        
    otherwise
        disp('Valor informado fora do intervalo!');
        
end

imagemruido = imadd(imagem, uint8(img));
figure;
imshow(imagemruido);
s= sprintf('Entropia: %f', entropia(imagemruido));
title(s);
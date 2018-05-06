%arq=input('Nome do arquivo: ','s');
%ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
imagem=imread('Img4', 'jpg');
intensidade = 0.1;%input('Informe a porcentagem de ruido desejada: ');
[m,n,o] = size(imagem);
aleatorios = rand(m,n);

R = imagem(:,:,1); 
G = imagem(:,:,2); 
B = imagem(:,:,3);

R(aleatorios < intensidade/2) = 0;
G(aleatorios < intensidade/2) = 0;
B(aleatorios < intensidade/2) = 0;

R(aleatorios >= intensidade/2 & aleatorios < intensidade) = 256;
G(aleatorios >= intensidade/2 & aleatorios < intensidade) = 256;
B(aleatorios >= intensidade/2 & aleatorios < intensidade) = 256;

img(:,:,1) = R;
img(:,:,2) = G;
img(:,:,3) = B;

tamanhoJanela = input('Digite 3 para mascara 3x3 e 5 para 5x5: ');

if tamanhoJanela == 3 || tamanhoJanela == 5
    R = mediana(R, tamanhoJanela);
    G = mediana(G, tamanhoJanela);
    B = mediana(B, tamanhoJanela);
    imgMed(:,:,1) = R;
    imgMed(:,:,2) = G;
    imgMed(:,:,3) = B;
    
    figure;
    imshowpair(img,imgMed,'montage');
    title('Ruído sal e pimenta - filtro da mediana');
    
    figure; 
    plot(imhist(img(:,:,1)),'r');
    hold on; 
    plot(imhist(img(:,:,2)),'g');
    plot(imhist(img(:,:,3)),'b'); 
    legend('Red channel','Green channel','Blue channel');
    title('Histograma da imagem com ruído');
    hold off, 
    
    figure; 
    plot(imhist(imgMed(:,:,1)),'r');
    hold on; 
    plot(imhist(imgMed(:,:,2)),'g');
    plot(imhist(imgMed(:,:,3)),'b'); 
    legend('Red channel','Green channel','Blue channel');
    title('Histograma da imagem com filtro da mediana');
    hold off, 
    
    %HSI
    imgHSI = rgbParahsi(double(img(:, :, 1)),double(img(:, :, 1)),double(img(:, :, 3)));
       
    imgHSIMed(:,:,1) = mediana(imgHSI(:,:,1), tamanhoJanela);
    imgHSIMed(:,:,2) = mediana(imgHSI(:,:,2), tamanhoJanela);
    imgHSIMed(:,:,3) = mediana(imgHSI(:,:,3), tamanhoJanela);
    
    figure;
    imshowpair(imgHSI,imgHSIMed,'montage');
    title('HSI: Ruído sal e pimenta - filtro da mediana');
else
    disp('Opção errada');
    exit;
end

%conjunto A de imagens
imagem_A = [ 'LCM(32).jpg'
             'LCM(33).jpg'
             'LCM(34).jpg'
             'LCM(35).jpg'
             'LCM(36).jpg'
             'LCM(37).jpg'
             'LCM(38).jpg'
             'LCM(39).jpg'];

%conjunto B de imagemns
imagem_B = [ 'LLC(07).jpg' 
             'LLC(08).jpg'
             'LLC(09).jpg'
             'LLC(10).jpg'
             'LLC(11).jpg'
             'LLC(12).jpg'];

%elementos estruturantes
B4 = [0 1 0
      1 1 1
      0 1 0];

B8 = [1 1 1
      1 1 1
      1 1 1];
  
  
 matriz_carac_hsi = [0.675066404262813 0.999853685811201 59 -1;
                     0.675066404262813 0.999995001882546 69 -1;
                     0.674772643556525 0.999718835952076 55 -1;
                     0.675052586946563 0.999767600745748 73 -1;
                     0.675066404262813 0.999854250155093 63 -1;
                     0.673889482416381 0.999979685733032 240 -1;
                     0.673760097218724 0.999734134887158 238 -1;
                     0.675066404262813 0.999991422723544 73 -1;
                     0.715424491223012 0.999653921109554 2538 -2;
                     0.705631810696735 0.999873781807580 427 -2;
                     0.708305792134036 0.999979931791434 1621 -2;
                     0.707583219525115 0.999974891809553 1717 -2;
                     0.707571145579969 0.999783836870227 873 -2;
                     0.684676218687464 0.999679836347824 293 -2];
                 
 matriz_carac_seg1 = [0.672253274996437 0.560951571846753 66 -1;
                      0.671853093054544 0.572657743420843 56 -1;
                      0.671595013088399 0.579747101103397 63 -1;
                      0.672170647430344 0.563755644403297 66 -1;
                      0.671339509556689 0.614868165047863 70 -1;
                      0.669875008778685 0.613929787831599 253 -1;
                      0.670177581776896 0.595101565967127 246 -1;
                      0.671186166536229 0.602999661516820 61 -1;
                      0.713599431983953 0.390329252777909 1326 -2;
                      0.668961724795893 0.369111385093696 234 -2;
                      0.707774758556512 0.217205445451604 599 -2;
                      0.707170112004584 0.180604191387008 394 -2;
                      0.707439521899560 0.284801289029440 621 -2;
                      0.683498816816057 0.357144735173173 300 -2];
                  
 matriz_carac_seg2 = [0.644636802499431 0.999956623038631 28 -1;
                      0.645921620972525 0.998398634029717 35 -1;
                      0.642281613025548 0.999924902292167 33 -1;
                      0.647033451127694 0.998664869638323 36 -1;
                      0.643450084770928 0.999999995003142 33 -1;
                      0.645500554378814 0.999813461403347 108 -1;
                      0.645702901967931 0.999972127866065 106 -1;
                      0.646575308778967 0.997175665325043 42 -1;
                      0.700293239077425 0.942215231737456 1443 -2;
                      0.655763570172339 0.940718384783897 262 -2;
                      0.696471573889759 0.911082710312787 1542 -2;
                      0.695726577197055 0.899912490777853 1463 -2;
                      0.697067000316488 0.942423281131780 902 -2;
                      0.666421209609657 0.966128924116884 251 -2];
 
 
% for i=1:size(imagem_A,1) + size(imagem_B,1)
%     %lê imagem
%     if i <= size(imagem_A,1)
%         imagem = imread(imagem_A(i,:));
%         info = imfinfo(imagem_A(i,:));
%     else
%         imagem = imread(imagem_B(i-size(imagem_A,1),:));
%         info = imfinfo(imagem_B(i-size(imagem_A,1),:));
%     end
%     
%     %converte para HSI
%     imagem_hsi = rgb_to_hsi(double(imagem)/255);
% 
%     %equaliza somente a camada I
%     imagem_hsi(:,:,3) = histo_eq(uint8(imagem_hsi(:,:,3) .* 255), info);
%     %figure, imshow(imagem_hsi); title('Imagem HSI');
% 
%     %segmenta a imagem usando threshold multilevel de otsu
%     [imagem_seg1, imagem_seg2] = segment(imagem_hsi(:,:,3));
%     %figure, imshow(imagem_seg1); title('Imagem seg 1');
%     %figure, imshow(imagem_seg2); title('Imagem seg 2');
%     
%     %% filtros morfológicos
%     if i <= size(imagem_A,1)
%         % filtros morfológicos - conjunto A
%         rotulo = -1;
%         % - imagem_seg_1
%         imagem_seg1_morf = dilatacao(dilatacao(erosao(erosao(imagem_seg1,B8),B8),B4),B4);
%         %figure, imshow(imagem_seg1_morf); title('Imagem1 - filtro');
% 
%         % - imagem_seg_2
%         imagem_seg2_morf = dilatacao(dilatacao(erosao(erosao(imagem_seg2,B8),B8),B4),B4);
%         %figure, imshow(imagem_seg2_morf); title('Imagem2 - filtro');
%     else
%         % filtros morfológicos - conjunto B
%         rotulo = -2;
%         % - imagem_seg_1
%         imagem_seg1_morf = dilatacao(dilatacao(erosao(erosao(erosao(imagem_seg1,B8),B8),B8),B8),B4);
%         %figure, imshow(imagem_seg1_morf); title(['Imagem seg1 - filtro: ', i]);
% 
%         % - imagem_seg_2
%         imagem_seg2_morf = dilatacao(dilatacao(erosao(erosao(erosao(imagem_seg2,B8),B8),B8),B8),B4);
%         %figure, imshow(imagem_seg2_morf); title(['Imagem seg2 - filtro', i]);
%     end
%     
%     %% dimensão fractal
%     imagem_hsi_fractal = fractal_dim(imagem_hsi(:,:,3));
%     imagem_seg1_fractal = fractal_dim(imagem_seg1_morf);
%     imagem_seg2_fractal = fractal_dim(imagem_seg2_morf);
% 
%     %% entropia
%     imagem_hsi_entro = entropia(uint8(imagem_hsi(:,:,3)));
%     imagem_seg1_entro = entropia(imagem_seg1_morf);
%     imagem_seg2_entro = entropia(imagem_seg2_morf);
% 
%     %% contagem de elementos
%     imagem_hsi_objetos = objetos(~uint8(imagem_hsi(:,:,3)), B8); 
%     imagem_seg1_objetos = objetos(~imagem_seg1_morf, B8);
%     imagem_seg2_objetos = objetos(~imagem_seg2_morf, B8);
% 
%     %% vetor de características
%     % - imagens HSI
%     matriz_carac_hsi(i,1) = imagem_hsi_fractal;
%     matriz_carac_hsi(i,2) = imagem_hsi_entro;
%     matriz_carac_hsi(i,3) = imagem_hsi_objetos;
%     matriz_carac_hsi(i,4) = rotulo;
%     
%     % - imagens segmentadas 1
%     matriz_carac_seg1(i,1) = imagem_seg1_fractal;
%     matriz_carac_seg1(i,2) = imagem_seg1_entro;
%     matriz_carac_seg1(i,3) = imagem_seg1_objetos;
%     matriz_carac_seg1(i,4) = rotulo;
%     
%     % - imagens segmentadas 2
%     matriz_carac_seg2(i,1) = imagem_seg2_fractal;
%     matriz_carac_seg2(i,2) = imagem_seg2_entro;
%     matriz_carac_seg2(i,3) = imagem_seg2_objetos;
%     matriz_carac_seg2(i,4) = rotulo;
%     
% 
% end
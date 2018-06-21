%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Atividade avaliat�ria de PDI - Grupo 03                     %
%                                                             %
% Integrantes:                                                %
%   - Bruno Barreto Carvalho                                  %
%   - Bruno Ferreira Leal                                     %
%                                                             %
% Arquivo: dupla03-codigos.zip                                %
%                                                             %
% Descri��o: arquivo contendo os c�digos referente a          %
%            implementa��o da atividade.                      %
%                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%conjunto A de imagens
imagem_A = [ 'LCM(32).jpg'
             'LCM(33).jpg'
             'LCM(34).jpg'
             'LCM(35).jpg'
             'LCM(36).jpg'
             'LCM(37).jpg'
             'LCM(38).jpg'
             'LCM(39).jpg'];
% 
% %conjunto B de imagemns
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

for i=1:size(imagem_A,1)+size(imagem_B,1)
    %l� imagem
    if i <= size(imagem_A,1)
        imagem = imread(imagem_A(i,:));
        info = imfinfo(imagem_A(i,:));
    else
        imagem = imread(imagem_B(i-size(imagem_A,1),:));
        info = imfinfo(imagem_B(i-size(imagem_A,1),:));
    end
    
    %converte para HSI
    imagem_hsi = rgb_to_hsi(double(imagem)/255);

    %equaliza somente a camada I
    imagem_hsi(:,:,3) = histo_eq(uint8(imagem_hsi(:,:,3) .* 255), info);
    
    %segmenta a imagem usando threshold multilevel de otsu
    [imagem_seg1, imagem_seg2] = segment(imagem_hsi(:,:,3));
%     figure;
%     imshow(imagem_seg1);title('Imagem segmentada 1');
%     figure;
%     imshow(imagem_seg2);title('Imagem segmentada 2');
    
    %% filtros morfol�gicos
    if i <= size(imagem_A,1)
        % filtros morfol�gicos - conjunto A
        rotulo = -1;
        % - imagem_seg_1
        imagem_seg1_morf = fechamento(fechamento(abertura(abertura(imagem_seg1,B8),B8),B4),B4);
        %figure, imshow(imagem_seg1_morf); title('Imagem1 - filtro');

        % - imagem_seg_2
        imagem_seg2_morf = fechamento(fechamento(abertura(abertura(imagem_seg2,B8),B8),B4),B4);
        %figure, imshow(imagem_seg2_morf); title('Imagem2 - filtro');
    else
        % filtros morfol�gicos - conjunto B
        rotulo = -2;
        % - imagem_seg_1
        imagem_seg1_morf = fechamento(abertura(abertura(abertura(imagem_seg1,B8),B8),B8),B8);
        %figure, imshow(imagem_seg1_morf); title(['Imagem seg1 - filtro: ', i]);

        % - imagem_seg_2
        imagem_seg2_morf = fechamento(abertura(abertura(abertura(imagem_seg2,B8),B8),B8),B8);
        %figure, imshow(imagem_seg2_morf); title(['Imagem seg2 - filtro', i]);
    end
    
    %% dimens�o fractal
    imagem_hsi_fractal = fractal_dim(imagem_hsi(:,:,3));
    imagem_seg1_fractal = fractal_dim(imagem_seg1_morf);
    imagem_seg2_fractal = fractal_dim(imagem_seg2_morf);

    %% entropia
    imagem_hsi_entro = entropia(uint8(imagem_hsi(:,:,3)));
    imagem_seg1_entro = entropia(imagem_seg1_morf);
    imagem_seg2_entro = entropia(imagem_seg2_morf);

    %% contagem de elementos
    imagem_hsi_objetos = objetos(~uint8(imagem_hsi(:,:,3)), B8); 
    imagem_seg1_objetos = objetos(~imagem_seg1_morf, B8);
    imagem_seg2_objetos = objetos(~imagem_seg2_morf, B8);

    %% vetor de caracter�sticas
    % - imagens HSI
    matriz_carac_hsi(i,1) = imagem_hsi_fractal;
    matriz_carac_hsi(i,2) = imagem_hsi_entro;
    matriz_carac_hsi(i,3) = imagem_hsi_objetos;
    matriz_carac_hsi(i,4) = rotulo;
    
    % - imagens segmentadas 1
    matriz_carac_seg1(i,1) = imagem_seg1_fractal;
    matriz_carac_seg1(i,2) = imagem_seg1_entro;
    matriz_carac_seg1(i,3) = imagem_seg1_objetos;
    matriz_carac_seg1(i,4) = rotulo;
    
    % - imagens segmentadas 2
    matriz_carac_seg2(i,1) = imagem_seg2_fractal;
    matriz_carac_seg2(i,2) = imagem_seg2_entro;
    matriz_carac_seg2(i,3) = imagem_seg2_objetos;
    matriz_carac_seg2(i,4) = rotulo;
end

[matriz_conf_hsi, matriz_conf_hsi_final] = matriz_confusao(matriz_carac_hsi);
[matriz_conf_seg1, matriz_conf_seg1_final] = matriz_confusao(matriz_carac_seg1);
[matriz_conf_seg2, matriz_conf_seg2_final] = matriz_confusao(matriz_carac_seg2);
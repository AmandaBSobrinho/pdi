function [img_fractal_encoded, posicao_bloco] = fractal_encode(img_quant, threshold, n)

    %[x,y,~] = size(img_quant);
    %max=8*floor(x/8);
    %max=16*floor(max/16);
    %img_quant=imresize(img_quant,[max max]);
    
    % Realiza a decomposição da imagem em blocos de domínio e de intervalo
    % de tamanho n e n*2, respectivamente, e analisa a similiridade entre
    % esses bloco de acordo o threshold definido
    img_fractal_encoded=qtdecomp(img_quant(:,:,1),threshold,[8 16]);
    
    % Mapeia as coordenadas x e y de cada bloco, bem como seu tamanho
    [i,j,blksz] = find(img_fractal_encoded);
    
    % Calcula a quantidade de blocos mapeados
    blkcount=length(i);
    
    % Calcula a intensidade média de cada bloco
    avg=zeros(blkcount,1);
    for k=1:blkcount 
        avg(k)=mean2(img_quant(i(k):i(k)+blksz(k)-1,j(k):j(k)+blksz(k)-1));
    end 
    avg=double(uint8(avg));

    % Agrupa os símbolos/valores usados para identificar a posição dos
    % blocos e seus tamanhos. Estes valores que serão codificados pelo
    % método de Huffman
    i(end+1)=0;j(end+1)=0;blksz(end+1)=0;
    posicao_bloco=[i;j;blksz;avg];
    posicao_bloco=single(posicao_bloco);
end
function img_fractal_decoded = fractal_decode(posicao_bloco)
    
    % Reorganiza os blocos de acordo com seu tamanho e posição original
    zeroindx=find(posicao_bloco==0);
    inew=posicao_bloco(1:zeroindx(1)-1); 
    jnew=posicao_bloco(zeroindx(1)+1:zeroindx(2)-1);
    blksznew=posicao_bloco(zeroindx(2)+1:zeroindx(3)-1);
    avgnew=posicao_bloco(zeroindx(3)+1:end);
    
    % Calcula a quantidade de blocos mapeados
    blkcount=length(inew);
    
    % Recalcula a intensidade média de cada bloco
    avgnew=uint8(avgnew);
    for k=1:blkcount-1
      img_fractal_decoded(inew(k)+1:inew(k)+blksznew(k),jnew(k)+1:jnew(k)+blksznew(k))=avgnew(k);
    end

end
function intLum = bloco(img, tamanhoBloco, indice, qtdBlocoX, qtdBlocoY)
    blocoImg=zeros(tamanhoBloco(indice), tamanhoBloco(indice));
    intLum=zeros(1, qtdBlocoX*qtdBlocoY);
    
    tamanhoBlock = tamanhoBloco(indice);
    tamanhoMaximoX = tamanhoBloco(indice)*qtdBlocoX;
    tamanhoMaximoY = tamanhoBloco(indice)*qtdBlocoY;
    
    m = 1;
    z = 1;
    for i=1:tamanhoMaximoX
        % Verifica se percorreu todos os blocos em X
        if i == m*tamanhoBlock
            % Identifica a maior intensidade do bloco
            intLum(z) = intensidade(blocoImg);
            m = m + 1;
            z = z + 1;
        end
        
        for j=1:tamanhoMaximoY
            % Verifica de percorreu todos os blocos em Y
            if j == n*tamanhoBloco(indice)
                n = n + 1;            
            end
        
            blocoImg(r,s) = img(i,j);
            s = s + 1;
        end
        r = r + 1;
   
    end
end
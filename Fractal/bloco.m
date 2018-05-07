function intLum = bloco(img, tamanhoBloco, indice, qtdBlocoX, qtdBlocoY)
    blocoImg=zeros(tamanhoBloco(indice), tamanhoBloco(indice));
    intLum=zeros(1, qtdBlocoX*qtdBlocoY);
    
    inicioX = 1;
    inicioY = 1;
    qbX = 1;
    qbY = 1;
    z = 1;
    
    while(qbX <= qtdBlocoX)
        ateX = tamanhoBloco(indice)*qbX;
        ateY = tamanhoBloco(indice)*qbY;
        r = 0;
        s = 0;
        
        for i=inicioX:ateX
            r = r + 1;
            for j=inicioY:ateY
                s = s + 1;
                blocoImg(r,s) = img(i,j);   
                if (i == ateX) & (j == ateY)
                    intLum(z) = intensidade(blocoImg);
                    
                    if qbY < qtdBlocoY
                        qbY = qbY + 1;
                        inicioY = ateY;
                    else
                        inicioX = ateX;
                        inicioY = 1;
                        qbX = qbX + 1;
                        qbY = 1;        
                    end
                    
                    r = 0;
                    s = 0;
                    z = z + 1;
                end            
            end     
            s = 0;
        end
    end
end
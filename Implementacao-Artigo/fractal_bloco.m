function intLum = fractal_bloco(img, tamanhoBloco, qtdBlocoX, qtdBlocoY)
    blocoImg=zeros(tamanhoBloco, tamanhoBloco);
    intLum=zeros(qtdBlocoX, qtdBlocoY);
    
    inicioX = 1;
    inicioY = 1;
    qbX = 1;
    qbY = 1;
    z = 1;
    
    while(qbX <= qtdBlocoX)
        ateX = tamanhoBloco*qbX;
        ateY = tamanhoBloco*qbY;
        r = 0;
        s = 0;
        
        for i=inicioX:ateX
            r = r + 1;
            for j=inicioY:ateY
                s = s + 1;
                blocoImg(r,s) = img(i,j);   
                if (i == ateX) & (j == ateY)
                    intLum(qbX, qbY) = dct_zigzag(blocoImg);
                    intLum(qbX, qbY) =
                    
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
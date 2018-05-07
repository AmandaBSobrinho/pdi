function imagemMediana = mediana(canal, tamanhoJanela)
janela = zeros(tamanhoJanela^2, 1);
bordaX = floor(tamanhoJanela/2);
bordaY = floor(tamanhoJanela/2);
[m,n] = size(canal);

%preencher bordas
for x = 1:m
    for y = 1:bordaY
        imagemMediana(x,y) = canal(x,y);
    end
end
for x = 1:m
    for y = n-1:n
        imagemMediana(x,y) = canal(x,y);
    end
end
for x = 1:2
    for y = 1:n
        imagemMediana(x,y) = canal(x,y);
    end
end
for x = m-1:m
    for y = 1:n
        imagemMediana(x,y) = canal(x,y);
    end
end

i = 1;
for x = bordaX+1:(m-bordaX)
    for y = bordaY+1:(n-bordaY)
        i = 1;
        for jx = 1:tamanhoJanela
            for jy = 1:tamanhoJanela
                janela(i) = canal(x+jx-bordaX-1,y+jy-bordaY-1);
                i = i + 1;
            end
        end
        imagemMediana(x,y) = median(janela);
    end
end
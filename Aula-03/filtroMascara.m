function imagem = filtroMascara(img,mascara)
[mm,nm] = size(mascara);
bordaX = floor(mm/2);
bordaY = floor(nm/2);
[m,n] = size(img);

%preencher bordas
for x = 1:m
    for y = 1:bordaY
        imagem(x,y) = img(x,y);
    end
end
for x = 1:m
    for y = n-bordaY:n
        imagem(x,y) = img(x,y);
    end
end
for x = 1:bordaX
    for y = 1:n
        imagem(x,y) = img(x,y);
    end
end
for x = m-bordaY:m
    for y = 1:n
        imagem(x,y) = img(x,y);
    end
end

soma = 0;
for x = bordaX+1:(m-bordaX)
    for y = bordaY+1:(n-bordaY)
        soma = 0;
        for mx = 1:mm
            for my = 1:nm
                soma = soma + mascara(mx,my)*img(x+mx-bordaX-1, y+my-bordaY-1);
            end
        end
        imagem(x,y) = soma;
    end
end
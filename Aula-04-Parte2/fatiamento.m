function F = fatiamento(imagem)
[x,y,z] = size(imagem);
F = zeros(x,y,z);
for i=1:1:x
    for j=1:1:y
        if (imagem(i,j) >= 0) && (imagem(i,j) < 32)
            F(i,j,1) = 0;
            F(i,j,2) = 0;
            F(i,j,3) = 102;
        elseif (imagem(i,j) >= 32) && (imagem(i,j) < 64)
            F(i,j,1) = 0;
            F(i,j,2) = 0;
            F(i,j,3) = 255;
        elseif (imagem(i,j) >= 64) && (imagem(i,j) < 96)
            F(i,j,1) = 102;
            F(i,j,2) = 255;
            F(i,j,3) = 255;
        elseif (imagem(i,j) >= 96) && (imagem(i,j) < 128)
            F(i,j,1) = 0;
            F(i,j,2) = 204;
            F(i,j,3) = 0;
        elseif (imagem(i,j) >= 128) && (imagem(i,j) < 160)
            F(i,j,1) = 102;
            F(i,j,2) = 255;
            F(i,j,3) = 51;    
        elseif (imagem(i,j) >= 160) && (imagem(i,j) < 192)
            F(i,j,1) = 255;
            F(i,j,2) = 255;
            F(i,j,3) = 0;
        elseif (imagem(i,j) >= 192) && (imagem(i,j) < 224)
            F(i,j,1) = 255;
            F(i,j,2) = 102;
            F(i,j,3) = 0;
        elseif (imagem(i,j) >= 224) && (imagem(i,j) < 256)
            F(i,j,1) = 255;
            F(i,j,2) = 0;
            F(i,j,3) = 0;
        end
    end
end

figure;
imshow(uint8(F));
title('Fatiamento');
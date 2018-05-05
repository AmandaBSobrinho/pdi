function F = fatiamento18HSI(imagem)
[x,y,z] = size(imagem);
F = zeros(x,y,z);
for i=1:1:x
    for j=1:1:y
        if (imagem(i,j,3)>= 0) && (imagem(i,j,3)< 18)
            F(i,j,1)=0;
            F(i,j,2)=0;
            F(i,j,3)=153;
        elseif (imagem(i,j,3)>= 18) && (imagem(i,j,3)< 36)
            F(i,j,1)=0;
            F(i,j,2)=51;
            F(i,j,3)=204;
        elseif (imagem(i,j,3)>= 36) && (imagem(i,j,3)< 54)
            F(i,j,1)=51;
            F(i,j,2)=204;
            F(i,j,3)=255;
        elseif (imagem(i,j,3)>= 54) && (imagem(i,j,3)< 72)
            F(i,j,1)=102;
            F(i,j,2)=255;
            F(i,j,3)=102;
        elseif (imagem(i,j,3)>= 72) && (imagem(i,j,3)< 90)
            F(i,j,1)=0;
            F(i,j,2)=255;
            F(i,j,3)=0;    
        elseif (imagem(i,j,3)>= 90) && (imagem(i,j,3)< 108)
            F(i,j,1)=51;
            F(i,j,2)=204;
            F(i,j,3)=51;
        elseif (imagem(i,j,3)>= 108) && (imagem(i,j,3)< 126)
            F(i,j,1)=153;
            F(i,j,2)=255;
            F(i,j,3)=51;
        elseif (imagem(i,j,3)>= 126) && (imagem(i,j,3)< 144)
             F(i,j,1)=204;
            F(i,j,2)=255;
            F(i,j,3)=102;
        elseif (imagem(i,j,3)>= 144) && (imagem(i,j,3)< 162)
            F(i,j,1)=255;
            F(i,j,2)=255;
            F(i,j,3)=102;
        elseif (imagem(i,j,3)>= 162) && (imagem(i,j,3)< 180)
            F(i,j,1)=255;
            F(i,j,2)=255;
            F(i,j,3)=0;
        elseif (imagem(i,j,3)>= 180) && (imagem(i,j,3)< 198)
            F(i,j,1)=255;
            F(i,j,2)=204;
            F(i,j,3)=0;
        elseif (imagem(i,j,3)>= 198) && (imagem(i,j,3)< 216)
            F(i,j,1)=255;
            F(i,j,2)=153;
            F(i,j,3)=51;
        elseif (imagem(i,j,3)>= 216) && (imagem(i,j,3)< 232)
            F(i,j,1)=255;
            F(i,j,2)=51;
            F(i,j,3)=0;
        elseif (imagem(i,j,3)>= 232) && (imagem(i,j,3)< 255)
            F(i,j,1)=255;
            F(i,j,2)=0;
            F(i,j,3)=0;
        end
    end
end

figure;
imshow(uint8(F));
title('Fatiamento HSI');
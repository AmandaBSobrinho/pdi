function E = equalizacao(imagem,info)
[m,n] = size(imagem);
numPixels = m*n;

img = uint8(zeros(m,n));

L=(info.BitDepth)/3;
numNiveis=2.^L;

%Zera os vetores usados
for k=1:numNiveis
   h(k)=0;
   g(k)=0;
   histEq(k)=0;
end

%Histograma da imagem original
for i=1:m
    for j=1:n
        ind=double(imagem(i,j))+1;
        h(ind) = h(ind) + 1;
    end
end

figure,bar(h);
title('Histograma Original');

gkant = 0;

%Novo histograma equalizado
for k=1:numNiveis
    for i=1:k
        g(k) = gkant + (h(i)/numPixels);
        gkant = g(k);
    end
    gkant = 0;
    g(k)=round(g(k)*(numNiveis-1));
    histEq(g(k)+1)= histEq(g(k)+1) + h(k);
end

figure,bar(histEq);
title('Histograma Equalizado');

%Nova imagem
for i=1:m
    for j=1:n
        img(i,j)=g(imagem(i,j)+1);
    end
end

figure,imshow(img);
title('Imagem Equalizada');
E = img;
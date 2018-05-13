i0 = [9 9 9 8 9 8 9 8 8 8 8 9 9 9 9
    8 8 9 8 8 8 8 8 7 8 8 8 9 8 9
    7 7 7 6 6 7 7 7 7 6 6 6 7 8 8
    6 7 6 6 2 1 1 1 1 1 1 1 7 8 8
    7 7 6 4 3 1 0 0 0 1 2 2 6 7 8
    7 6 5 4 2 0 0 0 0 1 2 5 6 7 8
    7 7 6 6 7 6 0 0 1 6 7 7 7 8 7
    7 7 7 7 6 6 0 0 1 6 7 7 8 7 8
    7 5 8 7 6 6 0 1 1 6 7 7 7 7 8
    7 4 7 8 7 6 1 1 2 6 7 7 7 8 7
    6 6 6 7 8 7 2 2 3 6 7 6 7 7 7
    6 6 4 6 7 6 2 3 5 7 6 6 6 7 7
    6 6 3 4 6 6 6 7 7 6 6 6 6 7 7
    4 4 6 4 4 6 6 6 7 7 6 7 7 5 8
    2 3 6 6 6 4 6 7 6 7 6 6 6 7 4];

[m,n] = size(i0);
i1 = zeros(m,n);

%Zera o vetor do histograma
for k=1:256
   h(k)=0;
end

%Cria o histograma
for i=1:m
    for j=1:n
        ind=double(i0(i,j))+1;
        h(ind) = h(ind) + 1;
    end
end

figure,bar(h);
title('Histograma de I0');

figure;
imshow(i0);
title('Imagem I0');

% Processamento de i0 (c)
for i=1:m
    for j=1:n
        if i0(i,j) <= 5
            i1(i,j) = 1;
        else
            i1(i,j) = 0;
        end
    end
end

figure, imshow(i1);
title('Imagem I1');

% Elementos Estruturantes
B4 = [0 1 0
    1 1 1
    0 1 0];

B8 = [1 1 1
    1 1 1
    1 1 1];

% I2 = I1 erosão B4;
i2 = erosao(i1,B4);
figure, imshow(i2);
title('Imagem I2 (erosão B4)');

% I3 = I1 erosão B8;
i3 = erosao(i1,B8);
figure, imshow(i3);
title('Imagem I3 (erosão B8)');

% I4 = I1 dilatação B4;
i4 = dilatacao(i1,B4);
figure, imshow(i4);
title('Imagem I4 (dilatação B4)')

% I5 = I1 dilatação B8;
i5 = dilatacao(i1,B8);
figure, imshow(i5);
title('Imagem I5 (dilatação B8)')

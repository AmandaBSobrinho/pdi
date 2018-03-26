arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
imagem=imread(arq,ext);
maior = imagem(1,1);
[m,n] = size(imagem);

for i=1:m
    for j=1:n
        if imagem(i,j) > maior
            maior = imagem(i,j);
        end
    end
end
x = log2(double(maior));
b=-1;
if x <= log2(1)
    b = 1;
elseif (log2(2) <= x) && (x <= log2(3))
    b = 2;
elseif (log2(4) <= x) && (x <= log2(7))
    b = 3;
elseif (log2(8) <= x) && (x <= log2(15))
    b = 4;
elseif (log2(16) <= x) && (x <= log2(31))
    b = 5;
elseif (log2(32) <= x) && (x <= log2(63))
    b = 6;
elseif (log2(64) <= x) && (x <= log2(127))
    b = 7;
elseif (log2(128) <= x) && (x <= log2(255))
    b = 8;
end

fprintf("Taxa de amostragem = %d X %d\n", m, n);
fprintf("Profundidade = %d\n", b);
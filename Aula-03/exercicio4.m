
arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
entrada=imread(arq,ext);
[M,N] = size(entrada);

disp('Escolha um filtro:');
disp('1- Passa-Baixa - 3x3');
disp('2- Passa-Baixa - 5x5');
disp('3- Passa-Baixa - 7x7');
opcao = input('');
saida = zeros(M,N);

switch opcao

    case 1
        mascara(1:3,1:3) = 1/9;
        disp(mascara)
        m = 3;
        n = 3;
        x1 = floor(m/2);
        y1 = floor(n/2);
        for x = 1:M
            for y = 1:N
                soma = 0;
                for i = 1:m
                    for j = 1:n
                        if (x-i > 0) && (y-j > 0)
                            soma = soma + mascara(i,j)*double(entrada(x-i,y-j));
                        end
                    end
                end
                saida(x,y) = soma;
            end
        end
        
    case 2
        mascara(1:5,1:5) = 1/25;
        m = 5;
        n = 5;
        x1 = floor(m/2);
        y1 = floor(n/2);
        for x = 1:M
            for y = 1:N
                soma = 0;
                for i = 1:m
                    for j = 1:n
                        if (x-i > 0) && (y-j > 0)
                            soma = soma + mascara(i,j)*double(entrada(x-i,y-j));
                        end
                    end
                end
                saida(x,y) = soma;
            end
        end
       
    case 3
        mascara(1:7,1:7) = 1/49;
        m = 7;
        n = 7;
        x1 = floor(m/2);
        y1 = floor(n/2);
        for x = 1:M
            for y = 1:N
                soma = 0;
                for i = 1:m
                    for j = 1:n
                        if (x-i > 0) && (y-j > 0)
                            soma = soma + mascara(i,j)*double(entrada(x-i,y-j));
                        end
                    end
                end
                saida(x,y) = soma;
            end
        end
        
    otherwise
        disp('Valor informado fora do intervalo!');
        
end

figure;
imshow(uint8(saida));


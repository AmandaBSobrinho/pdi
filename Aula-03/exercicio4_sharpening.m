arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
entrada=imread(arq,ext);
[M,N] = size(entrada);

disp('Escolha um filtro:');
disp('1- Aguçamento');
disp('2- Aguçamento Normalizado');
opcao = input('');

switch opcao
    case 1
        mascara(1:3,1:3) = -1;
        mascara(2,2) = 8;
        [m,n] = size(mascara);

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
                saida1(x,y) = soma;
            end
        end
        
        mascara = zeros(3,3);
        mascara(2,2) = 1;
        [m,n] = size(mascara);
        
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
                saida2(x,y) = soma;
            end
        end
        
        saida3 = imadd(uint8(saida1), uint8(saida2));
        
        mascara(1:3,1:3) = -1;
        mascara(2,2) = 9;
        [m,n] = size(mascara);
        
        x1 = floor(m/2);
        y1 = floor(n/2);
        for x = 1:M
            for y = 1:N
                soma = 0;
                for i = 1:m
                    for j = 1:n
                        if (x-i > 0) && (y-j > 0)
                            soma = soma + mascara(i,j)*double(saida3(x-i,y-j));
                        end
                    end
                end
                saida4(x,y) = soma;
            end
        end
        
    case 2
        mascara(1:3,1:3) = -1;
        mascara(2,2) = 8;
        mascara = mascara * 1/9;
        [m,n] = size(mascara);

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
                saida1(x,y) = soma;
            end
        end
        
        mascara = zeros(3,3);
        mascara(2,2) = 9;
        mascara = mascara * 1/9;
        [m,n] = size(mascara);
        
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
                saida2(x,y) = soma;
            end
        end
        
        saida3 = imadd(uint8(saida1), uint8(saida2));
        
        mascara(1:3,1:3) = -1;
        mascara(2,2) = 17;
        mascara = mascara * 1/9;
        [m,n] = size(mascara);
        
        x1 = floor(m/2);
        y1 = floor(n/2);
        for x = 1:M
            for y = 1:N
                soma = 0;
                for i = 1:m
                    for j = 1:n
                        if (x-i > 0) && (y-j > 0)
                            soma = soma + mascara(i,j)*double(saida3(x-i,y-j));
                        end
                    end
                end
                saida4(x,y) = soma;
            end
        end
        
end

figure;
imshow(uint8(saida4));
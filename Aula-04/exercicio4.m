m =[1,1,1,1,1,1,1,1,1,1,1,1,1,1
    1,1,0,0,0,0,1,1,1,1,1,1,1,1
    1,1,1,0,0,1,1,1,1,0,0,1,1,1
    1,1,1,1,1,1,1,1,1,0,0,1,1,1
    1,1,1,1,1,1,1,1,1,0,0,1,1,1
    1,1,1,1,1,1,1,0,0,0,0,1,1,1
    1,1,1,1,1,1,1,0,0,0,0,1,1,1
    1,1,1,1,0,0,0,1,1,1,1,1,1,1
    1,1,1,0,0,0,0,0,1,1,1,1,1,1
    1,1,1,1,0,0,0,1,1,1,1,1,1,1
    1,1,1,1,1,0,1,1,1,1,1,1,1,1
    1,1,1,1,1,1,1,1,1,1,1,1,1,1
    1,1,1,1,1,1,1,1,1,1,1,1,1,1]

imshow(mat2gray(m));
[m,n] = size(m);
fprintf('Numero de elementos conexos: %d\n',conexos(m));

fprintf('Escolha um ponto x1 (entre 1 e %d):\n', n);
x1 = input('');
fprintf('Escolha um ponto y1 (entre 1 e %d):\n', m);
y1 = input('');

fprintf('Escolha um ponto x2 (entre 1 e %d):\n', n);
x2 = input('');
fprintf('Escolha um ponto y2 (entre 1 e %d):\n', m);
y2 = input('');

disp('Escolha o tipo de distância a ser calculada:');
disp('1 - Distância Euclidiana (De)');
disp('2 - Distância D4 ou City-Block');
disp('3 - Distância D8 ou Chebyshev');
opcao = input('');

switch opcao
    case 1
        D = sqrt(((x1 - x2).^2) + ((y1 - y2).^2));
        
    case 2
        D = abs(x1 - x2) + abs(y1 - y2);
        
    case 3
        D = max(abs(x1 - x2),abs(y1 - y2));
        
    otherwise
        disp('Valor informado fora do intervalo!');
end

fprintf('Distância entre (%d,%d) e (%d,%d) = %d\n',x1,y1,x2,y2,D);
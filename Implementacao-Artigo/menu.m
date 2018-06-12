disp('Menu');
disp('1. Sem compressão fractal');
disp('2. Compressão fractal + Huffman');
disp('3. Com compressão fractal');

i=input('Escolha: ');

if i == 1
    sem_fractal;
elseif i == 2
    compressao_fractal_huffman;
else
    main;
end
disp('Menu');
disp('1. Sem compress�o fractal');
disp('2. Compress�o fractal + Huffman');
disp('3. Com compress�o fractal');

i=input('Escolha: ');

if i == 1
    sem_fractal;
elseif i == 2
    compressao_fractal_huffman;
else
    main;
end
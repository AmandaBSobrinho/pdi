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

figure;
imshow(i0);
title('Imagem I0');
truesize([500 500]);

% Elementos Estruturantes
E1 = [0 3 0
    3 3 3
    0 3 0];

E2 = [3 3 3
    3 3 3
    3 3 3];

% I2 = I1 erosão E1;
i2 = erosaoCinza(i0,E1);
figure, imshow(i2);
title('Imagem I2 (erosão E1)');
truesize([500 500]);

% I3 = I1 erosão E2;
i3 = erosaoCinza(i0,E2);
figure, imshow(i3);
title('Imagem I3 (erosão E2)');
truesize([500 500]);

% I4 = I1 dilatação E1;
i4 = dilatacaoCinza(i0,E1);
figure, imshow(i4);
title('Imagem I4 (dilatação E1)');
truesize([500 500]);

% I5 = I1 dilatação E2;
i5 = dilatacaoCinza(i0,E2);
figure, imshow(i5);
title('Imagem I5 (dilatação E2)');
truesize([500 500]);

% Abertura e fechamento para E1
abertura = dilatacaoCinza(erosaoCinza(i0,E1), E1);
fechamento = erosaoCinza(dilatacaoCinza(i0,E1),E1);
figure('Name','E1'), imshowpair(abertura, fechamento, 'montage');
title('Abertura X Fechamento');
truesize([500 500]);

% Abertura e fechamento para E2
abertura = dilatacaoCinza(erosaoCinza(i0,E2), E2);
fechamento = erosaoCinza(dilatacaoCinza(i0,E2),E2);
figure('Name','E2'), imshowpair(abertura, fechamento, 'montage');
title('Abertura X Fechamento');
truesize([500 500]);
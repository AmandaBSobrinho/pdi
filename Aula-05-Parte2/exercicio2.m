imagem= rgb2gray(imread('Img1', 'png'));
E = uint8([0 3 0
           3 3 3
           0 3 0]);
abertura = dilatacaoCinza(erosaoCinza(imagem,E), E);
fechamento = erosaoCinza(dilatacaoCinza(imagem,E),E);
soma1 = dilatacaoCinza(erosaoCinza(fechamento,E), E);%squeeze(mean(cat(3,abertura,fechamento),3));
soma2 = erosaoCinza(dilatacaoCinza(abertura,E),E);
soma = squeeze(mean(cat(3,soma1,soma2),3));
figure('Name','Abertura'), imshowpair(imagem, abertura, 'montage');
title('Original X Abertura');
figure('Name','Fechamento'), imshowpair(imagem, fechamento, 'montage');
title('Original X Fechamento');
figure('Name','Abertura + Fechamento'), imshowpair(imagem, soma1, 'montage');
title('Original X Abertura + Fechamento');
figure('Name','Abertura + Fechamento'), imshowpair(imagem, soma2, 'montage');
title('Original X Abertura + Fechamento');
figure('Name','Abertura + Fechamento'), imshowpair(imagem, soma, 'montage');
title('Original X Abertura + Fechamento');
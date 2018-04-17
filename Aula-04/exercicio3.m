clear;

% matriz 0

mat1 = zeros(256,256);
mat1(:, :) = 150; 
mat1 = uint8(mat1);
figure;
imshow(imbinarize(mat1));
title(conexos(mat1));

[l,n] = bwlabel(imbinarize(mat1));
disp(n);

% matriz 1

mat1 = zeros(256,256);
mat1(1:127, :) = 150; 
mat1 = uint8(mat1);
mat1(128:256, :) = 200;
mat1 = uint8(mat1);
figure;
imshow(imbinarize(mat1));
title(conexos(mat1));

[l,n] = bwlabel(imbinarize(mat1));
disp(n);

% matriz 2

mat1 = zeros(256,256);
mat1(1:127, :) = 150; 
mat1(59:79, 49:89) = 200;
mat1(59:79, 167:207) = 200;
mat1 = uint8(mat1);
mat1(128:256, :) = 200;
mat1(177:197, 49:89) = 150;
mat1(177:197, 167:207) = 150;
mat1 = uint8(mat1);
figure;
imshow(imbinarize(mat1));
title(conexos(mat1));

[l,n] = bwlabel(imbinarize(mat1));
disp(n);

% matriz 3

mat1 = zeros(256,256);
mat1(1:127, 1:127) = 64;
mat1(1:127, 127:256) = 128;
mat1(128:256, 1:127) = 192;
mat1(128:256, 127:256) = 256;
mat1 = uint8(mat1);
figure;
imshow(imbinarize(mat1));
title(conexos(mat1));

[l,n] = bwlabel(mat1);
disp(n);

% matriz 4

mat1 = zeros(256,256);
mat1(1:63, 1:63) = 16;
mat1(1:63, 64:127) = 32;
mat1(1:63, 128:191) = 48;
mat1(1:63, 192:256) = 64;

mat1(64:127, 1:63) = 80;
mat1(64:127, 64:127) = 96;
mat1(64:127, 128:191) = 112;
mat1(64:127, 192:256) = 128;

mat1(128:191, 1:63) = 144;
mat1(128:191, 64:127) = 160;
mat1(128:191, 128:191) = 176;
mat1(128:191, 192:256) = 192;

mat1(192:256, 1:63) = 208;
mat1(192:256, 64:127) = 224;
mat1(192:256, 128:191) = 240;
mat1(192:256, 192:256) = 256;

mat1 = uint8(mat1);
figure;
imshow(imbinarize(mat1));
title(conexos(mat1));

[l,n] = bwlabel(imbinarize(mat1));
disp(n);
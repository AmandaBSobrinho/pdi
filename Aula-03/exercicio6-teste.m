I = imread('polem.bmp');

figure
imshow(I)

figure
imhist(I)

J = histeq(I);

figure
imshow(J)

figure
imhist(J)
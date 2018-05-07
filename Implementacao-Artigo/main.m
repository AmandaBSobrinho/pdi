img = double(imread('praia.jpg'));

img_block = blockproc(img/255, [8 8], @dct_rgb);

figure;
imshow(img_block);

quant = blockproc(img_block, [8 8], @dct_quantization);

figure;
imshow(quant);

vetor = zigzag(quant);


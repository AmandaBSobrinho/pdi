img = imread('praia.jpg');

img_size = size(img);
block = round(img_size(1:2)/8);

function out = dct_rgb(block_struct)
    out(:,:,1) = dct2(block_struct.data(:,:,1));
    out(:,:,2) = dct2(block_struct.data(:,:,2));
    out(:,:,3) = dct2(block_struct.data(:,:,3));
end

img_block = blockproc(img, block, dct_rgb);

figure;
imshow(img_block);



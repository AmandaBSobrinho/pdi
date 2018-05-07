function [ out ] = idct_rgb( block_struct )
%IDCT_RGB Summary of this function goes here
%   Detailed explanation goes here

    out(:,:,1) = idct2(block_struct.data(:,:,1));
    out(:,:,2) = idct2(block_struct.data(:,:,2));
    out(:,:,3) = idct2(block_struct.data(:,:,3));
end


function [ out ] = idct_gray( block_struct )
%IDCT_RGB Summary of this function goes here
%   Detailed explanation goes here

    out = idct2(block_struct.data);
end


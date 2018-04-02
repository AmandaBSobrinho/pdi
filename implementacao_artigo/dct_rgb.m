function [ out ] = dct_rgb( block_struct )

    out(:,:,1) = dct2(block_struct.data(:,:,1));
    out(:,:,2) = dct2(block_struct.data(:,:,2));
    out(:,:,3) = dct2(block_struct.data(:,:,3));

end


function [image_hsi] = rgb_to_hsi(image_rgb)

    R = image_rgb(:,:,1);
    G = image_rgb(:,:,2);
    B = image_rgb(:,:,3);
    
    i = R + G + B;
    I = i / 3;
    
    H = acos((0.5 * ((R - G) + (R - B))) ./ ((sqrt((R - G).^2 +(R-B) .* (G-B)))+eps));
    
    H(B>G) = 2*pi-H(B>G);
    H = H/(2*pi);
    
    S = 1 - 3 .* (min(min(R,G),B)) ./ (R+G+B+eps);
    
    image_hsi = cat(3,H,S,I);
end


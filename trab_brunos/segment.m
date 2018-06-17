function [imagem_seg_1, imagem_seg_2] = segment(imagem)

    thresh = multithresh(imagem, 2);
    
    imagem_seg_1 = imbinarize(imagem, thresh(1));
    imagem_seg_2 = imbinarize(imagem, thresh(2));
end


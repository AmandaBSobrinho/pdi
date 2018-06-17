function [img] = histo_eq(imagem_i, info)

    [m,n]=size(imagem_i);
    pixels = m*n;
    
    img = uint8(zeros(m,n));
    
    l = (info.BitDepth)/3;
    niveis = 2.^l;
    
    h = zeros(niveis,1);
    g = zeros(niveis,1);
    hist_eq = zeros(niveis,1);
    
    for i=1:m
        for j=1:n
            ind = double(imagem_i(i,j))+1;
            h(ind) = h(ind)+1;
        end
    end
    
    gkant = 0;
    
    for k=1:niveis
        for i=1:k
            g(k) = gkant + (h(i)/pixels);
            gkant = g(k);
        end
        gkant = 0;
        g(k) = round(g(k)*(niveis-1));
        hist_eq(g(k)+1) = hist_eq(g(k)+1) + h(k);
    end
    
    for i=1:m
        for j=1:n
            img(i,j) = g(imagem_i(i,j)+1);
        end
    end
    
    img = double(img)/255;
end


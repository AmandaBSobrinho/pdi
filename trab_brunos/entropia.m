function H = entropia(imagem)
    if(size(imagem,3)) == 3
        m = (rgb2gray(imagem));
    else
    m = imagem;
    
    Lmax = max(m(:));
    [M,N] = size(m);
    p = zeros(Lmax+1, 1);
    for i = 1:M
        for j = 1:N
            p(m(i,j)+1) = p(m(i,j)+1) + 1;
        end
    end
    
    p(p==0) = [];%remove zeros
    p = p./(M*N);
    
    
    H = 0;
    for i=1:size(p)
        H = H + double(p(i).*log2(p(i)));
    end
    
    H = -H;
end


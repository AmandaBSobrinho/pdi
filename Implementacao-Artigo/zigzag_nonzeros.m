function img = zigzag_nonzeros(image)

    tamVet=64;
    [linhas,colunas,~]=size(image);
    
    % Redimensiona imagem em linhas com 64 colunas cada,
    % correspondendo a cada bloco de 8x8
    r=1; s=1; contCol=colunas/tamVet;
    for i=1:linhas
        for j=1:colunas
            img(r,s)=image(i,j);
            if s<tamVet & contCol>1
                s=s+1; contCol=contCol-1;
            else
                r=r+1; s=1; contCol=colunas/tamVet;
            end
        end
    end
    
    [linhas,colunas,~]=size(img);
    para=0;
    for i=1:linhas
        para=0;
        for j=colunas:-1:1
            if img(i,j)==0 & para==0
                img(i,j)=nan; 
            else
                para=1;
            end
        end
    end
end
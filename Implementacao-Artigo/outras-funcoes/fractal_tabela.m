function tabela = fractal_tabela(image, tamBloco)

    [linhas, colunas]=size(image);
    
    linTab=floor(linhas/tamBloco^2);
    colTab=tamBloco^2;
    tabela=zeros(linTab,colTab);
    
    contLin=1;
    contCol=1;
    for i=1:linhas
        % Cria um vetor apenas com elementos diferentes de NaN
        vet=[];
        for j=1:colunas
           if isnan(image(i,j))
              break;
           else
              vet(j)=image(i,j);
           end
        end
        
        % Se o bloco inteiro for de valores nulo assume a dimensão fractal
        % igual a 0
        if(isempty(vet))
            tabela(contLin,contCol)=0;
        else
            tabela(contLin,contCol)=fractal_dimensao(vet);
        end
        
        % Controla as posições da tabela de dimensões apenas
        if mod(i,64) == 0
            contLin=contLin+1; contCol=1;
        else
            contCol=contCol+1;
        end
    end   
end
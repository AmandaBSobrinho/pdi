function [matriz_confusao] = matriz_confusao(matriz_carac)

    [m, n] = size(matriz_carac);
    
    matriz_confusao = zeros(m,4,3);
    
    for j=1:n-1
        for i=1:m
            tabela_ouro = zeros(2, 2);
            corte = matriz_carac(i,j);
            classe = matriz_carac(i,4);
            for k=1:m
                if matriz_carac(k,j) <= corte && classe == matriz_carac(k,4)
                        
                    tabela_ouro(1,1) = tabela_ouro(1,1) + 1;
                elseif matriz_carac(k,j) > corte && classe == matriz_carac(k,4)
                        
                    tabela_ouro(2,1) = tabela_ouro(2,1) + 1;
                elseif matriz_carac(k,j) <= corte && classe ~= matriz_carac(k,4)
                        
                    tabela_ouro(1,2) = tabela_ouro(1,2) + 1;
                else
                        
                    tabela_ouro(2,2) = tabela_ouro(2,2) + 1;
                end
            end
            
            total = tabela_ouro(1,1)+tabela_ouro(1,2)+tabela_ouro(2,1)+tabela_ouro(2,2);
            
            matriz_confusao(i,2,j) = 100 - (tabela_ouro(2,2) / (tabela_ouro(1,2) + tabela_ouro(2,2)))*100;
            matriz_confusao(i,1,j) = (tabela_ouro(1,1) / (tabela_ouro(1,1) + tabela_ouro(2,1))) * 100;
            matriz_confusao(i,3,j) = corte;
            matriz_confusao(i,4,j) = (tabela_ouro(1,1)+tabela_ouro(2,2))/total;
        end
    end
    
    c1 = matriz_confusao(:,:,1);
    c2 = matriz_confusao(:,:,2);
    c3 = matriz_confusao(:,:,3);
    
    matriz_confusao(:,:,1) = sortrows(c1,3);
    matriz_confusao(:,:,2) = sortrows(c2,3);
    matriz_confusao(:,:,3) = sortrows(c3,3);
end


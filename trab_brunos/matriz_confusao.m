function [matriz_confusao, matriz_conf_final] = matriz_confusao(matriz_carac)

    [m, n] = size(matriz_carac);
    
    matriz_confusao = zeros(m,4,3);
    matriz_conf_final = zeros(2,7,3);
    
    for j=1:n-1
        maior = 0;
        for i=1:m
            tabela_ouro = zeros(2, 2);
            corte = matriz_carac(i,j);
            disp(corte);
            classe = matriz_carac(i,4);
            for k=1:m
                if matriz_carac(k,j) <= corte && classe == matriz_carac(k,4)
                        
                    tabela_ouro(1,1) = tabela_ouro(1,1) + 1;
                elseif matriz_carac(k,j) > corte && classe == matriz_carac(k,4)
                        
                    tabela_ouro(2,1) = tabela_ouro(2,1) + 1;
                elseif matriz_carac(k,j) <= corte && classe ~= matriz_carac(k,4)
                        
                    tabela_ouro(1,2) = tabela_ouro(1,2) + 1;
                elseif matriz_carac(k,j) > corte && classe ~=matriz_carac(k,4)
                        
                    tabela_ouro(2,2) = tabela_ouro(2,2) + 1;
                end
            end
            
            total = tabela_ouro(1,1)+tabela_ouro(1,2)+tabela_ouro(2,1)+tabela_ouro(2,2);
            
            matriz_confusao(i,2,j) = (1 - (tabela_ouro(2,2) / (tabela_ouro(1,2) + tabela_ouro(2,2)))) * 100;
            matriz_confusao(i,1,j) = (tabela_ouro(1,1) / (tabela_ouro(1,1) + tabela_ouro(2,1))) * 100;
            matriz_confusao(i,3,j) = corte;
            matriz_confusao(i,4,j) = ((tabela_ouro(1,1)+tabela_ouro(2,2))/total) * 100;
            
            if matriz_confusao(i,4,j) > maior
                maior = matriz_confusao(i,4,j);
                matriz_conf_final(1,1,j) = tabela_ouro(1,1);
                matriz_conf_final(1,2,j) = tabela_ouro(1,2);
                matriz_conf_final(2,1,j) = tabela_ouro(2,1);
                matriz_conf_final(2,2,j) = tabela_ouro(2,2);
                matriz_conf_final(1,3,j) = matriz_confusao(i,1,j);
                matriz_conf_final(1,4,j) = (tabela_ouro(2,2) / (tabela_ouro(1,2) + tabela_ouro(2,2)))*100;
                matriz_conf_final(1,5,j) = matriz_confusao(i,4,j);
                matriz_conf_final(1,6,j) = (tabela_ouro(1,1) /(tabela_ouro(1,1)+tabela_ouro(1,2))) * 100;
                matriz_conf_final(1,7,j) = corte;
            end
        end
    end
    
    c1 = matriz_confusao(:,:,1);
    c2 = matriz_confusao(:,:,2);
    c3 = matriz_confusao(:,:,3);
    
    matriz_confusao(:,:,1) = sortrows(c1,3);
    matriz_confusao(:,:,2) = sortrows(c2,3);
    matriz_confusao(:,:,3) = sortrows(c3,3);
end


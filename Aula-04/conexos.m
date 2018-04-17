function F = conexos(binaria) 

visitados = false(size(binaria)); % Marca os elementos já visitados (analisados)
[m,n] = size(binaria);
componentes = zeros(m,n);
contador = 1;

% Para cada elemento da matriz
for j = 1 : n
    for i = 1 : m
        
        % Se este elemento é zero, marca como visitado e continua
        if binaria(i,j) == 0
            visitados(i,j) = true;

        % Se o elemento foi visitado, então continua (volta no for)
        elseif visitados(i,j)
            continue;

        % Se é 1 e não foi visitado, então
        else
            % Inicializa a pilha com a localização deste elemento
            pilha = [i j];

            % Enquanto a pilha não estiver vazia
            while ~isempty(pilha)
                
                % Tira o topo da pilha e guarda em loc
                loc = pilha(1,:);
                pilha(1,:) = [];

                % Se o elemento guardado em loc já foi visitado, continua
                if visitados(loc(1),loc(2))
                    continue;
                end

                % Senão, marca o elemento como visitado e coloca o contador
                % na matriz de componentes
                visitados(loc(1),loc(2)) = true;
                componentes(loc(1),loc(2)) = contador;

                % Olha os elementos de vizinhança-8
                [locs_y, locs_x] = meshgrid(loc(2)-1:loc(2)+1, loc(1)-1:loc(1)+1);
                locs_y = locs_y(:); % transforma a matriz em um vetor
                locs_x = locs_x(:);

                 %%%% Para vizinhança-4
                 % locs_y = [loc(2)-1; loc(2)+1; loc(2); loc(2)];
                 % locs_x = [loc(1); loc(1); loc(1)-1; loc(1)+1];

                % Retirar as localizações fora dos limites da matriz de
                % entrada
                fora_dos_limites = locs_x < 1 | locs_x > m | locs_y < 1 | locs_y > n;

                locs_y(fora_dos_limites) = [];
                locs_x(fora_dos_limites) = [];

                % Retirar as localizações de elementos já visitados
                foi_visitado = visitados(sub2ind([m n], locs_x, locs_y));

                locs_y(foi_visitado) = [];
                locs_x(foi_visitado) = [];

                % Retirar localizações de elementos que são zero
                eh_1 = binaria(sub2ind([m n], locs_x, locs_y));
                locs_y(~eh_1) = [];
                locs_x(~eh_1) = [];

                % Adicionar localizações restantes à pilha
                pilha = [pilha; [locs_x locs_y]];
            end

            % Incrementar contador quando a região completa foi examinada
            % (ou seja, todos os vizinhos forem examinados)
            contador = contador + 1;
        end
    end
 end   
    F = contador - 1;
end
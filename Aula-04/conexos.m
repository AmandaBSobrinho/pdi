function F = conexos(binaria) 

visitados = false(size(binaria)); % Marca os elementos j� visitados (analisados)
[m,n] = size(binaria);
componentes = zeros(m,n);
contador = 1;

% Para cada elemento da matriz
for j = 1 : n
    for i = 1 : m
        
        % Se este elemento � zero, marca como visitado e continua
        if binaria(i,j) == 0
            visitados(i,j) = true;

        % Se o elemento foi visitado, ent�o continua (volta no for)
        elseif visitados(i,j)
            continue;

        % Se � 1 e n�o foi visitado, ent�o
        else
            % Inicializa a pilha com a localiza��o deste elemento
            pilha = [i j];

            % Enquanto a pilha n�o estiver vazia
            while ~isempty(pilha)
                
                % Tira o topo da pilha e guarda em loc
                loc = pilha(1,:);
                pilha(1,:) = [];

                % Se o elemento guardado em loc j� foi visitado, continua
                if visitados(loc(1),loc(2))
                    continue;
                end

                % Sen�o, marca o elemento como visitado e coloca o contador
                % na matriz de componentes
                visitados(loc(1),loc(2)) = true;
                componentes(loc(1),loc(2)) = contador;

                % Olha os elementos de vizinhan�a-8
                [locs_y, locs_x] = meshgrid(loc(2)-1:loc(2)+1, loc(1)-1:loc(1)+1);
                locs_y = locs_y(:); % transforma a matriz em um vetor
                locs_x = locs_x(:);

                 %%%% Para vizinhan�a-4
                 % locs_y = [loc(2)-1; loc(2)+1; loc(2); loc(2)];
                 % locs_x = [loc(1); loc(1); loc(1)-1; loc(1)+1];

                % Retirar as localiza��es fora dos limites da matriz de
                % entrada
                fora_dos_limites = locs_x < 1 | locs_x > m | locs_y < 1 | locs_y > n;

                locs_y(fora_dos_limites) = [];
                locs_x(fora_dos_limites) = [];

                % Retirar as localiza��es de elementos j� visitados
                foi_visitado = visitados(sub2ind([m n], locs_x, locs_y));

                locs_y(foi_visitado) = [];
                locs_x(foi_visitado) = [];

                % Retirar localiza��es de elementos que s�o zero
                eh_1 = binaria(sub2ind([m n], locs_x, locs_y));
                locs_y(~eh_1) = [];
                locs_x(~eh_1) = [];

                % Adicionar localiza��es restantes � pilha
                pilha = [pilha; [locs_x locs_y]];
            end

            % Incrementar contador quando a regi�o completa foi examinada
            % (ou seja, todos os vizinhos forem examinados)
            contador = contador + 1;
        end
    end
 end   
    F = contador - 1;
end
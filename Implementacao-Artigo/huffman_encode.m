function [compress, dict] = huffman_encode(imagem)

    vetor = reshape(imagem,1,[]);
    
    % Identifica as intensidades de forma única na imagem
    simbolos= unique(vetor(:));
    
    % Encontra a contagem/frequência de cada intensidade na imagem
    contagem = hist(vetor(:), double(simbolos));
    
    % Distribuição probabilística de cada intensidade
    p = contagem./ sum(contagem);
    
    % Cria um dicionário correspondente as intensidades e suas probabilidades 
    dict = huffmandict(simbolos,p); 
    
    % Codifica a imagem 
    compress = huffmanenco(vetor(:),dict);

end

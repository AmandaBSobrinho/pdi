function dict = huffman_dict(imagem)   

    vetor = reshape(imagem,[],1);
    
    % Identifica as intensidades de forma única na imagem
    simbolos= unique(vetor(:));
    
    % Encontra a contagem/frequência de cada intensidade na imagem
    contagem = hist(vetor(:), simbolos);
    
    % Distribuição probabilística de cada intensidade
    p = contagem./ sum(contagem);
    
    % Cria um dicionário correspondente as intensidades e suas probabilidades 
    dict = huffmandict(simbolos,p); 
    
end
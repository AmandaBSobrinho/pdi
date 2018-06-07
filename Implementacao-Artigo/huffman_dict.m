function dict = huffman_dict(imagem)   

    vetor = reshape(imagem,[],1);
    
    % Identifica as intensidades de forma �nica na imagem
    simbolos= unique(vetor(:));
    
    % Encontra a contagem/frequ�ncia de cada intensidade na imagem
    contagem = hist(vetor(:), simbolos);
    
    % Distribui��o probabil�stica de cada intensidade
    p = contagem./ sum(contagem);
    
    % Cria um dicion�rio correspondente as intensidades e suas probabilidades 
    dict = huffmandict(simbolos,p); 
    
end
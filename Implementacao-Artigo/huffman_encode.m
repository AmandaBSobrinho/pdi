function [compress, dict] = huffman_encode(imagem)

    % Identifica as intensidades de forma única na imagem
    simbolos= unique(uint8(imagem));
    
    % Encontra a contagem/frequência de cada intensidade na imagem
    contagem = hist(imagem(:), simbolos);
    
    % Distribuição probabilística de cada intensidade
    p = contagem./ sum(contagem);
    
    % Cria um dicionário correspondente as intensidades e suas probabilidades 
    dict = huffmandict(simbolos,p); 
    
    % Codifica a imagem 
    compress = huffmanenco(imagem,dict);

end

function dimensao = fractal_dimensao(img)

    [x,y] = size(img);

    % Define o tamanho da caixa inicial
    lmax = y;

    % Inícia vetor de tamanhos das caixas possíveis
    L = zeros(1, floor(log2(lmax)));

    % Define o tamanho (L) das caixas 
    L(1) = lmax;
    [~,qtdCaixas] = size(L);
    for i=2:qtdCaixas
       L(i) = floor(L(i-1)/2);
    end

    T = zeros(1, qtdCaixas);
    Q = zeros(1, qtdCaixas);
    for i=1:qtdCaixas
        % Calcula quantidade de blocos relativo a cada tamanho de caixa
        % Em x
        qtdCaixaX = ceil(x/L(i));

        % Em y
        qtdCaixaY = floor(y/L(i));

        % Em z
        qtdCaixaZ = ceil(255/L(i));

        % Obtem as intensidades I de cada quadrante para cada tamanho de caixa i
        I = fractal_bloco(img, L(i), qtdCaixaX, qtdCaixaY);

        % Máximo de caixas T(L) possíveis considerando o tamanho da caixa
        T(i) = qtdCaixaX*qtdCaixaY*qtdCaixaZ;

        % Total de caixas Q(L) contadas na imagem com alguma informação (intensidade luminosa)
        Q(i) = sum(ceil(I./L(i)));
    end

    % Dimensão fractal/textura da imagem
    dimensao = (log2(Q(qtdCaixas))-log2(Q(1))) / (log2(T(qtdCaixas))-log2(T(1))); 
    if isnan(dimensao)
       dimensao=0; 
    end
end
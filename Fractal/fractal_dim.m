function textura = fractal_dim(imagem)
 
%     %Leitura da Imagem
%     clear;
%     arq=input('Nome do arquivo: ','s');
%     ext=input('Extensao do arquivo (jpg, jpeg, png): ','s'); 
%     
%     %Leitura da Imagem
%     imagem=imread(arq,ext);
    
    % Converte Imagem para escala de cinza
    img=rgb2gray(imagem);
    [x,y] = size(img);

    % Define o tamanho da caixa inicial
    if x <= y
      lmax = x;
    else
      lmax = y;
    end

    % In�cia vetor de tamanhos das caixas poss�veis
    L = zeros(1, floor(log2(lmax)));

    % Define o tamanho (L) das caixas 
    L(1) = lmax;
    [~,qtdCaixas] = size(L);
    for i=2:qtdCaixas
       L(i) = floor(L(i-1)/2);
    end

    T = zeros(1, qtdCaixas);
    Q = zeros(1, qtdCaixas);

    T0(1) = 1;
    for i=1:qtdCaixas
        % Calcula quantidade de blocos relativo a cada tamanho de caixa
        % Em x
        qtdCaixaX = floor(x/L(i));

        % Em y
        qtdCaixaY = floor(y/L(i));

        % Em z
        qtdCaixaZ = ceil(255/L(i));

        % Obtem as intensidades I de cada quadrante para cada tamanho de caixa i
        I = fractal_bloco(img, L(i), qtdCaixaX, qtdCaixaY);

        % Total de caixas T(L) obtidos a partir da dimens�o da imagem
        T(i) = qtdCaixaX*qtdCaixaY*qtdCaixaZ;

        % Total de caixas Q(L) contadas na imagem com alguma informa��o (intensidade luminosa)
        Q(i) = sum(ceil(I./L(i)));
    end

    % Dimens�o fractal da imagem Q(L)/T(L)
    fprintf('\n---------- Propor��o de informa��o ocupada na imagem T(L)/Q(L)-----------\n');
    proporcao = Q./T;
    for i=1:qtdCaixas
        fprintf('L = %d -> Informa��o = %.2f%%\n',L(i), proporcao(i)*100);
    end

    % Dimens�o fractal da textura da imagem
    fprintf('\n------ DIMENS�O FRACTAL DA IMAGEM (TEXTURA)-------\n');
    textura = (log2(Q(qtdCaixas))-log2(Q(1))) / (log2(T(qtdCaixas))-log2(T(1))); 
    %textura_3d = (log2(Q(qtdCaixas))-log2(Q(1))) / (log2(L(qtdCaixas))-log2(L(1))); 
    fprintf('%.4f\n',textura);

    % Imprime graficos
    figure
    plot(T,Q)
    title('Propor��o de informa��o ocupada na imagem T(L) x Q(L)')
    grid on

    figure
    plot(log2(T), log2(Q))
    title('log2(T(L)) x log2(Q(L))')
    grid on
end
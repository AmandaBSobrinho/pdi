%function H  = entropia(imagem)
%if(size(imagem,3)) == 3
%    m = (rgb2gray(imagem));
%else
%    m = imagem;
    
    m = [ 22, 22, 22, 95, 167, 234, 234, 234
        22, 22, 22, 95, 167, 234, 234, 234
        22, 22, 22, 95, 167, 234, 234, 234
        22, 22, 22, 95, 167, 234, 234, 234,];
    
    Lmax = max(m(:));
    [M,N] = size(m);
    Lo = 0;
    if M < N
        Lo = M;
    else
        Lo = N;
    end
    L = Lo;
    posx = 1;
    posy = 1;
    entropias = [];
    Ls = L;
    while L > 1
        somaEntropia = 0;
        while posx < M
            posy = 1;
            while posy < N
                Maux = m(posx:L+posx-1,posy:L+posy-1);
                somaEntropia = somaEntropia + entropia(Maux);
                posy = posy + L;
            end
            posx = posx + L;
        end
        nCaixas = (M*N)/(L*L);
        entropias = [somaEntropia/nCaixas, entropias]; 
        L = L/2;
        Ls = [L, Ls];
        posx = 1; 
        posy = 1;
    end
    Ls(1) = [];
    plot(Ls, entropias, '-o');

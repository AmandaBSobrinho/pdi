function domainBlock = fractal_vizinhanca8(imgFractal, x, y)
    Dtsh = 1; % treshold a ser definido

    a = imgFractal(x,y);
    Nb1 = imgFractal(x-1,y-1);
    Nb2 = imgFractal(x-1,y);
    Nb3 = imgFractal(x-1,y+1);
    Nb4 = imgFractal(x,y-1);
    Nb5 = imgFractal(x,y+1);
    Nb6 = imgFractal(x+1,y-1);
    Nb7 = imgFractal(x+1,y);
    Nb8 = imgFractal(x+1,y+1);


    % Define valor do "range block"
    domainBlock(x,y) = a;


    % Define flags para o "domain blocks"
	% Vizinho 1
    distanciaE = fractal_distanciaEuclidiana(a,Nb1);
    if distanciaE < Dtsh
    	domainBlock(x-1,y-1) = 1;
    else
    	domainBlock(x-1,y-1) = 0;
    end

	% Vizinho 2
    distanciaE = fractal_distanciaEuclidiana(a,Nb2);
    if distanciaE < Dtsh
    	domainBlock(x-1,y) = 1;
    else
    	domainBlock(x-1,y) = 0;
    end

	% Vizinho 3
    distanciaE = fractal_distanciaEuclidiana(a,Nb3);
    if distanciaE < Dtsh
    	domainBlock(x-1,y+1) = 1;
    else
    	domainBlock(x-1,y+1) = 0;
    end

	% Vizinho 4
    distanciaE = fractal_distanciaEuclidiana(a,Nb4);
    if distanciaE < Dtsh
    	domainBlock(x,y-1) = 1;
    else
    	domainBlock(x,y-1) = 0;
    end

	% Vizinho 5
    distanciaE = fractal_distanciaEuclidiana(a,Nb5);
    if distanciaE < Dtsh
    	domainBlock(x,y+1) = 1;
    else
    	domainBlock(x,y+1) = 0;
    end

	% Vizinho 6
    distanciaE = fractal_distanciaEuclidiana(a,Nb6);
    if distanciaE < Dtsh
    	domainBlock(x+1,y-1) = 1;
    else
    	domainBlock(x+1,y-1) = 0;
    end

	% Vizinho 7
    distanciaE = fractal_distanciaEuclidiana(a,Nb7);
    if distanciaE < Dtsh
    	domainBlock(x+1,y) = 1;
    else
    	domainBlock(x+1,y) = 0;
    end

	% Vizinho 8
    distanciaE = fractal_distanciaEuclidiana(a,Nb8);
    if distanciaE < Dtsh
    	domainBlock(x+1,y+1) = 1;
    else
    	domainBlock(x+1,y+1) = 0;
    end
end

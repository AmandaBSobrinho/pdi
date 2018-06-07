function domainBlock = fractal_vizinhanca8(block_struct,dtsh)
    imgFractal = block_struct.data;
    
    x=2; y=2;
    a = imgFractal(x,y);
    Nb1 = imgFractal(x-1,y-1);
    Nb2 = imgFractal(x-1,y);
    Nb3 = imgFractal(x-1,y+1);
    Nb4 = imgFractal(x,y-1);
    Nb5 = imgFractal(x,y+1);
    Nb6 = imgFractal(x+1,y-1);
    Nb7 = imgFractal(x+1,y);
    Nb8 = imgFractal(x+1,y+1);


    % Define valor do "range block"(pixel central)
    domainBlock(x,y) = a;

    % Define flags para o "domain blocks"
	% Vizinho 1
    if norm(a-Nb1) < dtsh
    	domainBlock(x-1,y-1) = 1;
    else
    	domainBlock(x-1,y-1) = 0;
    end

	% Vizinho 2
    if norm(a-Nb2) < dtsh
    	domainBlock(x-1,y) = 1;
    else
    	domainBlock(x-1,y) = 0;
    end

	% Vizinho 3
    if norm(a-Nb3) < dtsh
    	domainBlock(x-1,y+1) = 1;
    else
    	domainBlock(x-1,y+1) = 0;
    end

	% Vizinho 4
    if norm(a-Nb4) < dtsh
    	domainBlock(x,y-1) = 1;
    else
    	domainBlock(x,y-1) = 0;
    end

	% Vizinho 5
    if norm(a-Nb5) < dtsh
    	domainBlock(x,y+1) = 1;
    else
    	domainBlock(x,y+1) = 0;
    end

	% Vizinho 6
    if norm(a-Nb6) < dtsh
    	domainBlock(x+1,y-1) = 1;
    else
    	domainBlock(x+1,y-1) = 0;
    end

	% Vizinho 7
    if norm(a-Nb7) < dtsh
    	domainBlock(x+1,y) = 1;
    else
    	domainBlock(x+1,y) = 0;
    end

	% Vizinho 8
    if norm(a-Nb8) < dtsh
    	domainBlock(x+1,y+1) = 1;
    else
    	domainBlock(x+1,y+1) = 0;
    end
end

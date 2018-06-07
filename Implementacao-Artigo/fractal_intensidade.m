function intLum = fractal_intensidade(bloco)
    [x,y] = size(bloco);
    
    intLum=0;
    for i=1:x
       for j=1:y
           if bloco(i,j) > intLum
               intLum = bloco(i,j);
           end
       end
    end
end
function  passa(limite, m, n, M , N, mascara)
    
    x1 = floor(m/2);
    y1 = floor(n/2);
    disp(-x1+limite)
    disp(x1-limite)
    disp(y1-limite)
    disp(-y1+limite)
    for x = 0:M-1
        for y = 0:N-1
            soma = 0;
            for i = -x1+limite:x1-limite
                for j = -y1+limite:y1-limite
                    soma = soma + mascara(i,j)*double(entrada(x-i,y-j));
                end
            end
            saida(x,y) = soma;
        end
    end
end
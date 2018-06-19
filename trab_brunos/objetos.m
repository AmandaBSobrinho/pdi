function N = objetos(imagem,estr)

    A=imagem;
    
    %Find a non-zero element's position.
    p=find(A==1);
    p=p(1);
    Label=zeros([size(A,1) size(A,2)]);
    N=0;

    while(~isempty(p))
        N=N+1;%Label for each component
        p=p(1);
        X=false([size(A,1) size(A,2)]);
        X(p)=1;

        Y= A & imdilate(X,estr);
        while(~isequal(X,Y))
            X=Y;
            Y=A & imdilate(X,estr);
        end

        Pos=find(Y==1);

        A(Pos)=0;
        p=find(A==1);

    end
       
end

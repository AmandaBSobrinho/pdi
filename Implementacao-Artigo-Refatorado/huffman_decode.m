function decompress = huffman_decode(compress, dict)

    decompress = huffmandeco(compress,dict);% decode the image.
    
    
    %zeroindx=find(image==0);%find boundries
    %inew=imagenew(1:zeroindx(1)-1); %seperate row index
    %jnew=imagenew(zeroindx(1)+1:zeroindx(2)-1); %seperate column index
    %blksznew=imagenew(zeroindx(2)+1:zeroindx(3)-1);%seperate blocksize
    %avgnew=imagenew(zeroindx(3)+1:end); %seperate mean values

end
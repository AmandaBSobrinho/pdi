%% 1.Lê Imagem
fname='lena.jpg';
I=rgb2gray(imread(fname)); 
figure,imshow(I);title('Original Image');drawnow;


%% 2.Decomposição Quadtree
s=qtdecomp(I,0.2,[2 64]);
                         
[i,j,blksz] = find(s);
blkcount=length(i); 
avg=zeros(blkcount,1);
for k=1:blkcount 
    avg(k)=mean2(I(i(k):i(k)+blksz(k)-1,j(k):j(k)+blksz(k)-1)); 
                                                              
end 
avg=double(uint8(avg));
figure,imshow((full(s)));title('Quadtree Decomposition');drawnow;

%% 3.Huffman Encoding
i(end+1)=0;j(end+1)=0;blksz(end+1)=0;
data=[i;j;blksz;avg];
data=single(data); 
symbols= unique(data);
counts = hist(data(:), symbols);
p = counts./ sum(counts);
dict = huffmandict(symbols,p');
comp = huffmanenco(data,dict);


%% 4.Huffman Decoding
datanew = huffmandeco(comp,dict);
zeroindx=find(data==0);
inew=datanew(1:zeroindx(1)-1); 
jnew=datanew(zeroindx(1)+1:zeroindx(2)-1);
blksznew=datanew(zeroindx(2)+1:zeroindx(3)-1);
avgnew=datanew(zeroindx(3)+1:end); 


%% 5.Decompressed image
avgnew=uint8(avgnew);
for k=1:blkcount 
  outim(inew(k):inew(k)+blksznew(k)-1,jnew(k):jnew(k)+blksznew(k)-1)=avgnew(k);
end
figure,imshow(uint8(outim));title('Decompressed Image');drawnow;

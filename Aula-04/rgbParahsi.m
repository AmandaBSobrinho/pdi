function [H,S,I]  = rgbParahsi(R,G,B)
H = acos(((R-G)+(R-B))./(2.*(sqrt((double((R-G).^2+(R-B).*(G-B)))))));
S = 1 - ((3.*min(R,min(G,B)))./(R+G+B));
I = (R+G+B)/3;
H(B>G)=360-H(B>G);%por definição
img(:,:,1) = H;
img(:,:,2) = S;
img(:,:,3) = I;

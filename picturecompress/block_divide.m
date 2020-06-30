function P = block_divide(I,K)
[row,col]=size(I);
R=row/K;
C=col/K;
P=zeros(K*K,R*C);
for i=1:R
    for j=1:C
        I2=I((i-1)*K+1:i*K,(j-1)*K+1:j*K);
        i3=reshape(I2,K*K,1);
        P(:,(i-1)*R+j)=i3;
    end
end
        
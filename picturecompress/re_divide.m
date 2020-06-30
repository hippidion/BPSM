function I=re_divide(P,col,K)
[~,N]=size(P);
m=sqrt(N);
b44=[];
for k=1:N
    t=reshape(P(:,k),K,K);
    b44=[b44,t];
end
I=[];
for k=1:m
    YYchonggou_ceshi1=b44(:,(k-1)*col+1:k*col);
    I=[I;YYchonggou_ceshi1];
end
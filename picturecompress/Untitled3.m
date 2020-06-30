clc
clear all
rng(0)
K=4;
N=2;
row=256;
col=256;
I=imread('C:/Users/Administrator/Desktop/A01.bmp');
I=imresize(I,[row,col]);
P=block_divide(I,K);
P=double(P)/255;
net=feedforwardnet(N,'trainlm');
T=P;
net.trainParam.goal=0.001;
net.trainParam.epochs=500;
tic
net=train(net,P,T);
toc
com.lw=net.lw{2};
com.b=net.b{2};
[~,len]=size(P);
com.d=zeros(N,len);
for i=1:len
    com.d(:,i)=tansig(net.iw{1}*P(:,i)+net.b{1});
end
minlw=min(com.lw(:));
maxlw=max(com.lw(:));
com.lw=(com.lw-minlw)/(maxlw-minlw);
minb=min(com.b(:));
maxb=max(com.b(:));
com.b=(com.b-minb)/(maxb-minb);
maxd=max(com.d(:));
mind=min(com.d(:));
com.d=(com.d-mind)/(maxd-mind);
com.lw=uint8(com.lw*63);
com.b=uint8(com.b*63);
com.d=uint8(com.d*63);
save comp com minlw maxlw minb maxb maxb maxd mind


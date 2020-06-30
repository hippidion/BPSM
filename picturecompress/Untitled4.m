clear,clc
close all 
col=256;
row=256;
I=imread('C:/Users/Administrator/Desktop/A01.bmp');
load comp
com.lw=double(com.lw)/63;
com.b=double(com.b)/63;
com.d=double(com.d)/63;
com.lw=com.lw*(maxlw-minlw)+minlw;
com.b=com.b*(maxb-minb)+minb;
com.d=com.d*(maxd-mind)+mind;
for i=1:4096
    Y(:,i)=com.lw*(com.d(:,i))+com.b;
end
Y=uint8(Y*255);
I1=re_divide(Y,col,4);
fprintf('PSNR :\n ');
psnr=10*log10(255^2*row*col/sum(sum((I-I1).^2)));
disp(psnr)
a=dir();
for i=1:length(a)
    if (strcmp(a(i).name,'comp.mat')==1)
        si=a(i).bytes;
        break;
    end
end
fprintf('rate: \n');
rate=double(si)/(256*256);
disp(rate)
figure(1)
imshow(I)
title('原始图像');
figure(2)
imshow(I1)
title('重建图像');

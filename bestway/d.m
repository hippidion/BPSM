datas=xlsread('c:\Users\Administrator\Desktop\城市经纬度.xls');
n=length(datas);
for i=1:n
    city(i).lat=datas(i,3);
    city(i).long=datas(i,4);
end
for i=1:n
    plot(city(i).long,city(i).lat,'o');
    text(city(i).long+0.2,city(i).lat+0.5,num2str(i));
    hold on;
end
axis([19 47 86 128]);
save('city.mat','city');
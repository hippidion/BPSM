function d=TotalDistance(route,D)
d=D(route(end),route(1));
for k=1:length(route)-1
    i=route(k);
    j=route(k+1);
    d=d+D(i,j);
end
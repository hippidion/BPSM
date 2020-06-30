load city
n=length(city);
D=DistanceMatrix(city);
T=1000;
rate=0.95;
route=randperm(n);
pre_d=TotalDistance(route,D);
T_iter=1;
while 1.0<T
    temp_route=Perturb(route,'reverse');
    cur_d=TotalDistance(temp_route,D);
    delta=cur_d-pre_d;
    if(delta<0)||rand<exp(-delta/T)
        route=temp_route;
        pre_d=cur_d;
        T_iter=T_iter+1;
    end
    if T_iter>=10
        T=rate*T;
        T_iter=0;
        for i=1:n
            x(i)=city(route(i)).long;
            y(i)=city(route(i)).lat;
        end
        x(n+1)=x(1);
        y(n+1)=y(1);
        plot(x,y,'o-');
        drawnow;
    end
end
route
pre_d

        
            
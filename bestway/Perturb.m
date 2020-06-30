function route=Perturb(route,method)
n=length(route);
i=randsample(n,1);
j=randsample(n,1);
switch method
    case 'reverse'
        citymin=min(i,j);
        citymax=max(i,j);
        route(citymin:citymax)=route(citymax:-1:citymin);
    case 'swap'
        route([i,j])=route([j,i]);
end
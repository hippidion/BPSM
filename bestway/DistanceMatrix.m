function D=DistanceMatrix(city)
n=length(city);
R=6378.137;
for i=1:n
    for j=i+1:n
        D(i,j)=distance(city(i).long,city(i).lat,city(j).long,city(j).lat,R);
        D(j,i)=D(i,j);
    end
end
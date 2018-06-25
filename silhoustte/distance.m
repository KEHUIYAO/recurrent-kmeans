function dist=distance(x,y,k)

%% x,y are lists, k is number of points to set
result=zeros(1,k);
points=min(max(x),max(y))*rand(1,k);
for i=1:k
    j=1;
    while j>0
        if x(j)>points(i)
            temp1=j-1;
            j=0;
        else
            j=j+1;
        end
    end
    j=1;
    while j>0
        if y(j)>points(i)
            temp2=j-1;
            j=0;
        else
            j=j+1;
        end 
    end
    result(i)=(temp1-temp2)^2;
end

dist=sqrt(mean(result));

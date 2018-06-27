function dist=distance_cluster(x,y,k)
%% x is a vector, y is a matrix

len=size(y);
len=len(1);
result=zeros(1,len);
for i=1:len
    result(i)=distance(x,y(i,:),k);
end
dist=mean(result);

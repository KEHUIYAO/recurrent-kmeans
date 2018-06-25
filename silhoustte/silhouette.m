function silhouette_value=silhouette(z,group,k)
result=distance_each_subject(z,group,k);
row=size(result);
row=row(1);
s=zeros(1,row);
for i=1:row
    temp1=min(result(i,:));
    [~,temp2]=sort(result(i,:));
    temp2=temp2(2);
    temp2=result(i,temp2);
    s(i)=(temp2-temp1)/max(temp1,temp2);
end
silhouette_value=mean(s);
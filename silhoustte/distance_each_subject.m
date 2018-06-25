function dist_matrix=distance_each_subject(z,group,k)
% the column represents each cluster, the row represents the cluster
% distance

len=length(unique(group));
row=size(z);
row=row(1);
result=zeros(row,len);
for i=1:row
    for j=1:len
        y_index=find(group==j);
        y=z(y_index,:);
        result(i,j)=distance_cluster(z(i,:),y,k);
    end
end
dist_matrix=result;
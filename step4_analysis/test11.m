clear
clc


load('11.mat');

num_accuracy=sum(num_list==2)/40;

index=num_list==2;

index_list=1:40;

index_list=index_list(index);

centroids=[0 0 0;0 0 0];
for i=index_list
    centroids=centroids+autosort(centroids_list{i},2);
end
centroids=centroids./length(index_list);
bias=(centroids-[150 0.1 0.25;150 0.25 0.1])./[150 0.1 0.25;150 0.25 0.1];


SSE=[0 0 0;0 0 0];
for i=index_list
    SSE=SSE+(autosort(centroids_list{i},2)-[150 0.1 0.25;150 0.25 0.1]).^2;
end

RMSE=sqrt(SSE/length(index_list));
% RMSE*100
RMSE(:,2:end)=RMSE(:,2:end)*100;

accuracy=0;
for i=index_list
    temp=sum((tau_list(i,:)-group_list(i,:))==0);
    if temp<=40/2
        temp=40-temp;
    end
    accuracy=accuracy+temp/40;
end
accuracy=accuracy/length(index_list);
    
save r11.mat num_accuracy centroids bias RMSE accuracy;
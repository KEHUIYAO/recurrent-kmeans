%%
filename = 'coal_data.xlsx';
sheet = 4;
[data,txt] = xlsread(filename,sheet)


%%
z=data(1:end,3:end)
z(isnan(z))=0
z=z/12

%%
len=size(z);
len=len(1);
Nj=zeros(1,len);
for i=1:len
    Nj(i)=sum(z(i,:)~=0);
end



%%
filename = 'coal_data.xlsx';
sheet = 3;
[data,txt] = xlsread(filename,sheet)
%%
%C=ones(length(Nj),1)*max(max(z,[],2))
C=max(z,[],2);


%%
global C_l C_u
C_l=min(C)
C_u=max(C)


%%
[num,group,centroids]=main(z,Nj,C,1.96,0,1000);
%%
centroids(1:end,4)=1:num;
centroids=autosort(centroids,1)
newgroup=zeros(1,length(Nj));
for i=1:num
    newgroup(group==centroids(i,4))=i;
end
group=newgroup
clear newgroup
group_result=tabulate(group);




%%
save coal_data.mat z Nj C num group centroids CI_lower CI_upper std_centroids based_on_centroids group_result

[group1, centroids1,~]=kmeans_r(z,Nj,C,k,tau_lower,tau_upper)


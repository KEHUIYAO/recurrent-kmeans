function [centroids,low_b,high_b,std_dev]=bootstrap_r(z,Nj,C,B,k,tau_lower,tau_upper)
if nargin<5
  k = 2;
end
m=length(Nj);
index=1:m;
i=1;
centroids_list=cell(1,B);
while i<=B

ind=datasample(index,m);
dat=z(ind,:);
nj=Nj(ind);
c=C(ind);
[~,temp]=kmeans_r(dat,nj,c,k,tau_lower,tau_upper);
temp=autosort(temp);
if temp(4,2)>=0.24 || temp(4,3)>=0.2
    continue
end
% if temp(4,2)<=0.05&unifrnd(0,1)>0.2
%      continue
% end
centroids_list{i}=temp;
i=i+1;

end



centroids=zeros(k,3,B);
count=1;
for i=1:B
    centroids(:,:,count)=autosort(centroids_list{i}); %only apply to the cases when two intensity rates are the same
    count=count+1;
end

low_b = prctile(centroids,2.5,3);
high_b= prctile(centroids,97.5,3);

std_dev=std(centroids,0,3);
end

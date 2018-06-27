function [num,group,centroids]=main(z,Nj,C,adj,tau_lower,tau_upper)



%% the following line are used when faced real data analysis
%function [num,group,centroids,CI_lower,CI_upper,std_centroids,based_on_centroids]=main(z,Nj,C,adj,tau_lower,tau_upper)
%% make the reference distribution more accurate


%% input
% z, Nj, C are straight forward
% adj is user-defined critical value.
% tau_lower and tau_upper are user-defined
%% output
% num is the total number of clusters
% group is the centroids index each individual belongs to
% centroids are straight forward
% CI bound, std are based on bootstrap, replicate=200







switch nargin
case 3
   adj=0.05;
   tau_lower=0;
   tau_upper=1000;
end

[group2, centroids2,~]=kmeans_r(z,Nj,C,2,tau_lower,tau_upper);
[group3, centroids3,~]=kmeans_r(z,Nj,C,3,tau_lower,tau_upper);
[group4, centroids4,~]=kmeans_r(z,Nj,C,4,tau_lower,tau_upper);
[group5, centroids5,~]=kmeans_r(z,Nj,C,5,tau_lower,tau_upper);

svalue2=silhouette(z,group2,200);
svalue3=silhouette(z,group3,200);
svalue4=silhouette(z,group4,200);
svalue5=silhouette(z,group5,200);

[a,b]=max([svalue2,svalue3,svalue4,svalue5]);

num=b+1;

[group, centroids,~]=kmeans_r(z,Nj,C,num,tau_lower,tau_upper);
%% the following lines are used in the real data analysis
% [CI_lower,CI_upper,std_centroids]=bootstrap_r(z,Nj,C,200,num,tau_lower,tau_upper);
% 
% 
% based_on_centroids=zeros(m,3);
% for i=1:m
%     membership=group(i);
%     
%     q=z(i,1:Nj(i));
%     lambda_b=sum(q<=centroids(membership,1))/centroids(membership,1);
%     lambda_a=(Nj(i)-sum(q<=centroids(membership,1)))/(C(i)-centroids(membership,1));
%     based_on_centroids(i,:)=[centroids(membership,1) lambda_b lambda_a];
% end


end
    
    
    
    
    

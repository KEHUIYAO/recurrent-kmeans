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
k=1;
m=length(Nj);
while k<=5
    [group1, centroids1,~]=kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
    %% this line use bootstrap vs parametric
    [~,test_stat]=bootstrap_test_stat(z,Nj,C,200,k,tau_lower,tau_upper);
    %% this line use only parametric
    %[test_stat,~]=bootstrap_test_stat(z,Nj,C,200,k,tau_lower,tau_upper);
    if ref_new(test_stat,centroids1,k,m,200,adj,tau_lower,tau_upper)
        k=k+1;
    else
        num=k;
        group=group1;
        centroids=centroids1;
        break
        
    end
end

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
    
    
    
    
    

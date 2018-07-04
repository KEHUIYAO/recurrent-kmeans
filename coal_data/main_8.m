function [num,group,centroids]=main_8(z,Nj,C,adj)
switch nargin
case 3
   adj=1.96;
end
k=1;
m=length(Nj);
while k
    [group1, centroids1, prob1]=kmeans_r(z,Nj,C,k);
    [~,~,prob2]=kmeans_r(z,Nj,C,k+1);
    test_stat=(sum(prob2)-sum(prob1));

    if ref_new_8(test_stat,centroids1,k,m,50,adj)
        k=k+1;
    else
        num=k;
        group=group1;
        centroids=centroids1;
        break
        
    end
end
end
    
    
    
    
    

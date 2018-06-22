parpool(24);
B=200;
m=40;
coverage=zeros(2,3,m);
low=zeros(2,3,m);
high=zeros(2,3,m);
true_centroids=[150 0.25 0.1;300 0.25 0.1];
u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
lambda_k=[0.25 0.1;0.25,0.1];

parfor i=1:m
[z,Nj,C]=latent_simu_f_Cjsmall(u_v,m,lambda_k,K_d)
[low_b,high_b]=bootstrap_r(z,Nj,C,B);
logic1=low_b<=true_centroids;
logic2=high_b>=true_centroids;
low(:,:,i)=low_b;
high(:,:,i)=high_b;
coverage(:,:,i)=logic1&logic2;
end
coverage_rate=mean(coverage,3);
low=mean(low,3);
high=mean(high,3);
save boot6.mat coverage coverage_rate low high

    

parpool(24);
B=200;
n=40; 
coverage=zeros(2,3,n);
low=zeros(2,3,n);
high=zeros(2,3,n);
true_centroids=[150 0.25 0.1;300 0.25 0.1];
u_v=[150 300];% two possible values of change-points
m=80; % # of drivers
K_d=2;% two clusters
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point

parfor i=1:n
[z,Nj,C]=latent_simu_f(u_v,m,l1,l2,K_d);%
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
save boot2.mat coverage coverage_rate low high

    

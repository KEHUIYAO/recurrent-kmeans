[group2, centroids2,~]=kmeans_r(z,Nj,C,2,tau_lower,tau_upper);
[group3, centroids3,~]=kmeans_r(z,Nj,C,3,tau_lower,tau_upper);
[group4, centroids4,~]=kmeans_r(z,Nj,C,4,tau_lower,tau_upper);
[group5, centroids5,~]=kmeans_r(z,Nj,C,5,tau_lower,tau_upper);

svalue2=silhouette(z,group2,20);
svalue3=silhouette(z,group3,20);
svalue4=silhouette(z,group4,20);
svalue5=silhouette(z,group5,20);

[a,b]=max([svalue2,svalue3,svalue4,svalue5])

u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
[z,Nj,C,tau_list]=latent_simu_f(u_v,m,l1,l2,K_d);
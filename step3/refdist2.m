u_v=[100 200 300];% two possible values of change-points
K_d=3;% two clusters
m=100; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
[z,Nj,C,~]=latent_simu_f(u_v,m,l1,l2,K_d);%

[u,uu]=ref_distribution(z,Nj,C,2);
save refdist2.mat u uu
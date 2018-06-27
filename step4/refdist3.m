u_v=[80 160 240 320];% two possible values of change-points
K_d=4;% two clusters
m=100; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
[z,Nj,C,~]=latent_simu_f(u_v,m,l1,l2,K_d);%

[u,uu]=ref_distribution(z,Nj,C,3);
save refdist3.mat u uu

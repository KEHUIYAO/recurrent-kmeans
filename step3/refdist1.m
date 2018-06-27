%%

u_v=[120 150 200];% two possible values of change-points
K_d=3;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
[z,Nj,C,~]=latent_simu_f(u_v,m,l1,l2,K_d);

[power,u,uu]=ref_power(z,Nj,C,2,50,250)
save refdist1.mat power u uu
%%

u_v=[150 300];% two possible values of change-point
K_d=2;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
[z,Nj,C,tau_true_index]=latent_simu_f(u_v,m,l1,l2,K_d);
global C_l C_u
C_l=min(C)
C_u=max(C)


%%
[num,group,centroids,CI_lower,CI_upper,std_centroids,based_on_centroids]=main(z,Nj,C,0.01,50,250);
%%

group-tau_true_index
save real_data_analysis.mat z Nj C num group centroids CI_lower CI_upper std_centroids based_on_centroids



%%

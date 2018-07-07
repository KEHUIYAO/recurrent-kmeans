%dbstop if error
%% to make the reference dist more accurate
% here we micmic the censoring time by setting the global variable

%load('fake.mat')
load("fake_2.mat")
global C_l C_u
C_l=min(C);
C_u=max(C);
[num,group,centroids,CI_lower,CI_upper,std_centroids,based_on_centroids]=main(z,Nj,C,0.01,0,1000)
%dbstop in same_rate_f at 51 if lam2<0;
%[group,centroids,~] = kmeans_r(z,Nj,C,3,0,500)
%save fake_data.mat z Nj C num group centroids CI_lower CI_upper std_centroids


save teen.mat z Nj C num group centroids CI_lower CI_upper std_centroids based_on_centroids



filename = 'coal_data.xlsx';
sheet = 4;
[data,txt] = xlsread(filename,sheet)


%%
z=data(1:end,3:end)
z(isnan(z))=0
z=z/12

%%
len=size(z);
len=len(1);
Nj=zeros(1,len);
for i=1:len
    Nj(i)=sum(z(i,:)~=0);
end



%%
filename = 'coal_data.xlsx';
sheet = 3;
[data,txt] = xlsread(filename,sheet)
%%
%C=ones(length(Nj),1)*max(max(z,[],2))
C=max(z,[],2);


%%
global C_l C_u
C_l=min(C)
C_u=max(C)


k=4;
B=200;
tau_lower=0;
tau_upper=1000;


[centroids,low_b,high_b,std_dev]=bootstrap_r(z,Nj,C,B,k,tau_lower,tau_upper);
save coal_data_bootstrap4.mat  centroids
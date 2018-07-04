rng(1243)
% %%
% u_v=[150 300];% two possible values of change-points
% K_d=2;% two clusters
% m=40; % # of drivers
% lambda_k=[0.3 0.1; 0.1 0.3];
% [z,Nj,C,tau_true_index]=latent_simu_f_different_intensity_rate(u_v,m,lambda_k,K_d);%
% %%
% f=@(x,y) sum(y<=x&y>0)
% %%
% for i=1:40
%     if tau_true_index(i)==1
%         x=linspace(0,C(i),1000);
%         y=zeros(1,1000);
%         for j=1:length(x)
%             y(j)=f(x(j),z(i,:));
%         end
%         line1=plot(x,y,'-b','LineWidth',1)
%         hold on 
%     end
% end
% %%
% for i=1:40
%     if tau_true_index(i)==2
%         x=linspace(0,C(i),1000);
%         y=zeros(1,1000);
%         for j=1:length(x)
%             y(j)=f(x(j),z(i,:));
%         end
%         line2=plot(x,y,'--r','LineWidth',1)
%         hold on 
%     end
% end
%  
%%
figure()

tau_lower=0;
tau_upper=1000;
k=3
u_v=[100 200 300];% two possible values of change-point
K_d=3;% two clusters
m=40; % # of drivers
l=[0.4 0.1;0.1 0.4 ;0.25 0.1];
[z,Nj,C,tau_true_index]=latent_simu_f_different_intensity_rate(u_v,m,l,K_d);
global C_l C_u
C_l=min(C)
C_u=max(C)
m=length(Nj);   
    

 %% random assignment
 m=length(Nj);
 centroids=zeros(k,3);
 idx=1:k;
 idx=randsample(idx,m,true)
 for i=1:k
            new_group_i=find(idx==i);
            
            [a,b,c]=same_rate_f(z,Nj,C,new_group_i,tau_lower,tau_upper);
            centroids(i,:)=[a b c];
 end
%%

group=zeros(m,1);
iter=1;
maximum_iter=10;
temp=zeros(m,2);





while iter<=maximum_iter
    
    
    %%
num_of_plots=size(centroids)
num_of_plots=num_of_plots(1)

%% plot the whole picture
if iter>=2
subplot(4,1,iter-1)
m = length(C);
F1 = @(B,x) (B(1)*(x<=B(2)).*x+(x>B(2)).*(B(1)*B(2)+B(3)*(x-B(2)))); %without intercept  %Form of the equation,two piece linear 

hold all

for n=1:m
    if group(n)==1
    plot([0,z(n,1:Nj(n))],0:Nj(n),'-k<','MarkerSize',4,'Color','r')
    elseif group(n)==2
        plot([0,z(n,1:Nj(n))],0:Nj(n),'-.k*','MarkerSize',5,'Color','g')  
    elseif group(n)==3 
         plot([0,z(n,1:Nj(n))],0:Nj(n),'-ko','MarkerSize',4,'Color','b')
    elseif group(n)==4   
         %plot([z(n,Nj(n)) C(n)], [Nj(n) Nj(n)],'k')
         plot([0,z(n,1:Nj(n))],0:Nj(n),'-ko','MarkerSize',4,'Color','y')
    end
%     if group(n)==1
%     plot([0,z(n,1:Nj(n))],0:Nj(n),'-kx','MarkerSize',4)
%     elseif group(n)==2
%         plot([0,z(n,1:Nj(n))],0:Nj(n),'--ks','MarkerSize',4)  
%     elseif group(n)==3 
%          plot([0,z(n,1:Nj(n))],0:Nj(n),':kd','MarkerSize',4)
%     elseif group(n)==4   
%          %plot([z(n,Nj(n)) C(n)], [Nj(n) Nj(n)],'k')
%          plot([0,z(n,1:Nj(n))],0:Nj(n),'-.k^','MarkerSize',4)
%     end


end


%%


q=0:40:500;
for i=1:num_of_plots
plot(q,F1([centroids(i,2) centroids(i,1) centroids(i,3)],q),'k','LineWidth',2.5)
%plot(q,F1([centroids(2,2),centroids(2,1),centroids(2,3)],q),'-.k','LineWidth',2.5)
%plot(q,F1([centroids(3,2),centroids(3,1),centroids(3,3)],q),'k','LineWidth',2.5)
end
% subplot(1,2,2)
% hold all
% for i=1:num_of_plots
% plot(q,F1([centroids(i,2) centroids(i,1) centroids(i,3)],q),'k','LineWidth',2.5)
% %plot(q,F1([centroids(3,2),centroids(3,1),centroids(3,3)],q),'k','LineWidth',2.5)
% %plot(q,F1([centroids(4,2),centroids(4,1),centroids(4,3)],q),'k','LineWidth',2.5)
% end
end

    
    
    for i=1:m
        [temp(i,1),temp(i,2)]=nearest_centroids(centroids,z,Nj,C,k,i);
    end
    
    if isequal(temp(:,1),group)
        break;
    else
        group=temp(:,1);
        for i=1:k
            new_group_i=find(group==i);
            if length(new_group_i)==0
                 %% random assignment
 m=length(Nj);
 centroids=zeros(k,3);
 idx=1:k;
 idx=randsample(idx,m,true)
 for i=1:k
            new_group_i=find(idx==i);
            
            [a,b,c]=same_rate_f(z,Nj,C,new_group_i,tau_lower,tau_upper);
            centroids(i,:)=[a b c];
 end
            else
                [a,b,c]=same_rate_f(z,Nj,C,new_group_i,tau_lower,tau_upper);
                centroids(i,:)=[a b c];
            end
        end
    end
    iter=iter+1;
end
prob=temp(:,2);








%%
%load("real_data_analysis.mat")
%load("teen.mat")
%load("fake_data.mat")
load("coal_data.mat")

num_of_plots=size(centroids)
num_of_plots=num_of_plots(1)
%%
% Apply kmean to NTDS
%clear
%clc
%[Nj,C,z]=NTDS_f;%read data and prepocessing___
% sub_inde = [1 6 13 16 18];
% Nj(sub_inde)= [];
% C(sub_inde)= [];
% z(sub_inde,:)= [];
% save fake_2.mat Nj C z;
%Event plot by cluster

% m = length(C);
% F1 = @(B,x) (B(1)*(x<=B(2)).*x+(x>B(2)).*(B(1)*B(2)+B(3)*(x-B(2)))); %without intercept  %Form of the equation,two piece linear 
% figure(1)
% subplot(1,2,1)
% hold all
% plot([0,z(1,1:Nj(1))],0:Nj(1),'-k<','MarkerSize',4)
%         plot([0,z(7,1:Nj(7))],0:Nj(7),'-.k*','MarkerSize',5)  
%          plot([0,z(3,1:Nj(3))],0:Nj(3),'-ko','MarkerSize',4)
% legend('1','2','3')
% hold on

%% plot separately
m = length(C);
F1 = @(B,x) (B(1)*(x<=B(2)).*x+(x>B(2)).*(B(1)*B(2)+B(3)*(x-B(2)))); %without intercept  %Form of the equation,two piece linear 
hold all
q=0:1:C(1)

hold all
for n=1:m
    if group(n)==1
    plot([0,z(n,1:Nj(n))],0:Nj(n),'-kx','MarkerSize',4)
    plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),'k--')
    end
end
plot(q,F1([centroids(1,2) centroids(1,1) centroids(1,3)],q),'k--','LineWidth',2.5)

%%
hold all
for n=1:m
      if group(n)==2
      plot([0,z(n,1:Nj(n))],0:Nj(n),'--ks','MarkerSize',4) 
      end
end
plot(q,F1([centroids(2,2) centroids(2,1) centroids(2,3)],q),'k','LineWidth',2.5)

%%
hold all
for n=1:m
      if group(n)==3
      plot([0,z(n,1:Nj(n))],0:Nj(n),':kd','MarkerSize',4)
      end
end
plot(q,F1([centroids(3,2) centroids(3,1) centroids(3,3)],q),'k','LineWidth',2.5)

%%
hold all
for n=1:m
      if group(n)==4
      plot([0,z(n,1:Nj(n))],0:Nj(n),'-.k^','MarkerSize',4)
      end
end
plot(q,F1([centroids(4,2) centroids(4,1) centroids(4,3)],q),'k','LineWidth',2.5)

%% plot the whole picture
m = length(C);
q=0:1:200;
F1 = @(B,x) (B(1)*(x<=B(2)).*x+(x>B(2)).*(B(1)*B(2)+B(3)*(x-B(2)))); %without intercept  %Form of the equation,two piece linear 
figure(1)

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
         plot([0,z(n,1:Nj(n))],0:Nj(n),'-ko','MarkerSize',4,'Color','k')
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

hold all
plot(q,F1([centroids(1,2) centroids(1,1) centroids(1,3)],q),'-.k','MarkerSize',4,'Color','r','LineWidth',2.5)

plot(centroids(1,1),F1([centroids(1,2) centroids(1,1) centroids(1,3)],centroids(1,1)),'-k<','MarkerSize',8,'Color','r')

plot(q,F1([centroids(2,2) centroids(2,1) centroids(2,3)],q),'-.k','MarkerSize',5,'Color','g','LineWidth',2.5)

plot(centroids(2,1),F1([centroids(2,2) centroids(2,1) centroids(2,3)],centroids(2,1)),'-k*','MarkerSize',8,'Color','g')

plot(q,F1([centroids(3,2) centroids(3,1) centroids(3,3)],q),'-.k','MarkerSize',4,'Color','b','LineWidth',2.5)

plot(centroids(3,1),F1([centroids(3,2) centroids(3,1) centroids(3,3)],centroids(3,1)),'-ko','MarkerSize',8,'Color','k')

plot(q,F1([centroids(4,2) centroids(4,1) centroids(4,3)],q),'-.k','MarkerSize',4,'Color','k','LineWidth',2.5)

plot( centroids(4,1),F1([centroids(4,2) centroids(4,1) centroids(4,3)],centroids(4,1)),'-ko','MarkerSize',8,'Color','k')




%%


q=0:1:200;
for i=1:num_of_plots
plot(q,F1([centroids(i,2) centroids(i,1) centroids(i,3)],q),'k','LineWidth',2.5)
%plot(q,F1([centroids(2,2),centroids(2,1),centroids(2,3)],q),'-.k','LineWidth',2.5)
%plot(q,F1([centroids(3,2),centroids(3,1),centroids(3,3)],q),'k','LineWidth',2.5)
end
% subplot(1,2,2)
 hold all
 for i=1:num_of_plots
 plot(q,F1([centroids(i,2) centroids(i,1) centroids(i,3)],q),'k','LineWidth',2.5)
 %plot(q,F1([centroids(3,2),centroids(3,1),centroids(3,3)],q),'k','LineWidth',2.5)
 %plot(q,F1([centroids(4,2),centroids(4,1),centroids(4,3)],q),'k','LineWidth',2.5)
 end

%%
hold all

xlabel('t (hour)')
ylabel('N(t)')
xlim([0 200])
%ylim([0 22])
%set(gca,'YTick',[0:5:22])
set(gca,'XTick',[0:100:475])

%%
% hold all;
% plot(52.30,52.3*0.04894,'k<','MarkerSize',5,'LineWidth','2.5');
% plot(108.99,108.99*0.02789,'k*','MarkerSize',5,'LineWidth','2.5');
% plot(150.20,150.20*0.01876,'ko','MarkerSize',4,'LineWidth','2.5');
% xlabel('t (hour)')
% ylabel('Estimated cumulative intensity')
% xlim([0 475])
% ylim([0 22])
% set(gca,'YTick',[0:5:22])
% set(gca,'XTick',[0:100:475])


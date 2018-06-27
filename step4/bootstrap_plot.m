B=200;
k=2;
m=length(Nj);
tau_lower=0
tau_upper=1000
index=1:m;

centroids_list=cell(1,B);
for i=1:B

ind=datasample(index,m);
dat=z(ind,:);
nj=Nj(ind);
c=C(ind);
[~,centroids_list{i}]=kmeans_r(dat,nj,c,k,tau_lower,tau_upper);
end



centroids=zeros(k,3,B);
count=1;
for i=1:B
    centroids(:,:,count)=autosort(centroids_list{i}); %only apply to the cases when two intensity rates are the same
    count=count+1;
end

low_b = prctile(centroids,2.5,3);
high_b= prctile(centroids,97.5,3);

std_dev=std(centroids,0,3);






%% plot
%% 1
x=zeros(200,1);
interval=100:1:200;
for i=1:200
x(i)=centroids(1,1,i);
end

figure
subplot(2,3,1)
histogram(x,'Normalization','pdf');
hold on

y=normpdf(interval,mean(x),std(x));
plot(interval,y);
         % line plot
title('\tau_1')

%% 2

x=zeros(200,1);
interval=210:1:270
for i=1:200
x(i)=centroids(1,2,i);
end
x=x*1000;

subplot(2,3,2)
histogram(x,'Normalization','pdf');
hold on

y=normpdf(interval,mean(x),std(x));
plot(interval,y);
         % line plot
title('\lambda_{1b}')


%% 3

x=zeros(200,1);
interval=85:1:105;
for i=1:200
x(i)=centroids(1,3,i);
end
x=x*1000;

subplot(2,3,3)
histogram(x,'Normalization','pdf');
hold on

y=normpdf(interval,mean(x),std(x));
plot(interval,y);
         % line plot
title('\lambda_{1a}')

%% 4

x=zeros(200,1);
interval=280:1:310;
for i=1:200
x(i)=centroids(2,1,i);
end


subplot(2,3,4)
histogram(x,'Normalization','pdf');
hold on

y=normpdf(interval,mean(x),std(x));
plot(interval,y);
         % line plot
title('\tau_2')

%% 5

x=zeros(200,1);
interval=210:1:270
for i=1:200
x(i)=centroids(2,2,i);
end
x=x*1000;

subplot(2,3,5)
histogram(x,'Normalization','pdf');
hold on

y=normpdf(interval,mean(x),std(x));
plot(interval,y);
         % line plot
title('\lambda_{2b}')


%% 6

x=zeros(200,1);
interval=85:1:105;
for i=1:200
x(i)=centroids(2,3,i);
end
x=x*1000;

subplot(2,3,6)
histogram(x,'Normalization','pdf');
hold on

y=normpdf(interval,mean(x),std(x));
plot(interval,y);
         % line plot
title('\lambda_{2a}')
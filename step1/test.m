subplot(1,2,2)
hold all
for n=1:m
    if group(n)==2
    %a=plot(q,F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],q),'--k');
    plot(based_on_centroids(n,1),F1([based_on_centroids(n,2) based_on_centroids(n,1) based_on_centroids(n,3)],based_on_centroids(n,1)),'-ko','MarkerSize',4)
    end
end
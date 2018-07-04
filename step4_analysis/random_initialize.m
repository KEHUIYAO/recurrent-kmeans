function centroids=random_initialize(z,Nj,C,k,tau_lower,tau_upper)
    

    m=length(Nj);

    initial_id=1:m;
    
    init_list=zeros(m,3);
    
    for i=initial_id
        [a,b,c]=same_rate_f(z,Nj,C,i,tau_lower,tau_upper);
        init_list(i,:)=[a,b,c];
    end
    
    centroids=kmeans_plus(init_list',k);
    
    centroids=centroids';
    
    
    
end
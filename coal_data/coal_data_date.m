load("coal_data.mat")
centroids

%change_point=cell(1,4);
for i=1:4
    %change_point(i)=
    calculate_date(centroids(i,1))
end

for i=1:3
    %change_point(i)=
    calculate_date(CI_lower(i,1))
end
calculate_date(51.25)


for i=1:2
    %change_point(i)=
    calculate_date(CI_upper(i,1))
end
calculate_date(148)
calculate_date(170)
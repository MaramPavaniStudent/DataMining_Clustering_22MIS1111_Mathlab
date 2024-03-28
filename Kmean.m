
MallCustomers=table2array(MallCustomers);
sa=[];
K=[];
for k=1:20
    [idx, c, sumd] = kmeans(MallCustomers, k);
    sa=[sa sum(sumd)];
    K=[K k];
end  

idx=kmeans(MallCustomers,5);
gscatter(MallCustomers(:,1),MallCustomers(:,2),idx);
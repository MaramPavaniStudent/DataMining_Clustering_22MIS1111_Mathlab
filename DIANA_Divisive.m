
%Step 1--Import Dataset

%Step 2--Take only the AnnualIncome & Spedingscore columns(4 & 5)
MallCustomers=MallCustomers(:,4:5);
%Step 3--Perform Data Preprocessing
%Checking null value is present or not
sum(ismissing(MallCustomers))
%Standardization
MallCustomers.AnnualIncome=(MallCustomers.AnnualIncome-mean(MallCustomers.AnnualIncome))/std(MallCustomers.AnnualIncome);
MallCustomers.SpendingScore=(MallCustomers.SpendingScore-mean(MallCustomers.SpendingScore))/std(MallCustomers.SpendingScore);
%Convert the data from table to array 
MallCustomers=table2array(MallCustomers);
treefigure1=linkage(MallCustomers,'ward');
g=unique(treefigure1(:,3));
m=sort(g);
mk=(m>=1);
m=m(mk);
figure;
pause(5);
for i=1:length(m)
subplot(1,2,1);
H=dendrogram(treefigure1,'ColorThreshold',m(i));
set(H,'LineWidth',3)
c=cluster(treefigure1,'cutoff',m(i),'Criterion','distance');
subplot(1,2,2);
gscatter(MallCustomers(:,1),MallCustomers(:,2),c);
if(i==1)
pause(1);
else
    pause(0.6);
end
if(i~=length(m))
clf
end
end
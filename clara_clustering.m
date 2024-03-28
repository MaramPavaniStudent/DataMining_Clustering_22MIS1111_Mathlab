% Assuming MallCustomers is your data matrix
% First, convert the table to an array if needed
MallCustomers = table2array(MallCustomers);

% Define the input arguments for CLARA
kclus = 5; % Number of desired clusters
vtype = repmat(4, 1, size(MallCustomers, 2)); % Assuming all variables are interval variables
stdize = 1; % Standardize the variables by the mean
metric = 'euclidean'; % Euclidean distance metric (assuming it's 'euclidean' not 'eucli')
nsamp = 5; % Number of samples to be drawn from the data set
sampsize = 40 + 2 * kclus; % Number of observations in each sample

% Perform CLARA clustering
result = clara(MallCustomers, kclus, vtype, stdize, metric, nsamp, sampsize);

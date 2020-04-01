function [mu sigma2] = estimateGaussian(X)
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);
% sigma2 = var(X) % uses 1/(m-1) instead
mu = mean(X);
%mu = (1/m)*sum(X) % same as mean
sigma2 = (1/m)*sum((X-repmat(mu,m,1)).^2);
end

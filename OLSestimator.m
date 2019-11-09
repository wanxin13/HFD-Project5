function [beta] = OLSestimator(y,x)

% compute regular OLS estimator
% Y: N dimension, X: N*(L+1) matrix, beta: L+1 dimension

beta = inv(x'*x)*x'*y
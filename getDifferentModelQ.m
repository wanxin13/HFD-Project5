function [beta_ARQ,beta_HARQ,beta_NCQ] = getDifferentModelQ(y,x)

% Use ARQ, HARQ, No change Model forcast future volatility.
beta_ARQ = OLSestimator(y,x(:,[1,2,3]));
beta_HARQ = OLSestimator(y,x);
beta_NCQ = 1;
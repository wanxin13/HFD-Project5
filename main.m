% main.m
% This script when run should compute all values and make all plots
% required by the project.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

%% Exercise1
N = 78
T = 2769
n = N-1
J = 1000;
alpha = 4.5;

% Compute values
[dates,X] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\VZ5min.csv',0)
[rDates, r] = getReturns(dates, X, N, T);
tau = getTimeOfDay(r,n,T)
cut = getThreshold(r, n, T, tau, alpha)
[rc,rd,count,Jump,tp,ip] = SeparateJumps(r,rDates, n, T, cut)

RV = getRV(r, n, T);
[MSE_AR,MSE_HAR,MSE_NC] = rollingWindow1StepAhead(RV,J,T);
[MSE_AR_1,MSE_HAR_1,MSE_NC_1] = rollingWindow1StepAhead(RV,250,T);
[MSE_AR_2,MSE_HAR_2,MSE_NC_2] = rollingWindow1StepAhead(RV,500,T);

% Make plots
Writetable1E(MSE_AR,MSE_HAR,MSE_NC,J)
Writetable1F(MSE_AR,MSE_HAR,MSE_NC,MSE_AR_1, MSE_HAR_1, MSE_NC_1,MSE_AR_2,MSE_HAR_2, MSE_NC_2)
%% Exercise2
N = 100;
var_x = 25.2;
var_u = 0.50;
beta = 1;
sigma_x = sqrt(var_x);
sigma_u = sqrt(var_u);
sigma_eta = 0.5*sigma_x;

% Compute values
[y,x] = SimLinearY(N,sigma_x,sigma_u,beta);
[beta_hat] = OLSestimator(y,x);

% Simulate 1000 betas
for i = 1:1000
    [Y_s(:,i),X_s(:,i)] = SimLinearY(N,sigma_x,sigma_u,beta);
    [Beta_hat(i,1)] = OLSestimator(Y_s(:,i),X_s(:,i));
end

% Adding noise
[y_n,x_n] = SimLinearY(N,sigma_x,sigma_u,beta);
[beta_hat_n] = OLSestimator(y_n,x_n + normrnd(0,sigma_eta,[N,1]));

for i = 1:1000
    [Y_s(:,i),X_s(:,i)] = SimLinearY(N,sigma_x,sigma_u,beta);
    [Beta_hat_n(i,1)] = OLSestimator(Y_s(:,i),X_s(:,i)+ normrnd(0,sigma_eta,[N,1]));
end

% Make plots
plot2D(Beta_hat);
plot2E(Beta_hat_n);
%% Exercise3
% Compute values
[QIV] = getQIV(rc,n,T);
[MSE_ARQ,MSE_HARQ,MSE_NCQ] = rollingWindow1StepAheadQ(RV,QIV,J,T);
% Make plots
Writetable3A(MSE_AR,MSE_HAR,MSE_NC,MSE_AR_1, MSE_HAR_1, MSE_NC_1,MSE_AR_2,MSE_HAR_2, MSE_NC_2,MSE_ARQ,MSE_HARQ)

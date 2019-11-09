function [] = plot2E(Beta_hat_n)

[f,xi] = ksdensity(Beta_hat_n); 
figure;
plot(xi,f);

ylabel('density');
xlabel('beta');
title('Distribution of Beta');
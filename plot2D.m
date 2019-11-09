function [] = plot2D(Beta_hat)

[f,xi] = ksdensity(Beta_hat); 
figure;
plot(xi,f);

ylabel('density');
xlabel('beta');
title('Distribution of Beta');
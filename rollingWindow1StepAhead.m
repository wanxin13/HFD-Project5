function [MSE_AR,MSE_HAR,MSE_NC] = rollingWindow1StepAhead(RV,J,T)

% get MSE of three RV perdict Model.
count = 0;
for k = 22+J+1: T
    for i = 1:J                     
        y(i,1) = RV(k-i,1);
        x(i,1) = 1;
        x(i,2) = RV(k-i-1,1);
        
        RV_w = 0;
        for w = 1:5
            RV_w = RV_w + RV(k-i-w,1);
        end
        x(i,3) = RV_w /5;
        
        RV_m = 0;
        for m = 1:22
            RV_m = RV_m + RV(k-i-m,1);
        end
        x(i,4) = RV_m /22;
    end
    
    [beta_AR,beta_HAR,beta_NC] = getDifferentModel(y,x);
    RV_AR(k-J-22,1) = [1,y(1,1)]*beta_AR;
    
        RV_w = 0;
        for w = 1:5
            RV_w = RV_w + RV(k-w,1);
        end
        RV_w = RV_w /5;
        
        RV_m = 0;
        for m = 1:22
            RV_m = RV_m + RV(k-m,1);
        end
        RV_m = RV_m /22;
    RV_HAR(k-J-22,1) = [1,y(1,1),RV_w,RV_m]*beta_HAR;
    
    RV_NC(k-J-22,1) = y(1,1)*beta_NC
    count = count+1;
end

MSE_AR = 0;
MSE_HAR = 0;
MSE_NC = 0;
for i = 1:count
    MSE_AR = MSE_AR + (RV_AR(i,1)-RV(22+J+i,1))^2;
    MSE_HAR = MSE_HAR + (RV_HAR(i,1)-RV(22+J+i,1))^2;
    MSE_NC = MSE_NC + (RV_NC(i,1)-RV(22+J+i,1))^2;
end
MSE_AR = MSE_AR /count;
MSE_HAR = MSE_HAR /count;
MSE_NC = MSE_NC /count;


        
function [MSE_ARQ,MSE_HARQ,MSE_NCQ] = rollingWindow1StepAheadQ(RV,QIV,J,T)

% get MSE of three RV perdict Model.
count = 0;
for k = 22+J+1: T
    for i = 1:J                     
        y(i,1) = RV(k-i,1);
        x(i,1) = 1;
        x(i,2) = RV(k-i-1,1);
        x(i,3) = sqrt(QIV(k-i-1,1))*RV(k-i-1,1);
        
        RV_w = 0;
        for w = 1:5
            RV_w = RV_w + RV(k-i-w,1);
        end
        x(i,4) = RV_w /5;
        
        RV_m = 0;
        for m = 1:22
            RV_m = RV_m + RV(k-i-m,1);
        end
        x(i,5) = RV_m /22;
    end
    
    [beta_ARQ,beta_HARQ,beta_NCQ] = getDifferentModelQ(y,x);
    RV_ARQ(k-J-22,1) = [1,RV(k-1,1),sqrt(QIV(k-1,1))*RV(k-1,1)]*beta_ARQ;
 % sanity filter
    mean = 0;
 for j = 1:1000
        mean = mean + RV(k-j,1);
 end
 mean = mean/1000;
 
 max = 0;
 for j = 1:1000
        if RV_ARQ(k-J-22,1)> RV(k-j,1)
            max = max+1;
        end
 end
 min = 0;
 for j = 1:1000
        if RV_ARQ(k-J-22,1)< RV(k-j,1)
            min = min+1;
        end
 end
 if max == 1000 || min == 1000
     RV_ARQ(k-J-22,1) = mean;
 end
    
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
    RV_HARQ(k-J-22,1) = [1,RV(k-1,1),sqrt(QIV(k-1,1))*RV(k-1,1),RV_w,RV_m]*beta_HARQ;
    
max = 0;
 for j = 1:1000
        if RV_HARQ(k-J-22,1)> RV(k-j,1)
            max = max+1;
        end
 end
 min = 0;
 for j = 1:1000
        if RV_HARQ(k-J-22,1) < RV(k-j,1)
            min = min+1;
        end
 end
 if max == 1000 || min == 1000
     RV_HARQ(k-J-22,1) = mean;
 end
    
    RV_NCQ(k-J-22,1) = y(1,1)*beta_NCQ
    count = count+1;
end

MSE_ARQ = 0;
MSE_HARQ = 0;
MSE_NCQ = 0;
for i = 1:count
    MSE_ARQ = MSE_ARQ + (RV_ARQ(i,1)-RV(22+J+i,1))^2;
    MSE_HARQ = MSE_HARQ + (RV_HARQ(i,1)-RV(22+J+i,1))^2;
    MSE_NCQ = MSE_NCQ + (RV_NCQ(i,1)-RV(22+J+i,1))^2;
end
MSE_ARQ = MSE_ARQ /count;
MSE_HARQ = MSE_HARQ /count;
MSE_NCQ = MSE_NCQ /count;


        
        
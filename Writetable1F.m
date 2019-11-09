function []=Writetable1F(MSE_AR,MSE_HAR,MSE_NC,MSE_AR_1, MSE_HAR_1, MSE_NC_1,MSE_AR_2,MSE_HAR_2, MSE_NC_2)

ModelName = [ "AR"; "HAR"; "No Change"];
MSE_RollingWindow250 = [MSE_AR_1; MSE_HAR_1; MSE_NC_1];
MSE_RollingWindow500 = [MSE_AR_2; MSE_HAR_2; MSE_NC_2];
MSE_RollingWindow1000 = [MSE_AR; MSE_HAR; MSE_NC]
T_1F = table( ModelName, MSE_RollingWindow250,MSE_RollingWindow500,MSE_RollingWindow1000);
writetable(T_1F)
function []=Writetable3A(MSE_AR,MSE_HAR,MSE_NC,MSE_AR_1, MSE_HAR_1, MSE_NC_1,MSE_AR_2,MSE_HAR_2, MSE_NC_2,MSE_ARQ,MSE_HARQ)

ModelName = [ "AR"; "HAR"; "No Change";"ARQ";"HARQ"];
MSE_RollingWindow250 = [MSE_AR_1; MSE_HAR_1; MSE_NC_1;"NA";"NA"];
MSE_RollingWindow500 = [MSE_AR_2; MSE_HAR_2; MSE_NC_2;"NA";"NA"];
MSE_RollingWindow1000 = [MSE_AR; MSE_HAR; MSE_NC; MSE_ARQ; MSE_HARQ]
T_3A = table( ModelName, MSE_RollingWindow250,MSE_RollingWindow500,MSE_RollingWindow1000);
writetable(T_3A)
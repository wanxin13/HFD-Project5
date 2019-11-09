function []=Writetable1E(MSE_AR,MSE_HAR,MSE_NC,J)

ModelName = [ "AR"; "HAR"; "No Change"];
DaysinRolling = [J;J;J];
MSE = [MSE_AR; MSE_HAR; MSE_NC];
T_1E = table( ModelName, DaysinRolling, MSE);
writetable(T_1E)
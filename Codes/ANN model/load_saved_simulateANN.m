% load and simulate the saved ANN models
clc;
% clear all;

% subject name
load('./BaifanWu/ANNmodel_DP_BaifanWu_WS_8Hz_PhaseIncluded_SmRange.mat');

results=results_DP_BaifanWu_WS_8Hz_PhaseIncluded_SmRange;
%
net=results.net_DP_BaifanWu_WS_8Hz_PhaseIncluded_SmRange;
info=results.info_DP_BaifanWu_WS_8Hz_PhaseIncluded_SmRange;
output=results.output_DP_BaifanWu_WS_8Hz_PhaseIncluded_SmRange;
error=results.error_DP_BaifanWu_WS_8Hz_PhaseIncluded_SmRange;
input=results.input_DP_BaifanWu_WS_8Hz_PhaseIncluded_SmRange;
target=results.target_DP_BaifanWu_WS_8Hz_PhaseIncluded_SmRange;
% 
% % 1. load the network
% % 2. give the inputs X and run the sim to generate the outputs.
% y_BaifanWu = sim(net,input);
return
% load('./Chen/ANNmodel_DP_Chen_WS_8Hz_PhaseIncluded_SmRange.mat');

load('./HaoWu/ANNmodel_DP_HaoWu_WS_8Hz_PhaseIncluded_SmRange.mat');

results=results_DP_HaoWu_WS_8Hz_PhaseIncluded_SmRange;
%
net=results.net_DP_HaoWu_WS_8Hz_PhaseIncluded_SmRange;
info=results.info_DP_HaoWu_WS_8Hz_PhaseIncluded_SmRange;
output=results.output_DP_HaoWu_WS_8Hz_PhaseIncluded_SmRange;
error=results.error_DP_HaoWu_WS_8Hz_PhaseIncluded_SmRange;
input=results.input_DP_HaoWu_WS_8Hz_PhaseIncluded_SmRange;
target=results.target_DP_HaoWu_WS_8Hz_PhaseIncluded_SmRange;

% 1. load the network
% 2. give the inputs X and run the sim to generate the outputs.
y_HaoWu = sim(net,input);

figure, plot(y_HaoWu'); hold on;
plot(output','--'); hold off;
% this part is matching

histogram(error(1,:));
figure,
histogram(error(2,:));

% plotting regression of targets and outputs 
figure(221);plotregression(target,output);
% figure(222);plotregression(target(1,:),output(2,:));
% figure(223);plotregression(target(2,:),output(1,:));
% figure(224);plotregression(target(2,:),output(2,:));


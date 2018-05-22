% Program %WAMP to find mean, Autocovriance and Autocorrelation for the given data.
% Also, plot the Correlogram. 

clear all 
close all
clc

x = [47 64 23 71 38 64 55 41 59 48]

%STEP1 ==> Find the mean of the data
mean = 0;
for i = 1:length(x)
    mean = mean + x(i);
end
mean = mean/length(x)

%STEP2==> find Deviations
for i = 1:length(x)
    x_meanx(i) = x(i) - mean;
end
x_meanx

co = sum(x_meanx.*x_meanx)/length(x)

lags = input('Enter the number of lags:');
lags = 1:lags;
LagMat = zeros(length(x),lags); 
for i = 1:length(lags)
    for j = i+1:length(x)
        LagMat(j,i) = (x_meanx(j-i))*(x(j) - mean);
    end
    c(i) = sum(LagMat(:,i))/(length(x)-i);
    r(i) = c(i)/co;
end
LagMat 
c
r
stem(r)
xlabel('Lags','Fontsize',12,'Fontweight','bold','Color','black')
ylabel('ACF','Fontsize',12,'Fontweight','bold','Color','black')
title('Correlogram','Fontsize',14,'Fontweight','bold','Color','black')
legend('AutoCorrelations')

% %%%%%%%%%%%%%%%%%%%%%%%OUTPUT%%%%%%%%%%%%%%%%%%%%%%%%%%
% x =
% 
%     47    64    23    71    38    64    55    41    59    48
% 
% 
% mean =
% 
%     51
% 
% 
% x_meanx =
% 
%     -4    13   -28    20   -13    13     4   -10     8    -3
% 
% 
% co =
% 
%   189.6000
% 
% Enter the number of lags:5
% 
% LagMat =
% 
%      0     0     0     0     0
%    -52     0     0     0     0
%   -364   112     0     0     0
%   -560   260   -80     0     0
%   -260   364  -169    52     0
%   -169   260  -364   169   -52
%     52   -52    80  -112    52
%    -40  -130   130  -200   280
%    -80    32   104  -104   160
%    -24    30   -12   -39    39
% 
% 
% c =
% 
%  -166.3333  109.5000  -44.4286  -39.0000   95.8000
% 
% 
% r =
% 
%    -0.8773    0.5775   -0.2343   -0.2057    0.5053
    



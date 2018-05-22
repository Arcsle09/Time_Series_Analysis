%WAMP to determine the Exponential Trend(Y = a.(b^x))using Method of Least Square

clear all;
close all;
clc;

x = input('Enter years:');
y = input('Enter Corrosponding data points:');

plot(x,y,'rh');

k = x(round(length(x)/2))

X = x - k

n = length(x);

%%% 2 Linear Equations %%%%%%%%%
% sumy1 = n*A + B*sumx1;
% sumxy1 = A*sumx1 + B*sumx2;

% To find values of A and B, solve equations using Cramer's Rule.
 
 Y1=log10(y);
 sumy1 = sum(Y1);
 sumx1 = sum(X);
 sumx2 =sum(X.*X);
 sumxy1 = sum(X.*Y1);
 
 D = [n sumx1; sumx1 sumx2] 
 
 D1 = [sumy1 sumx1; sumxy1 sumx2] 
 
 D2 = [n sumy1; sumx1 sumxy1] 
 
 A = det(D1)/det(D)
 
 B = det(D2)/det(D)
 
 a=10^A
 
 b=10^B
 
%%%%%% Dervied Formula to determine A and B %%%%%%%%%%%%%%%%
% A = sumy1/n

% B= sumxy1/sumx2
 
% a=10^A;

% b=10^B;

Y = a.*(b.^X);
fprintf('\n The equation of fitted curve for the given data is Y = %f.*(%f.^X)\n',a,b);

fprintf('\n The comparison of Actual values and estimated values:');

fprintf('\nActual\t\t     Predicted')
fprintf('\n-------------------------')
for i = 1:length(y)
    fprintf('\n%f\t|\t%f',y(i),Y(i));
end

hold on
plot(x,Y,'b--')

xlabel('Years','Fontsize',12)
ylabel('Values','Fontsize',12)
title('Exponential Trend using Method of Least Square','Fontsize',16);
legend('Actual Values','Trend Curve(Exponential)')

%%%% Prediction Program Starts %%%%%%%%
predyear = input('\n\n Enter the year to estimate the value:');

k1 = predyear - x(end);

kp = k1 + X(end); 

format bank 

Y1 = a.*(b.^kp);

fprintf('\nThe estimated value for Year-%d is %f\n',predyear,Y1);


%%%%%%%%%%%%%%%%%%%%%OUTPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enter years:[1997 1998 1999 2000 2001]
% Enter Corrosponding data points:[1.6 4.5 13.8 40.2 125]
% 
% k =
% 
%        1999.00
% 
% 
% X =
% 
%          -2.00         -1.00             0          1.00          2.00
% 
% 
% A =
% 
%           1.14
% 
% 
% B =
% 
%           0.47
% 
% 
% a =
% 
%          13.79
% 
% 
% b =
% 
%           2.98
% 
% 
%  The equation of fitted curve for the given data is Y = 13.793343.*(2.976181.^X)
% 
%  The comparison of Actual values and estimated values:
% Actual		     Predicted
% -------------------------
% 1.600000	 |	1.557223
% 4.500000	 |	4.634578
% 13.800000	 |	13.793343
% 40.200000	 |	41.051487
% 125.000000 |	122.176660
% 
%  Enter the year to estimate the value:2004
% 
% The estimated value for Year-2004 is 3220.819076



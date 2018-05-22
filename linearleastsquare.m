%WAMP to determine the trendline(Straight Line) using Method of Least Square

clear all;
close all;
clc;

x = input('Enter years:');
y = input('Enter Corrosponding data points:');

plot(x,y,'rh');

k = x(round(length(x)/2))

X = x - k

n = length(x);

%%%%%% The Linear Equations %%%%%%%%%%%
% sumy = na + bsumx
% sumxy = asumx + bsumxx

% To find values of a and b, solve equations using Cramer's Rule.

sumx  =  sum(X);
sumy  =  sum(y);
sumx2 = sum(X.*X);
sumxy = sum(X.*y);

D = [n sumx; sumx sumx2]

D1 = [sumy sumx; sumx sumx2]

D2 = [n sumy; sumx sumxy]

a = det(D1)/det(D)

b = det(D2)/det(D)

Y  = a + b*X

%%%Dervied Formula to determine a and b %%%%
%%%%%%%%%% a = sumy/n & b = sumxy/sumxx %%%%

fprintf('\n The equation of fitted line on above data is y = %f + %f*x\n',a,b);

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
title('Trend Line (Straight Line) using Method of Least Square','Fontsize',16);
legend('Actual Values','Trend Line(Straight Line)')

%-------------------------OUTPUT------------------------------% 
% Enter years:1968:1974
% Enter Corrosponding data points:[100 110 130 125 170 168 191]
% Enter the central value of x:1971
% 
% X =
% 
%     -3    -2    -1     0     1     2     3
% 
% 
% D =
% 
%    196
% 
% 
% D1 =
% 
%        27832
% 
% 
% D2 =
% 
%         3003
% 
% 
% a =
% 
%    142
% 
% 
% b =
% 
%    15.3214
% 
% 
% Y =
% 
%    96.0357  111.3571  126.6786  142.0000  157.3214  172.6429  187.9643
% 
% 
%  The equation of fitted line on above data is y = 142.000000 + 15.321429*x
% 
%  The comparison of Actual values and estimated values:
% Actual		     Predicted
% ----------------------------
% 100.000000	|	96.035714
% 110.000000	|	111.357143
% 130.000000	|	126.678571
% 125.000000	|	142.000000
% 170.000000	|	157.321429
% 168.000000	|	172.642857
% 191.000000	|	187.964286




%Practical - 4
%WAMP to plot the TrendLine(Parabolic Curve) using Method of Least Square

clear all
close all
clc

x = input('Enter years:');
y = input('Enter Corrosponding data points:');

plot(x,y,'rh');

k = x(round(length(x)/2))

X = x - k;

n = length(x);

%%%%%%%%%%% The Quadratic Equations %%%%%%%%%%%%%%%
% 
% sumy = n*a + b*sumx + c*sumxx
% 
% sumxy = asumx + b*sumxx + c*sumxxx
% 
% sumxxy= asumxx + bsumxxx + c*sumxxxx


% To find values of a,b and c, solve above equations using Cramer's Rule.

sumx = sum(X);
sumy = sum(y);
sumx2 =sum(X.*X);
sumx3 = sum(X.*X.*X);
sumx4 = sum(X.*X.*X.*X);
sumxy = sum(X.*y);
sumx2y = sum(X.*X.*y);

D = [n sumx sumx2; sumx sumx2 sumx3; sumx2 sumx3 sumx4]

D1 = [sumy sumx sumx2; sumxy sumx2 sumx3; sumx2y sumx3 sumx4]

D2 = [n sumy sumx2; sumx sumxy sumx3; sumx2 sumx2y sumx4]

D3 = [n sumx sumy; sumx sumx2 sumxy; sumx2 sumx3 sumx2y]

a = det(D1)/det(D)

b = det(D2)/det(D)

c = det(D3)/det(D)

Y  = a + b.*X + c.*X.*X

fprintf('\n The equation of fitted curve on above data is y = %f + %f*x + %f*x^2\n',a,b,c);

fprintf('\n The comparison of Actual values and Estimated Values:\n');

fprintf('\nActual\t\t     Predicted')
fprintf('\n-------------------------')
for i = 1:length(y)
    fprintf('\n%f\t|\t%f',y(i),Y(i));
end

hold on
plot(x,Y,'b--')

xlabel('Years','Fontsize',12)
ylabel('Data Values','Fontsize',12)
title('Trend Line(Parabolic Curve) using Method of Least Square','Fontsize',16);
legend('Actual Values','Trend Line(Parabolic Curve)')

% ------------------------------------OUTPUT-------------------------------
% Enter years:1998:2003
% Enter Corrosponding data points:[100 107 120 140 181 192]
% Enter the central value of x:2000
% 
% D =
% 
%      6     3    19
%      3    19    27
%     19    27   115
% 
% 
% D1 =
% 
%            3          19         840
%           19          27         771
%           27         115        3099
% 
% 
% D2 =
% 
%            6         840          19
%            3         771          27
%           19        3099         115
% 
% 
% D3 =
% 
%            6           3         840
%            3          19         771
%           19          27        3099
% 
% 
% a =
% 
%   123.6857
% 
% 
% b =
% 
%    17.7000
% 
% 
% c =
% 
%     2.3571
% 
% 
% Y =
% 
%    97.7143  108.3429  123.6857  143.7429  168.5143  198.0000
% 
% 
%  The equation of fitted curve on above data is y = 123.685714 + 17.700000*x + 2.357143*x^2
% 
%  The comparison of Actual values and Estimated Values:
% 
% Actual		     Predicted
% -------------------------
% 100.000000	|	97.714286
% 107.000000	|	108.342857
% 120.000000	|	123.685714
% 140.000000	|	143.742857
% 181.000000	|	168.514286
% 192.000000	|	198.000000
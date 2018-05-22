clear all
close all
clc

format bank

x = input('Enter Year:');
y = input('Enter corrosponding value:');

m= length(x);

if rem(m,2) == 0
    k = m/2
    ya = y(1:k)
    yb = y(k+1:m)
    k1 = fix((1+k)/2)
    k2 = fix(((1+k)+m)/2)
    m_ya = mean(ya)
    m_yb = mean(yb)
    x(k1) = x(k1) + 0.5
    x(k2) = x(k2) + 0.5
fprintf('Average for first group is');
m_ya
fprintf('Average for second group is');
m_yb
m_ya = mean(ya)
m_yb = mean(yb)
else
    k = (m-1)/2
    ya = y(1:k)
    yb = y(k+2:m)
    k1 = (1+k)/2
    k2 = ((k+2)+m)/2
fprintf('First group of data using method of semi average is \n')
ya
fprintf('Second group of data using method of semi average is \n')
yb

m_ya = mean(ya);
m_yb = mean(yb);

fprintf('Average for first group is');
m_ya
fprintf('Average for second group is');
m_yb
end
plot(x,y,'go-')
hold on
plot(x(k1),m_ya,'r*')
hold on
plot(x(k2),m_yb,'r*')
hold on

% a = m_ya
% b = (m_yb - m_ya)/(x(k2)- x(k1))

Y = ((x - x(k1))/(x(k2) - x(k1)))*(m_yb - m_ya) + m_ya;

plot(x,Y,'k--')

fprintf('The trendline is as shown in figure:');

%PREDICTING PROGRAM STARTS FROM HERE%
p = input('\n Enter the year for prediction:');

x_new = x(end):p+5

yp = ((p-x(k1))/(x(k2)-x(k1)))*(m_yb - m_ya) + m_ya

fprintf('\n The predicted value for year %d is %f',p,yp)

hold on

plot(p,yp,'rh')

hold on

plot(x_new,yp,'k--')
xlabel('Years','Fontsize',12)
ylabel('Data Values','Fontsize',12)
title('Predicted Data Value for year 2002 using Semi Average Method','Fontsize',16);
legend('Actual Data Values','Average of First group','Average of Second group',' A Line joining 2 Averages and Predicted Value','Predicted Value');


%%%%%%%%%%%%%%%%%%%%%%%%%OUTPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
%%%%%%%%%%%%%%%%%%%ODD CASE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enter Year:1993:1999
% Enter corrosponding value:[102 105 114 110  108 116 112]
% First group of data using method of semi average is 
% 
% ya =
% 
%         102.00        105.00        114.00
% 
% Second group of data using method of semi average is 
% 
% yb =
% 
%         108.00        116.00        112.00
% 
% Average for first group is
% m_ya =
% 
%         107.00
% 
% Average for second group is
% m_yb =
% 
%         112.00
% 
% The trendline is as shown in figure:
%  Enter the year for prediction:2002
% 
%  The predicted value for year 2002 is 117.000000>> 

%%%%%%%%%%%%%%%%%%%%%%%%EVEN CASE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enter Year:1993:2002
% Enter corrosponding value:[102 105 114 110 108 116 112 114 119 125]
% 
% x =
% 
%        1993.00       1994.00       1995.50       1996.00       1997.00       1998.00       1999.00       2000.00       2001.00       2002.00
% 
% 
% x =
% 
%        1993.00       1994.00       1995.50       1996.00       1997.00       1998.00       1999.00       2000.50       2001.00       2002.00
% 
% Average for first group is
% m_ya =
% 
%         107.80
% 
% Average for second group is
% m_yb =
% 
%         117.20
% 
% The trendline is as shown in figure:
% 
% Enter the year for prediction:2003
% 
% The predicted value for year 2003 is 121.900000>>


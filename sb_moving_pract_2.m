close all
clear all
clc

x = input('Enter year : ');
y = input('Enter corresponding values : ');
plot(x,y,'ro')
m = input('Enter the order of the moving average :');

if rem(m,2)~=0
    fprintf('Odd Case')
    k = length(x)-m+1;
    for i=1:k
        T = y(i:m+i-1);
        M(i) = sum(T)/m;
    end
    M
    hold on
    d = fix(m/2);
    x_new = x+d:x(end)-d
    plot(x_new,M,'k--')
    title('Trend Line using Method of Moving Average(Odd Case)','Fontsize',16);
else
    fprintf('Even Case')
    k = length(x)-m+1;
    for i=1:k
        T = y(i:m+i-1);
        M(i) = sum(T)/m;
    end
    M
     hold on
     format bank
     d = m/2;
     x_new = x+d - 0.5:x(end)-d + 0.5
     plot(x_new,M,'k--')
     title('Trend Line using Method of Moving Average(Even Case)','Fontsize',16);
end
     xlabel('Years','Fontsize',12)
     ylabel('Data Values','Fontsize',12)
     fprintf('The trendline of %d - Yearly Moving Average is as shown in figure:',m);
     legend('Actual Data Values','Trend Line joining Moving Averages');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OUTPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%Odd Case%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enter year : 1995:2005
% Enter corresponding values : [12 14 18 24 22 20 16 25 26 34 31]
% Enter the order of the moving average :5
% Odd Case
% M =
% 
%          18.00         19.60         20.00         21.40         21.80         24.20         26.40
% 
% 
% x_new =
% 
%        1997.00       1998.00       1999.00       2000.00       2001.00       2002.00       2003.00
% 
% The trendline of 5 - Yearly Moving Average is as shown in figure:>> 

%%%%%%%%%%%%%%%%%%%%Even Case%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enter year : 1997:2008
% Enter corresponding values : [75 62 76 78 94 84 96 128 116 176 102 162]
% Enter the order of the moving average :4
% Even Case
% M =
% 
%          72.75         77.50         83.00         88.00        100.50        106.00        129.00        130.50        139.00
% 
% 
% x_new =
% 
%        1998.50       1999.50       2000.50       2001.50       2002.50       2003.50       2004.50       2005.50       2006.50
% 
% The trendline of 4 - Yearly Moving Average is as shown in figure:>> 


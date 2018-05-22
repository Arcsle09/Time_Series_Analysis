close all
clear all
clc
format bank

filename = 'weekly-closing-price-of-att-comm.xls';
sheet = 1;
xlRange = 'B14:B65';
y = xlsread(filename,sheet,xlRange);
size(y)
plot(y,'ro-')
title('Weekly Closing Prices of AT&T common shares 1979')
xlabel('Months')
datetick('x',3)
ylabel('Closing Price')
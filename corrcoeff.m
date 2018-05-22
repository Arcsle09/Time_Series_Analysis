%WAMP to find the correlation coefficient of 2 variables %%%%
clear all
close all
clc

x = [589.400024 584.849976 581.049988 558.799988 553.599976 552.650024 568.950012 548.849976 542.450012 541.400024]

y = [255.100006 251.75 255.399994 253.949997 259.399994 270.799988 291.350006 299.25 296.850006 297.100006]

sumx = sum(x);
sumy = sum(y);

sumxy = sum(x.*y);

sumxx = sum(x.*x)';`    

sumyy = sum(y.*y);

%Correlation Coefficient
fprintf('The correlation coefficient is:'); 
format bank
r  = (length(x)*sumxy - sumx*sumy)/(sqrt((length(x)*sumxx - sumx*sumx)*(length(x)*sumyy - sumy*sumy)))





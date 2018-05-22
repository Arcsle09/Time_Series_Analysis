% Seasonal Variations(S) using Method of Ratio to Moving Average(MA) 

clear all;
close all;
clc;

n=input('How many years are there?:');
m = 4; %% We have Quarterly Data 
    for i=1:n
        for j=1:m
        fprintf('Enter data year %d and quarter %d:',i,j);
        D(i,j)=input('');
        end
    end
     d = zeros(m*n,5);

     d(:,1) = reshape(D',m*n,1);
 
fprintf('\n4-Quarterly Moving Total:\n')  
     k = length(d)-m+1;
    for i=1:k
        T = d(i:m+i-1);
        MT1(i) = sum(T);
    end
    
    MT1
  
    k = length(d)-m;
   for i=1:k
        T = MT1(i:(m-2)+i-1);
        MT2(i) = sum(T);
        MA_cent(i) = MT2(i)/(m*2);
   end
   fprintf('\n2-Quarterly Moving Total:\n')
   MT2
   fprintf('\nCentered Moving Average:\n')
   MA_cent
   
  
   fprintf('\n Ratio to Moving Average:\n')
   for i = 1:k
       RToMA(i) = (d(i+(m-2))/MA_cent(i))*100;
   end
   
   RToMA;
   
   RtoMA = [0,0,RToMA,0,0];
   
   RtoMA = vec2mat(RtoMA,m)
   
   for i = 1:m
       SI(i) = sum(RtoMA(:,i))/(m-1);
   end
   fprintf('\nThe Seasonal Indices are:\n');
   SI
   
   if(sum(SI)==400)
       
       fprintf('The sum of all Seasonal Indices is 400');
   else
       Corr_Fact = 400/sum(SI)
       fprintf('\nThe corrected Seasonal Indices are:\n');
       New_SI = Corr_Fact*SI 
       fprintf('\nThe sum of all above new seasonal indices is %f\n',sum(New_SI));
   end
  
%%%%%%%%%%%%%%%%%%%%%%%%%%OUTPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% How many years are there?:4
% Enter data for year 1 and quarter 1 :75
% Enter data for year 1 and quarter 2 :60
% Enter data for year 1 and quarter 3 :54
% Enter data for year 1 and quarter 4 :59
% Enter data for year 2 and quarter 1 :86
% Enter data for year 2 and quarter 2 :65
% Enter data for year 2 and quarter 3 :63
% Enter data for year 2 and quarter 4 :80
% Enter data for year 3 and quarter 1 :96
% Enter data for year 3 and quarter 2 :72
% Enter data for year 3 and quarter 3 :66
% Enter data for year 3 and quarter 4 :85
% Enter data for year 4 and quarter 1 :100
% Enter daa  for year 4 and quarter 2 :78
% Enter data for year 4 and quarter 3 :72
% Enter data for year 4 and quarter 4 :93
% 
% 4-Quarterly Moving Total:
% 
% MT1 =
% 
%    248   259   264   273   294   304   311   314   319   323   329   335   343
% 
% 
% 2-Quarterly Moving Total:
% 
% MT2 =
% 
%    507   523   537   567   598   615   625   633   642   652   664   678
% 
% 
% Centered Moving Average:
% 
% MA_cent =
% 
%    63.3750   65.3750   67.1250   70.8750   74.7500   76.8750   78.1250   79.1250   80.2500   81.5000   83.0000   84.7500
% 
% 
%  Ratio to Moving Average:
% 
% RtoMA =
% 
%          0         0   85.2071   90.2486
%   128.1192   91.7108   84.2809  104.0650
%   122.8800   90.9953   82.2430  104.2945
%   120.4819   92.0354         0         0
% 
% 
% The Seasonal Indices are:
% 
% SI =
% 
%   123.8270   91.5805   83.9103   99.5360
% 
% 
% Corr_Fact =
% 
%     1.0029
% 
% 
% The corrected Seasonal Indices are:
% 
% New_SI =
% 
%   124.1829   91.8436   84.1515   99.8220
% 
% 
% The sum of all above new seasonal indices is 400.000000
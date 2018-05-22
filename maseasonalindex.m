% WAMP to determine Seasonal Variations(S) for Monthly Data or Quarterly Data By Method of "Simple Average"
clear all;
close all;
clc;

choice = input('\nEnter ''Month'' to find Seasonal Index for Monthly Data \nEnter ''Quarter'' to find Seasonal Index for Quarterly Data\n');

if strcmp(choice,'Month')
    m=12;
    
else strcmp(choice,'Quarter'); 
    m=4;
end

 n=input('How many years are there?:');
    d=zeros(m,n+2);
    for i=1:n
        for j=1:m
        fprintf('Enter for year %d and %s %d :',i,choice,j);
        d(i,j)=input('');
        end
    end
     d = d';
     for i = 1:m
         d(i,n+1) = sum(d(i,:))/n;
     end
     
     fprintf('\nThe %sly average of given data is given by\n',choice);
     d(1:m,n+1)
     AMA = sum(d(:,n+1))/m;
     fprintf('\nThe average of all %sly averages is %f.\n',choice,AMA);
     for i= 1:m
         d(i,n+2) = (d(i,n+1)/AMA)*100;
     end
     fprintf('\nThe Seasonal Indices of %sly averages is given by\n',choice);
     d(1:m,n+2)
     fprintf('\nSum of all Seasonal Indices of %sly averages should be %f\n',choice,sum(d(:,n+2)))

 %%%%%%%%%Final Table with all the values %%%%%%%%%%%%%%%%%%%%%%%%
 if strcmp(choice,'Quarter')
numobs = size(d(1:m,n+2),1);
nameobs = strcat({'Quarter - '},num2str((1:numobs)','%d'));
FinalTable = dataset({d(1:m,1:n+2),'Year  2000','Year  2001','Year  2002','Year  2003','Year  2004','Quarterly Mean','Seasonal Index'},'ObsNames',nameobs)

 else strcmp(choice,'Month')

numobs = size(d(1:m,1:n+2),1);
nameobs = strcat({'Month - '},num2str((1:numobs)','%d'));
FinalTable = dataset({d(1:m,1:n+2),'Year 2002','Year 2003','Year 2004','Monthly Mean','Seasonal Index'},'ObsNames',nameobs)

 end


%%%%%%%%%%%%%%%%%%OUTPUT FOR QUARTERLY DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Enter 'Month' to find Seasonal Index for Monthly Data 
% Enter 'Quarter' to find Seasonal Index for Quarterly Data
% 'Quarter'
% How many years are there?:5
% Enter for year 1 and Quarter 1 :45
% Enter for year 1 and Quarter 2 :54
% Enter for year 1 and Quarter 3 :72
% Enter for year 1 and Quarter 4 :60
% Enter for year 2 and Quarter 1 :48
% Enter for year 2 and Quarter 2 :56
% Enter for year 2 and Quarter 3 :63
% Enter for year 2 and Quarter 4 :56
% Enter for year 3 and Quarter 1 :49
% Enter for year 3 and Quarter 2 :63
% Enter for year 3 and Quarter 3 :70
% Enter for year 3 and Quarter 4 :65
% Enter for year 4 and Quarter 1 :52
% Enter for year 4 and Quarter 2 :65
% Enter for year 4 and Quarter 3 :75
% Enter for year 4 and Quarter 4 :72
% Enter for year 5 and Quarter 1 :60
% Enter for year 5 and Quarter 2 :70
% Enter for year 5 and Quarter 3 :84
% Enter for year 5 and Quarter 4 :66
% 
% The Quarterly average of given data is given by
% 
% ans =
% 
%    50.8000
%    61.6000
%    72.8000
%    63.8000
% 
% 
% The average of all Quarterly averages is 62.250000.
% 
% The Seasonal Indices of Quarterly averages is given by
% 
% ans =
% 
%    81.6064
%    98.9558
%   116.9478
%   102.4900
% 
% Sum of all Seasonal Indices of Quarterly averages should be 400.000000
% 
% FinalTable = 
% 
%                    Year2000    Year2001    Year2002    Year2003    Year2004    QuarterlyMean    SeasonalIndex
%     Quarter - 1    45          48          49          52          60          50.8             81.606       
%     Quarter - 2    54          56          63          65          70          61.6             98.956       
%     Quarter - 3    72          63          70          75          84          72.8             116.95       
%     Quarter - 4    60          56          65          72          66          63.8             102.49  

%%%%%%%%%%%%%%%%%%%%%%%%%%%OUTPUT FOR MONTHLY DATA%%%%%%%%%%%%%%%%%%%%%%%

% Enter 'Month' to find Seasonal Index for Monthly Data 
% Enter 'Quarter' to find Seasonal Index for Quarterly Data
% 'Month'
% How many years are there?:3
% Enter for year 1 and Month 1 :15
% Enter for year 1 and Month 2 :16
% Enter for year 1 and Month 3 :18
% Enter for year 1 and Month 4 :18
% Enter for year 1 and Month 5 :23
% Enter for year 1 and Month 6 :23
% Enter for year 1 and Month 7 :20
% Enter for year 1 and Month 8 :28
% Enter for year 1 and Month 9 :29
% Enter for year 1 and Month 10 :33
% Enter for year 1 and Month 11 :33
% Enter for year 1 and Month 12 :38
% Enter for year 2 and Month 1 :23
% Enter for year 2 and Month 2 :22
% Enter for year 2 and Month 3 :28
% Enter for year 2 and Month 4 :27
% Enter for year 2 and Month 5 :31
% Enter for year 2 and Month 6 :28
% Enter for year 2 and Month 7 :22
% Enter for year 2 and Month 8 :28
% Enter for year 2 and Month 9 :32
% Enter for year 2 and Month 10 :37
% Enter for year 2 and Month 11 :34
% Enter for year 2 and Month 12 :44
% Enter for year 3 and Month 1 :25
% Enter for year 3 and Month 2 :25
% Enter for year 3 and Month 3 :35
% Enter for year 3 and Month 4 :36
% Enter for year 3 and Month 5 :36
% Enter for year 3 and Month 6 :30
% Enter for year 3 and Month 7 :30
% Enter for year 3 and Month 8 :34
% Enter for year 3 and Month 9 :38
% Enter for year 3 and Month 10 :47
% Enter for year 3 and Month 11 :41
% Enter for year 3 and Month 12 :53
% 
% The Monthly average of given data is given by
% 
% ans =
% 
%     21
%     21
%     27
%     27
%     30
%     27
%     24
%     30
%     33
%     39
%     36
%     45
% 
% 
% The average of all Monthly averages is 30.000000.
% 
% The Seasonal Indices of Monthly averages is given by
% 
% ans =
% 
%    70.0000
%    70.0000
%    90.0000
%    90.0000
%   100.0000
%    90.0000
%    80.0000
%   100.0000
%   110.0000
%   130.0000
%   120.0000
%   150.0000
% 
% Sum of all Seasonal Indices of Monthly averages should be 1200.000000
% 
% FinalTable = 
%                   Year2002    Year2003    Year2004    MonthlyMean    SeasonalIndex
%     Month -  1    15          23          25          21              70          
%     Month -  2    16          22          25          21              70          
%     Month -  3    18          28          35          27              90          
%     Month -  4    18          27          36          27              90          
%     Month -  5    23          31          36          30             100          
%     Month -  6    23          28          30          27              90          
%     Month -  7    20          22          30          24              80          
%     Month -  8    28          28          34          30             100          
%     Month -  9    29          32          38          33             110          
%     Month - 10    33          37          47          39             130          
%     Month - 11    33          34          41          36             120          
%     Month - 12    38          44          53          45             150 


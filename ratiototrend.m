% WAMP to find Seasonal Variations using Ratio to Trend Method 

close all
clear all
clc

n=input('How many years are there?:');
 
% y = input('\nEnter years:');

y = [1980 1981 1982 1983 1984]

m = 4; %%We have Quarterly Data 

M1 = [30 40 36 34; 34 52 50 44; 40 58 54 48; 54 76 68 62;80 92 86 82]
% %%%%%%%%% Enter the Quarterly Data Values %%%%%%%%%%%%%%%%%%%
%     for i=1:n
%         for j=1:m
%         fprintf('Enter data for year %d and quarter %d :',i,j);
%         M1(i,j)=input('');
%         end
%     end
%     M1;

% STEP:1 ==> Find the Annual Trend Values using Least Square Method %%%% 	
	
    for i = 1:length(y)
        Ym(i) = sum(M1(i,:))/m;
    end
    
    Ym
    
    k = y(round(length(y)/2))

    X = y - k

    l = length(y)
    
%%%%%%%%%%%%%%%% The Linear Equations %%%%%%%%%%%%%%%
               % [sumy =  la    + bsumx ]
               % [sumxy = asumx + bsumxx]
% To find values of a and b, solve equations using Cramer's Rule.

sumx = sum(X);
sumy = sum(Ym);
sumx2 =sum(X.*X);
sumxy = sum(X.*Ym);

D = [l sumx; sumx sumx2];

D1 = [sumy sumx; sumxy sumx2];

D2 = [l sumy ; sumx sumxy];

a = det(D1)/det(D)

b = det(D2)/det(D) 

fprintf('\n\nAnnual Trend values using Least Square Method are:');

for i = 1:l
    T(i) = a + b*X(i);
end
T

% STEP:2 ==> Find the yearly and Quarterly increments from Slope(b) Value %%

Q = b/m;

fprintf('\n\nThe yearly increase in sales is %d. \n\nTherefore, the quarterly increment will be %d',b,Q);

% STEP:3 ==> Find the Quarterly Trend Values from Annual Trend Values and Quarterly Increments%% 
fprintf('\n\n The Quarterly Trend Values are:');
M2 = zeros(length(y),m); 
for i = 1:length(y)
M2(i,2) = T(i) - (Q/2);
M2(i,3) = T(i) + (Q/2);
M2(i,1) = M2(i,2) - Q;
M2(i,4) = M2(i,3) + Q;
end
M2

% STEP:4 ==> Find the Deviations by Ratio of Original Data Values and Quarterly Trend Values%%

fprintf('\n\nThe Ratio to Trend Data Values are below:')
	for i = 1:length(y)
		for j  = 1:m
		RtoT(i,j) = (M1(i,j)/M2(i,j))*100;
		end 
	end
RtoT

% STEP:5 ==> Find the Seasonal Indexes of Every Quarter %%%%%%  

fprintf('\n\nThe Seasonal Indexes of Every Quarter:');
	for i = 1:m
		SI(i) = sum(RtoT(:,i))/length(y);
    end
SI

% STEP:6 ==> Check whether the sum of SI is 400 %%%%%%%%
if(sum(SI)==400)
       
       fprintf('The sum of all Seasonal Indices is 400');
   else
       Corr_Fact = (sum(SI)/400)*100
       
       fprintf('\nThe Corrected Seasonal Indexes are:\n');
       New_SI_Index = (SI/Corr_Fact)* 100 
       fprintf('\nThe sum of all above new seasonal Indexes is %f\n',sum(New_SI_Index));
end

%%%%%%%%%%%%%%%%%%%%%OUTPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% How many years are there?:5
% 
% Enter years:[1980 1981 1982 1983 1984]
% Enter data for year 1 and quarter 1 :30
% Enter data for year 1 and quarter 2 :40
% Enter data for year 1 and quarter 3 :36
% Enter data for year 1 and quarter 4 :34
% Enter data for year 2 and quarter 1 :34
% Enter data for year 2 and quarter 2 :52
% Enter data for year 2 and quarter 3 :50
% Enter data for year 2 and quarter 4 :44
% Enter data for year 3 and quarter 1 :40
% Enter data for year 3 and quarter 2 :58
% Enter data for year 3 and quarter 3 :54
% Enter data for year 3 and quarter 4 :48
% Enter data for year 4 and quarter 1 :54
% Enter data for year 4 and quarter 2 :76
% Enter data for year 4 and quarter 3 :68
% Enter data for year 4 and quarter 4 :62
% Enter data for year 5 and quarter 1 :80
% Enter data for year 5 and quarter 2 :92
% Enter data for year 5 and quarter 3 :86
% Enter data for year 5 and quarter 4 :82
% 
% Ym =
% 
%     35    45    50    65    85
% 
% 
% k =
% 
%         1982
% 
% 
% X =
% 
%     -2    -1     0     1     2
% 
% 
% l =
% 
%      5
% 
% 
% a =
% 
%     56
% 
% 
% b =
% 
%     12
% 
% 
% 
% Annual Trend values using Least Square Method are:
% T =
% 
%     32    44    56    68    80
% 
% 
% The yearly increase in sales is 12. 
% 
% Therefore, the quarterly increment will be 3
% 
%  The Quarterly Trend Values are:
% M2 =
% 
%    27.5000   30.5000   33.5000   36.5000
%    39.5000   42.5000   45.5000   48.5000
%    51.5000   54.5000   57.5000   60.5000
%    63.5000   66.5000   69.5000   72.5000
%    75.5000   78.5000   81.5000   84.5000
% 
% 
% 
% The Ratio to Trend Data Values are below:
% RtoT =
% 
%   109.0909  131.1475  107.4627   93.1507
%    86.0759  122.3529  109.8901   90.7216
%    77.6699  106.4220   93.9130   79.3388
%    85.0394  114.2857   97.8417   85.5172
%   105.9603  117.1975  105.5215   97.0414
% 
% 
% 
% The Seasonal Indexes of Every Quarter:
% SI =
% 
%    92.7673  118.2811  102.9258   89.1540
% 
% 
% Corr_Fact =
% 
%   100.7820
% 
% 
% The Corrected Seasonal Indexes are:
% 
% New_SI_Index =
% 
%    92.0474  117.3633  102.1271   88.4622
% 
% 
% The sum of all above new seasonal Indexes is 400.000000
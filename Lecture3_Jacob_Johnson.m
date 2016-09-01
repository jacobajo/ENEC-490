%%%%%%%Practice from Notes%%%%%%%

z = randn(50,50);

aveRow = mean(z,2); 
%Note:2 always denotes applying the fnc for rows 
stdRow = std(z,0,2);

minimumrow = min(z,[],2);

maximumrow = max(z,[],2);

minimumcol = min(z); 

maximumcol = max(z);

covMatrix = cov(z);

corrMatrix = corrcoef(z);

[minimum index] = min(z);

[maximum index] = max(z); 

sortedx = sort(z);

sortedrow = sort(z,2);

[sortedCol indexCol] = sort(z);
%Note:returns the location of each sorted value

[sortedrow indexrow] = sort(z,2);

x = [1:100]';
y = 5*x + 125+100*rand(100,1);
plot(x,y,'o');
alpha = .05;

[b bCI] = regress(y,x,alpha);

[b bCI] = regress(y, [ones(length(x),1) x],alpha);
%unsure about this ones and length function and how it relates to k

x1 = zeros(100,1);
x2 = zeros(100,1);
x3 = zeros(100,1);
for x = 1:100;
    x1(x) = x + 40 +35*randn(1,1);
    x2(x) = x - 100 - 50*randn(1,1);
    x3(x) = x1(x)*x2(x);
end
%Note:x3 here is defined as zeros but they are filled in with the 
%values of the fnc when x is inputted into the equation 

y = 2*x1 + 63*x2 + 3.5*x3 + 500 + 400*randn(100,1);
X = [ones(100,1) x1 x2 x3];
%Why is this ones function necessary?
[b bCI res] = regress(y,X);

for y = 1:20;
    A = [1 1; -1 1/1.1];
    b = [y; (8/1.1 - 8)];
    %x(:,y) = A\b;
end

A = [2 -1 0; -1 0 -1; 0 1 -1];
b = [4; -10 ; 0];
x = A\b;


%Class Example Work 

%Do the First Functions Question for Homework 

%Problem Solving 

%1 

[Num] = xlsread('Natural Gas Prices');
check = length(Num)/12;

x = annual_profile(Num)
for a = 1:72
    subplot(1,2,a)
    y = boxplot(Num)
    plot(x,y)
end 

    
%Past example%
x = 0:.1:2*pi;
figure(3)
for a = 1:4
    subplot(2,2,a)
    y = cos(x - (a-1)/2);
    plot(x,y);
end 





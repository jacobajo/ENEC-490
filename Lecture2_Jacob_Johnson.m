%1

q1 = cos(0):0.02:log10(100)
q1(25)
length(q1)


%2

%first way of attempting it 

syms x y z 
eqn1 = 6*x + 12*y + 4*z == 70
eqn2 = 7*x + (-2)*y + 3*z == 5
eqn3 = 2*x + 8*y + (-9)*z == 64

sol = solve([eqn1, eqn2, eqn3], [x, y, z]);
xSol = sol.x
ySol = sol.y
zSol = sol.z


%Second way of attempting it.  I ended up doing this twice b/c
%it was not working initially but I believe they both work now. 

syms x y z 
eqn1 = 6*x + 12*y + 4*z == 70
eqn2 = 7*x + (-2)*y + 3*z == 5
eqn3 = 2*x + 8*y + (-9)*z == 64

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3], [x, y, z])

A = [6 12 4; 7 -2 3; 2 8 -9]
B = [70; 5; 64]

X = linsolve(A,B)

%Jacob, you can just do x = A\B. Just realized we don't cover that until session 6.

%3 
q3=500*rand(50,50)

%you don't really need the next two lines..
%q3 = q3>400
%x = zeros(50,50)

x = q3 >400 

%Note: I belive this is correct but I am unsure about the 
%logic of lines 46 and 48.  How are the numbers over 400 
%replaced by 1s? Why is it necessary for line 48 to still 
%have ">400" if it was already defined as such? 

%here the logical operator ">" 400 is applied to every element of q3, and returns a 1 for every instance where q3 > 400 and a 0 if not. 
%by storing this output in the variable x, you're creating a matrix of ones and zeros. 


%4

x = 1000*rand(100,1)

for i = 1:100
y=0.3*x(i)^3-2*x(i)^2+200*x(i);
end
d=[x y]
plot(x,y) 

%Not sure if this is the correct method here.  I believe I
%created a matrix for the y values but there may be a better 
%way to do this. The plot is definitely incorrect it
%looks like a kindergartener went crazy with a box of crayons.  

%This is correct! 

%5

q3=500*rand(50)

x = q3 >=350

[rows,columns] = size(x);
for i = 1:rows
    for j = 1:columns
    vector((i-1)*columns + j) = x(i,j);  
    %i might have written this incorrectly in class... switched rows for columns here
    end
end

plot(vector)

%Still a little shaky with this.  The size function just 
%counts the number of digits in the matrix right? Also unsure
%how to plot this.  

%size identifies the number of rows and columns in the matrix. 


%Middle Section to open different excel files 

[NUM WORD COMBINED] = xlsread('EIA_New_York_Harbor_Gas_Prices 86-16.xlsx')

%Not sure why I could not open this. I checked spelling and the folders
%and everything seemed correct. 

%I think you need underscores instead of spaces. If that doesn't work try renaming the excel file something simple, "gasprices.xlsx", and try importing then.


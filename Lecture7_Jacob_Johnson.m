%%Lecture 7

[num2012 char2012 combined2012] = xlsread('coal860_data.xlsx','2012_coal');
[num2015 char2015 combined2015] = xlsread('coal860_data.xlsx','2015_coal');

 
years=1925:1:2012;

bins=zeros(length(years),1);

for i=1:length(num2012)
    
    
    yr = num2012(i,5);
    
    
    bin_number = find(years==yr);
    
    bins(bin_number) = bins(bin_number) + num2012(i,4);
    
end

bar(bins,'FaceColor', [.8 .8 .8], 'EdgeColor', [.7 .7 .7], 'LineWidth', .01);

ax=gca;
ax.XTick=([1 11 21 31 41 51 61 71 81]);
ax.XTickLabel=({'1925','1935','1945','1955','1965','1975','1985','1995','2005'});
xlabel('Year');
ylabel('Capacity (MW)');
set(ax,'FontSize',12);


C = setdiff(num2012,num2015) 

%Note here I thought I may be able to do something similar with the for
%loop so I can get the data in a usable format.  This may not be the 
%best route though.

for i=1:length(C)
    
    yr = C(i,5);
    
    bin_number = find(years==yr);
   
    bins(bin_number) = bins(bin_number) + C(i,4);
    
end


hold on 

%bar() 

   
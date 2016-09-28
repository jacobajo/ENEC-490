%Create a histogram of annual financial losses from water temperature 
%shutdowns at the plant, calculate the expected annual loss and then fill 
%in the following statement: each year, the utility has a 5% chance of 
%losing at least $______ because of plant shutdowns. 


data = xlsread('catawba_data.xlsx'); 

%Inputs
a = 33.3;
y = .15;
b = 16.9;
n = 127;
plant_capacity = 2000

T = data(:,4);
Q = data(:,5);

%Vector to fill the data
W = zeros(length(T),1);
losses = zeros(length(T),1);

for i = 1:length(T);

W(i) = (a/(1+exp(y*(b-T))) + n/Q 

if W(i) > 37 && W(i) <=40
losses(i) = .25 * plant_capacity * 24; 
    
elseif W(i) > 40 && W(i) <= 42
losses(i) = .5 * plant_capacity * 24; 
    
elseif W(i) > 42
losses(i) = plant_capacity *24;
end
    
end

%Puts losses in thousands of dollars 
losses_dollars = (losses*100)/1000;

annual_losses = zeros(41,1); 

for i=1:41
    
    annual_losses(i) = sum(losses_dollars((i-1)*365+1:((i-1)*365+365)); 
    
end

figure; 

histogram(annual_losses,15); 
ylabel('Frequency'); 
xlabel('Thousands of Dollars'); 

sorted_losses = sortrows(annual_losses); 

%Can sort and pick the worst 2 years (5% of 41)  
%Note: autocorrelation is one value can affect the next value ie weather
%last year affects the probability of weather this year 




%Now perform the exact same analysis assuming climate change (measured as 
%a uniform, 2-degree C increase in temperatures for every day of the year), 
%a 10% mean reduction in daily river flows and a 20% increase in the standard 
%deviation of daily flows (hint: this will require data whitening, manipulation 
%and back-transformation). 

CC_T2 = temps + 2 ;
flows2 = data(:,5); 

log_flows2 = log(flows2); 

Whitened_flows2 = log_flows2 - (mean(log_flows2))/std(log_flows2);

CC_flows2 = (Whitened_flows2 + .9*mean(log_flows2))*1.2*std(log_flows2); 

CC_flows2 = exp(CC_flows2); 

K = zeros(length(CC_flows2),1);
losses2 = zeros(length(CC_flows2),1);

for i = 1:length(T);

K(i) = (a/(1+exp(y*(b-T))) + n/Q 

if K(i) > 37 && K(i) <=40
losses2(i) = .25 * plant_capacity * 24; 
    
elseif K(i) > 40 && K(i) <= 42
losses2(i) = .5 * plant_capacity * 24; 
    
elseif K(i) > 42
losses2(i) = plant_capacity *24;
end
    
end

%Puts losses in thousands of dollars 
losses_dollars2 = (losses2*100)/1000;

annual_losses2 = zeros(41,1); 

for i=1:41
    
    annual_losses2(i) = sum(losses_dollars2((i-1)*365+1:((i-1)*365+365)); 
    
end

figure; 

histogram(annual_losses2,15); 
ylabel('Frequency'); 
xlabel('Thousands of Dollars'); 

sorted_losses2 = sortrows(annual_losses2); 
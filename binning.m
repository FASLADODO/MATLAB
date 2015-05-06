x=[0, 2, 2.4, 2.8, 3.4, 3.9, 4, 4,7, 5.3, 5.8, 6, 6.4]; % unit of x is cm
y=[100, 50, 30, 25, 20, 16, 14, 13, 12, 11, 10.5, 10]; % Intensity

binEdge = linspace(min(x),max(x),10);
[n,bin] = hist(x,binEdge);
% Sum up the values in each bin.
% yn = accumarray(bin',y);
% Plot
% figure
% plot(binEdge,yn)
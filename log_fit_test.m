% Original data
t = [172,241,392,483,608,812,959,1305];
h = [0.200,0.600,2.00,4.00,8.00,20.00,40.00,80.00];
% Transformation to logarithmic scale
log_t = log(t);
log_h = log(h);
% Linear fit of data in logarithmic scale
fit = polyfit(log_t,log_h,1);
% Generate linear fit curve in the logarithmic scale
xVec = linspace(log_t(1),log_t(end),100);
log_h_fit = polyval(fit,xVec);
% Plot logarithmic data and fit
subplot(1,2,1);
plot(xVec,log_h_fit,log_t,log_h,'o');
grid on;
legend('Fit','Data')
title('log-log Data Plot')
% Convert from logarithmic scale to linear scale
m = fit(1);
b = fit(2);
h_fit = t.^m*exp(b);
% Plot linear scale
subplot(1,2,2)
plot(t,t.^fit(1)*exp(fit(2)),t,h,'o');
grid on;
legend('Fit','Data');
title('Original scale plot')
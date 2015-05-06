y = real( rand(1000,1) > 0.1 );  % mostly positives
p = rand(1000,1);                % random predictions
[X,Y,T,AUC] = perfcurve(y,p,1)   % 0.4996
plot(X,Y)
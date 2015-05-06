% x = [1 2 3 4 5];
% y = [5.5 43.1 128 290.7 498.4];
x = 0:0.01:1;
y = randn(1,101);

p=polyfit(x,log(y),1);
eval=p(2)*exp(p(1)*x);
plot(x,y,'b.');
hold on;
plot(x,y,'r-');

clear all
close all
x = [0 90 180 270]';
y = [201 173 118 146]';
modelfun = @(b,x)(b(1)+ b(2).*x.^2.5+ b(3).*x.^3);
opts = statset('nlinfit');
beta0 = [0;0;0];
beta = nlinfit(x,y,modelfun,beta0,opts);
disp(beta);
 b = beta;
y1 = b(1)+ b(2).*x.^2.5 + b(3).*x.^3;
disp(y1);
figure(1)
plot(x,y)
hold on
plot(x,y1)
% mfun = @(b,x)(b(1)+ b(2).*x.^2.5+ b(3).*x.^3);
% opts = statset('nlinfit');
% beta0 = [0;0;0];
% beta = nlinfit(x,y,mfun,beta0,opts);
% % % % disp(beta);
% b = beta;
% y1 = b(1)+ b(2).*x.^2.5 + b(3).*x.^3;
% % disp(y1);


% beta0 = [0;0];
% beta = nlinfit(x,y,myfun,beta0);
% 
% % % where MYFUN is a MATLAB function such as:
% function yhat = myfun(beta, X)
% b1 = beta(1);
% b2 = beta(2);
% yhat = 1 ./ (1 + exp(b1 + b2*X));

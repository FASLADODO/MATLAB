% load carsmall
x1 = [1; 2; 2; 1.1];
x2 = [1; 2; 1; 2.2];
y = [3; 5; 4; 6.6];
X = [ones(size(x1)) x1 x2];
b = regress(y,X);  
% scatter3(x1,x2,y,'filled')
% hold on
% x1fit = min(x1):100:max(x1);
% x2fit = min(x2):10:max(x2);
% [X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
% YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
% mesh(X1FIT,X2FIT,YFIT)
% xlabel('Weight')
% ylabel('Horsepower')
% zlabel('MPG')
% view(50,10)
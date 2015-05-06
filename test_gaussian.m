clear all;
close all;
    n=1;
for i=-8:2:12

mu = [i 0];
mu2 = [i -12];
mu3 = [i 12];

Sigma = [1 0.5 ; 0.5 3];
Sigma2 = [1 n/20 ; n/20 9.6-0.8*n ];
Sigma3 = [1 n/30 ; n/30 5+0.7*n];

x1 = -20:.2:20; x2 = -20:.2:20;
xx1 = -9:.2:9; xx2 = -9:.2:9;
[XX1,XX2] = meshgrid(xx1,xx2);
% aa=zeros(size(XX1));
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F2 = mvnpdf([X1(:) X2(:)],mu2,Sigma2);
F3 = mvnpdf([X1(:) X2(:)],mu3,Sigma3);
aa=zeros(size(X1));
 Fn1 = reshape(F,length(x2),length(x1)).*30;
 Fn2 = reshape(F2,length(x2),length(x1)).*2*n;
 Fn3 = reshape(F3,length(x2),length(x1)).*50/n;
 
% FF=zeros(size(F));
FK=Fn1+Fn2+Fn3;

% mvncdf([0 0],[1 1],mu,Sigma);

% contour(x1,x2,F,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999]);
figure(n)
% colormap('gray')
pcolor(X1,X2,FK);
colorbar;
% pcolor(XX1,XX2,aa);
shading flat;

xlabel('x'); ylabel('y');
% line([0 0 1 1 0],[1 0 0 1 1],'linestyle','--','color','k');
n=n+1;
end


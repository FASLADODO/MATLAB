clear all;
close all;
[xi, yi]=meshgrid(-100:0.5:100, -100:0.5:100);
aa=zeros(401,401);
aa(201,201)=1;
% I = imread('cameraman.tif');
I=aa;
se = strel('line', 21, 10.0);
J = imdilate(I,se);
[fix fiy]=find(J>0);
plot(fiy,fix,'k.');
hold on;
p=polyfit(fiy,fix,1);
pdeg=90+rad2deg(atan(p(1)));
se2 = strel('line', 21, pdeg);
J2=imdilate(I,se2);
[fix2 fiy2]=find(J2>0);
plot(fiy2,fix2,'r.');
hold on;

% imshow(I), title('Original')
% figure, imshow(J), title('Translated');
% bb=medfilt(aa,[10,1]);
%  pcolor(xi,yi,J)
% shading flat
grid on;
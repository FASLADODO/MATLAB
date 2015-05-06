clear all
close all

a=zeros(400,720);
a(50,300:400)=1;
% a(60,280:420)=2;
% a(70,260:440)=3;



r=(0:400-1)*1;  
   rotaz=0:0.5:359.5;
   for j=1:400
   for k=1:720
   x(j,k)=r(j)*sin(rotaz(k)*pi/180);
   y(j,k)=r(j)*cos(rotaz(k)*pi/180);
   end
   end
   
   [xi2,yi2] = meshgrid(-100:100,-100:100);
    a2 = griddata(x,y,a,xi2,yi2);
    
   figure(1);
   pcolor(xi2,yi2,a2);
   shading flat
   axis square;
   colorbar
%    title(figt, 'Fontsize',12);
   xlabel('Distance from the radar (km)');
   ylabel('Distance from the radar (km)');
   
   
   close all;
   clear all;
   rangel=2;
   r=0:rangel;  
   rotaz=0:180/8:360;
   for j=1:numel(r)
   for k=1:numel(rotaz)
   x(j,k)=r(j)*sin(rotaz(k)*pi/180);
   y(j,k)=r(j)*cos(rotaz(k)*pi/180);
   end
   end
   
%    testdata=zeros(numel(r),numel(rotaz));
   testdata=rand(numel(r),numel(rotaz)).*10;
%    testdata(5:7,5:7)=nan;
   
   
   
   [xi2,yi2] = meshgrid(-1*rangel:rangel,-1*rangel:rangel);
   xi3=xi2-1;
   yi3=yi2-1;
   
   cartdata = griddata(x,y,testdata,xi2,yi2);
   
   figure(1)
   pcolor(x,y,testdata);
   colorbar;
   shading flat;
   
   figure(2)
   pcolor(xi2,yi2,cartdata);
   colorbar;
   shading flat;
   xlim([-1*rangel rangel])
   ylim([-1*rangel rangel])
   
a=rand(2,4);
rsize=2;
r=(0:rsize-1)*1;  
   rotaz=0:90:360;
   for j=1:rsize
   for k=1:4
   x(j,k)=r(j)*sin(rotaz(k)*pi/180);
   y(j,k)=r(j)*cos(rotaz(k)*pi/180);
   end
   end
   
   figure(1);
   pcolor(x,y,a);
   shading flat
   axis square;
   colorbar
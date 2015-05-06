clear all;
close all;

   
rsize=10;

r=(0:rsize-1)*1;  
   rotaz=0:0.5:359.5;
   for j=1:rsize
   for k=1:720
   x(j,k)=r(j)*sin(rotaz(k)*pi/180);
   y(j,k)=r(j)*cos(rotaz(k)*pi/180);
   end
   end
% [x2,x2i,x2j]=unique(x);
% [y2,y2i,y2j]=unique(y);
xx=unique(x);
yy=unique(y);

[xi2,yi2] = meshgrid(-rsize:rsize,-rsize:rsize);
 a=rand(rsize,720)+2;
% % xres=(rsize*2)/0.5;
% % xv = linspace(-rsize, rsize, xres);
% % yv = xv;
% % [Xinterp,Yinterp] = meshgrid(xv,yv); 


[xx2,xx2i,xx2j]=unique(xi2);
[yy2,yy2i,yy2j]=unique(yi2);
xxx=xx2(xx2j);
yyy=yy2(yy2j);

  a2 = griddata(xx,yy,a,xi2,yi2);
%   a2 = griddata(x,y,a,xi2,yi2);

     figure(1);
   pcolor(Xinterp,Yinterp,a2);
   shading flat
   axis square;
   colorbar
%    title(figt, 'Fontsize',12);
   xlabel('Distance from the radar (km)');
   ylabel('Distance from the radar (km)');
   
     
   
% 
% gsize=rsize*2+1;
% orip=rsize+1;
% ori=zeros(gsize,gsize);
% ori(orip,orip)=1;
% 
% %  se = strel('disk',rsize);
% %  dori=imdilate(ori,se);
% %  dori(orip,orip)=2;
%  
%  x=-rsize:rsize;
%  y=x;
%  pcolor(x,y,dori);
%  
%  [indy,indx]=find(dori>0);
%  
%  datax=[x(indx)];
%  datay=[y(indy)];
%  
%  indexnum=numel(indy);
%  
%  for i=1:indexnum
% %      i 
% %      datax(i)
% %      i 
% %      datay(i)
%  end
%  
%  
%  

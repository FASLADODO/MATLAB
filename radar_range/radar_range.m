clear all;
close all;
[y2 x2]=meshgrid(51:-0.03:21,-127:0.03:-65);


totaa=zeros(2067,1001);
% [rlat]=textread('radarloc.dat', '%f %f \n');
[rlat]=textread('radarloc.dat');

rx=rlat(:,1);
ry=rlat(:,2);
se = strel('ball',153,0);
 
for i=1:numel(ry)
% for i=1:10
    
    if (ry(i)>21 && ry(i)<51 && rx(i)>-127 && rx(i)<-65)
%         'okay'
        
        aa=zeros(2067,1001);
        dista=zeros(3000,3);
        n=1;
        for ii=1:2067
            for jj=1:1001

              if abs(x2(ii,jj)-rx(i))+abs(y2(ii,jj)-ry(i))<0.1;
                  dista(n,1)=sqrt(abs(x2(ii,jj)-rx(i))^2+abs(y2(ii,jj)-ry(i))^2);
                  dista(n,2)=ii;
                  dista(n,3)=jj;
                  n=n+1;
              end
            end
        end
        dista(dista==0)=nan;
        [indd]=find(dista(1,:)==nanmin(dista(1,:)));
        indx=dista(logical(indd),2);
        indy=dista(logical(indd),3);
        aa(indx,indy)=1;
        J=imdilate(aa,se);
%         figure
%         pcolor(x2,y2,double(J));
%         shading flat;
        totaa=totaa+double(J);
%         clear J;
    end
end
rdrr=totaa;
save('rdrr.mat','rdrr');
 contour(x2,y2,aa,'k');
 hold on;
plot(rlat(:,1),rlat(:,2),'r.')
xlim([-127 -65]);
ylim([21 51])

usabs = shaperead('statesp020.SHP','UseGeoCoords',true);
lats = [usabs.Lat];
lons = [usabs.Lon];
hold on;
plot(lons,lats,'k-','markersize',1)
saveas(gcf,'radar_range', 'pdf')

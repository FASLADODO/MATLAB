   close all;
   clear all;
   rangel=5;
   r=0:0.25:rangel;  
   rotaz=0:180/10:360;
   for j=1:numel(r)
   for k=1:numel(rotaz)
   x(j,k)=r(j)*sin(rotaz(k)*pi/180);
   y(j,k)=r(j)*cos(rotaz(k)*pi/180);
   end
   end
   
%    testdata=zeros(numel(r),numel(rotaz));
%    testdata=rand(numel(r),numel(rotaz)).*10;
   for kii=1:numel(r)
    for kjj=1:numel(rotaz)
        testdata(kii,kjj)=kii;
    end
end
   testdata(2:6,2:6)=nan;
   
   
   
   [xi2,yi2] = meshgrid(-1*rangel:0.5:rangel,-1*rangel:0.5:rangel);
    kk=-1*rangel:0.5:rangel;
   %    xi3=xi2-1;
%    yi3=yi2-1;
cartdata=zeros(numel(kk),numel(kk));
   
%     for ii=1:numel(kk)
%         for jj=1:numel(kk)
%             n=1;         
%             for ti=1:numel(r)
%                 for tj=1:numel(rotaz)
%                     if ((xi2(ii,jj)-x(ti,tj)))^2+((yi2(ii,jj)-y(ti,tj)))^2<2
%                         ddist(1,n)=((xi2(ii,jj)-x(ti,tj)))^2+((yi2(ii,jj)-y(ti,tj)))^2;
% %                     if abs((xi2(ii,jj)-x(ti,tj)))+abs((yi2(ii,jj)-y(ti,tj)))^2<2
% %                         ddist(1,n)=abs((xi2(ii,jj)-x(ti,tj)))+abs((yi2(ii,jj)-y(ti,tj)));                    
%                         ddist(2,n)=ti;
%                         ddist(3,n)=tj;
%                         n=n+1;
%                     else
%                         ddist(1,n)=100;
%                         ddist(2,n)=nan;
%                         ddist(3,n)=nan; 
%                         n=1;
%                     end
%                     
%                 end
%             end
% %             ddist(1,:)
% %             min(ddist(1,:))
%                 if (sum(ddist(1,:))>=0 & min(ddist(1,:))<100 )                    
%                 n2=find(ddist(1,:)==min(ddist(1,:)));
%                 if numel(n2)>1
%                 kkk=n2;
%                 clear n2
%                 n2=min(kkk(:));
%                 end
%                 cartdata(ii,jj)=testdata(ddist(2,n2),ddist(3,n2));
%                 else
%                 cartdata(ii,jj)=nan;    
%                 end
%                 clear ddist
%         end        
%     end
   cartdata = griddata(x,y,testdata,xi2,yi2);
   
   cartdata2=zeros(numel(kk),numel(kk));
   grdsize=1;
    for ii=1:numel(kk)
        for jj=1:numel(kk)
            [fi fj]=find(x>xi2(ii,jj)-grdsize & x<xi2(ii,jj)+grdsize & ...
                            y>yi2(ii,jj)-grdsize & y<yi2(ii,jj)+grdsize);
            numfi=numel(fi);
            if numfi>0
                    ddist=zeros(3,numfi);
            for iii=1:numfi    
                ddist(1,iii)=abs((xi2(ii,jj)-x(fi(iii),fj(iii))))+abs((yi2(ii,jj)-y(fi(iii),fj(iii))));
                ddist(2,iii)=fi(iii);
                ddist(3,iii)=fj(iii);
            end
            mindist=ddist(1,:);
            if min(mindist(:))<grdsize
                minidx=find(mindist==min(mindist(:)));
                if numel(minidx)>1
                    hh=minidx;
                    clear minidx;
                    minidx=min(hh(:));
                end
                cartdata2(ii,jj)=testdata(ddist(2,minidx),ddist(3,minidx));
                clear ddist;
            end
            else
                cartdata2(ii,jj)=nan;
            end
        end        
    end

   
   figure(1)
   pcolor(x,y,testdata);
   colorbar;
   shading flat;
   grid on;
%    
   figure(2)
   pcolor(xi2,yi2,cartdata);
   colorbar;
   shading flat;
   xlim([-1*rangel rangel])
   ylim([-1*rangel rangel])
   grid on;
   
   figure(3)
   pcolor(xi2,yi2,cartdata2);
   colorbar;
   shading flat;
   xlim([-1*rangel rangel])
   ylim([-1*rangel rangel])
   grid on;
   
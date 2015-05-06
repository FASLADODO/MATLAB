
header;

% lscrfile=[gmatPATH 'aa_lscr.mat'];
% load(lscrfile,'lscr')
% oo=1;
% 
for cindex=1:casenumnum2;
% for cindex=10:10;
    
    
     PUTDATams=[ ttableams(casenumtotal2(cindex),:)];
     startm=startt((casenumtotal2(cindex)))+1;
     endm=endt((casenumtotal2(cindex))); 

for m=startm:endm
    t=m;

mfitxy=[matPATH '/FIT/' 'anewams' PUTDATams num2str(m,'%02i') '.mat'];
mindxy=[matPATH '/FIT/' 'anewams' PUTDATams num2str(m,'%02i') '.mat'];

mGSTout2=['../mat/GUSTIN/new/aams' PUTDATams num2str(t,'%02i') '.mat'];
load(mGSTout2,'totscore');
locf=totscore;
indDTD3=locf>0.6;
if sum(indDTD3(:))>10
    xdata=(xi2(indDTD3));
    ydata=(yi2(indDTD3));
    ystd=std(ydata);
    xstd=std(xdata);
    if ystd/xstd>1
        txdata=-ydata;
        tydata=xdata;
    else
        txdata=xdata;
        tydata=ydata;
    end
        
     txmin=min(txdata(:));
     txmax=max(txdata(:));
     
     p=polyfit(txdata,tydata,2);
     f = polyval(p,txdata);
     numf=numel(txdata);
     distf=zeros(numf,1);
     for fi=1:numf
         distf(fi)=abs(f(fi)-tydata(fi));
     end
     
     for fi=1:numf
         if distf(fi)>10
             f(fi)=nan;
             txdata(fi)=nan;
             tydata(fi)=nan;
         end
     end
     clear f;
     
     txmin=min(txdata(:));
     txmax=max(txdata(:));
     p2=polyfit(txdata,tydata,2);
     tx2data=txmin:0.2:txmax;
     f = polyval(p,tx2data);
          
%      save(mpout,'tx2data','f');
     
      if ystd/xstd>1

     origindeg=deg2rad(90);
    
     mat11=cos(origindeg);
     mat12=sin(origindeg);
     mat21=-1*mat12;
     mat22=mat11;
     backprocess=[mat11 mat12; mat21 mat22;];
     rotcord=[txdata tydata]';
     rotcord2=[tx2data; f;];
%      rotcord2=[txdata'; f';];
     
     oldcord= backprocess*rotcord;
     oldcord2= backprocess*rotcord2;
     
     
     txnew2=(squeeze(oldcord(1,:)));
     tynew2=(squeeze(oldcord(2,:)));
     tx2new2=squeeze(oldcord2(1,:));
     tfnew2=squeeze(oldcord2(2,:));
     
     else
     txnew2=txdata;
     tynew2=tydata;
     tx2new2=tx2data;
     tfnew2=f;
     
      end
       
% figure(m)
% 
%   text_title = [ PUTDATams    '$\textrm{ LINEFIT}$' ];
% 
%   plot(txnew2,tynew2,'r.'); hold on; 
% 
%     plot(tx2new2,tfnew2,'k.','Linewidth',1)
%  caxis([0.5 1])
%  shading flat
%  grid on;
%  axis square;
% xlim([-100 100])
% ylim([-100 100])
% title(text_title,'interpreter', 'latex','Fontsize',15);
% set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
%  saveas(gcf,ppout,'png')
%  clf;
%  close(casenumtotal2(cindex))

     
      else
         tx2new2=nan;
         tfnew2=nan;
          cindex
          m

      end
      
 indx=tx2new2;
 indy= tfnew2;
 
 idx2=ceil(indx.*2)+200;
 idy2=ceil(indy.*2)+200;
 
 hhh=zeros(401,401);
 if nansum (idx2(:))>0
for kkk=1:numel(idy2)
            hhh(idy2(kkk),idx2(kkk))=1;
end
end    
 
%  figure(m)
% 
%   text_title = [ PUTDATams    '$\textrm{ LINEFIT}$' ];
% 
%   pcolor(xi2,yi2,hhh)
%  caxis([0.5 1])
%  shading flat
%  grid on;
%  axis square;
% % xlim([-100 100])
% % ylim([-100 100])
% title(text_title,'interpreter', 'latex','Fontsize',15);
% set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
%   

 
%  plot(idx2,idy2)
 
% mfitxy=[matPATH '/FIT/' 'newams' PUTDATams num2str(m,'%02i') '.mat'];
% mindxy=[matPATH '/FIT/' 'newams' PUTDATams num2str(m,'%02i') '.mat'];
save(mfitxy,'indx','indy');     
save(mindxy,'idx2','idy2');     

clear tx2new2 tfnew2;

end
% save(mindtimeout,'tracking_test')
end
% save(lscrfile,'lscr')    
  



 run ../hisnameys/header
 
  for cindex=stcasenum:ndcasenum;

     
     PUTDAT=[ ttable(cindex,:) ];
     startm=startt(cindex)+1;
    
      endm=endt(cindex);
     
   for m=startm:endm
    t=m;
  
mROTout=[rootmat 'ROT/REF/' 'REFROT' ...
         PUTDAT num2str(m,'%02i') '.mat'];
load(mROTout, 'rotitp');

mSCRout=[rootmat 'ROT/SCRREF/' 'REFROT' ...
         PUTDAT num2str(m,'%02i') '.mat'];
pSCRout=[rootpng 'ROT/REFSCR/' 'REF' ...
         PUTDAT num2str(m,'%02i') '.png'];



   llscore=[];
   ssscore=[];
   totscore=zeros(401,401,rotnum);
   totscore2=zeros(401,401);

   
    for i=1:rotnum
%    for i=3:3
      indi=rotdegree*(i-1);
   
   a2=rotitp(:,:,i);
   clscore=zeros(401,401);
   sdscore=zeros(401,401);
  
    inda2=(rotitp(:,:,i)>thrREF);
   
    load(tmpREFcxout,'datacx');
    load(tmpREFcyout,'datacy');
    load(tmpREFsxout,'datasx');
    load(tmpREFsyout,'datasy');
%     
%         load(tmpSMTHcxout,'datacx');
%     load(tmpSMTHcyout,'datacy');
%     load(tmpSMTHsxout,'datasx');
%     load(tmpSMTHsyout,'datasy');
    indexcnum=numel(datacx);
    indexsnum=numel(datasx);
      
   
        numINT =refcentersize+2;
        nunapart=refapart;
        totscore(:,1:numINT,i)=nan;
        totscore(:,401-numINT+1:401,i)=nan;
        totscore(1:numINT,:,i)=nan;
        totscore(401-numINT+1:401,:,i)=nan;
 
for ii=1+numINT:401-numINT
       
    for jj=1+numINT:401-numINT
        
            cbox=[];
            sbox=[];
        
        
    if (inda2(ii,jj)==1)
 
            
%      cbox=a2(ii-numINT:ii+numINT,jj);
for kind=1:indexcnum
     cadd=[a2(ii+datacy(kind),jj+datacx(kind))];
   cbox=[cbox; cadd;];
   clear cadd;
  end
  


  for kind=1:indexsnum
     sadd=[a2(ii+datasy(kind),jj+datasx(kind))];
   sbox=[sbox; sadd;];
   clear sadd;
  end
 
     indcb=((cbox)>thrREF);
     indsb=(~isnan(sbox));
  
     numtcb=sum(indcb(:));
     numtsb=sum(indsb(:));
     cbr=numtcb/indexcnum;
     sbr=numtsb/indexsnum;
    if (cbr>=cbrefthrsh )
%       if (cbr>=cbrefthrsh & sbr>=sbrefthrsh )
      kkk=0;   
      h_0_REF_SCRfunc2;
      
     else
     sdscore(ii,jj)=0; clscore(ii,jj)=0;  
      
     end    %%%%%%thresh for SCRfunc
     else %%%end %%%%%%%%%%%%%%%% for inda2
     sdscore(ii,jj)=0; clscore(ii,jj)=0; 
     end %%%%%%%%%%%%%%%% for inda2
   
  clear cbox sbox;
end %end Azimuth
end

clscore2=clscore;
sdscore2=sdscore;

pretotscore=(sdscore2+clscore2);
% totscore2=pretotscore./(1*18+2*17);
totscore2=pretotscore./(3*17+1*18);

for ki=1:101
    for kj=1:101
        if totscore2(ki,kj)<0
        totscore2(ki,kj)=0;
        end
    end
end
%  totscore(:,:,i)=medfilt2(totscore2,[5 3]);
totscore(:,:,i)=(totscore2);

%  pSCRout=[rootpng 'ROT/REFSCR/' '1REF' ...
%         PUTDAT num2str(m,'%02i') '__' num2str(i,'%02i') '.png'];
%   figure(i)
% % colormap(hot);
% pcolor(xi2,yi2,totscore(:,:,i));
% shading flat
% axis square;
% tttt=max(totscore(:));
% caxis([0 0.5])
%  saveas(gcf,pSCRout,'png');
%  colorbar
% close(i)
% 
%   figure(i+100)
% % colormap(hot);
% pcolor(xi2,yi2,clscore2(:,:));
% shading flat
% axis square;
% tttt=max(totscore(:));
% % caxis([0 0.5])
%  saveas(gcf,pSCRout,'png');
%  colorbar
% % close(i)
% 
%   figure(i+200)
% % colormap(hot);
% pcolor(xi2,yi2,sdscore2(:,:));
% shading flat
% axis square;
% tttt=max(totscore(:));
% % caxis([0 0.5])
%  saveas(gcf,pSCRout,'png');
%  colorbar
% % close(i)
% 
% figure(i+1)
% pcolor(xi2,yi2,rotitp(:,:,i));
% shading flat
% axis square;
% tttt=max(totscore(:));
% caxis([0 60])
%  saveas(gcf,pSCRout,'png');
%  colorbar
% % close(i)
% % 
% 




 
  end
  
  save(mSCRout, 'totscore');
  
% for i=1:16  
% figure(cindex+i)
%    pSCRout=[rootpng 'ROT/REFSCR/' '1REF' ...
%         PUTDAT num2str(m,'%02i') '__' num2str(i,'%02i') '.png'];
%     
% colormap(hot);
% pcolor(xi2,yi2,totscore(:,:,i));
% shading flat
% axis square;
%   caxis([0 1])
% colorbar
% % title(figt, 'Fontsize',12);
% % xlabel('Distance from the radar (km)');
% % ylabel('Distance from the radar (km)');
%  saveas(gcf,pSCRout,'png');
% %    close(cindex+i)
% end

  
%   clear totscore ; 

   end
 end
     'end recognition'
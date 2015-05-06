
clear all;
close all;
[delx]=textread('yshwang_log_diff_delx.dat');
[ETS]=textread('yshwang_log_diff_ETS.dat');
[ITR]=textread('yshwang_log_diff_itr.dat');

        
    titlea{1}=[ '{a) Delta (Size for modifying iterations)'  '}'];
    titlea{2}=[ '{b) Iteration number'  '}'];
    titlea{3}=[ '{c) ETS (Cumulative 18 cases)'  '}'];
    
     fig=figure(1);
     set(fig,'Position',[10 10 1200 1000]);
     ha = tight_subplot(3,1,[.08 .05],[.1 .1],[.03 .03]);
   cmap = hsv(9);  %# Creates a 6-by-3 set of colors from the HSV colormap

     axes(ha(1))    % similar with subplot(221)
     for i = 2:9     %# Loop 6 times
  plot(delx(1:20,i),'Color',cmap(i,:),'linewidth',2);  
  hold on;
     end  
legend('h1','h2','h3','h4','h5','h6','h7','h8','Orientation','horizontal')
ylim([-60 110])
title(titlea{1},'Fontsize',24);

axes(ha(2))    % similar with subplot(221)
     for i = 2:9     %# Loop 6 times
  plot(ITR(1:20,i),'Color',cmap(i,:),'linewidth',2);  
  hold on;
     end  
legend('h1','h2','h3','h4','h5','h6','h7','h8','Orientation','horizontal')
ylim([40 420])
title(titlea{2},'Fontsize',24);

axes(ha(3))    % similar with subplot(221)
     for i = 2:9     %# Loop 6 times
  plot(ETS(1:20,i),'Color',cmap(i,:),'linewidth',2);  
  hold on;
     end  
legend('h1','h2','h3','h4','h5','h6','h7','h8','Orientation','horizontal')
ylim([0.3 0.87])
title(titlea{3},'Fontsize',24);


%     
%     axes(ha(2))    % similar with subplot(221)
%     plot(lons,lats,'k-','markersize',1)
%     hold on;
%     title(titlea{2});
%     hold on;
%     plot(x2(SALmiss),y2(SALmiss),'b.') 
%     plot(x2(SALfa),y2(SALfa),'m.') 
%     plot(x2(SALyes),y2(SALyes),'k.') 
%     legend('USA','miss','false','hit','location','southwest')
%     xlim(numxlim);
%     ylim(numylim);
%     
%     axes(ha(3))    % similar with subplot(221)
%     plot(lons,lats,'k-','markersize',1)
%     hold on;
%     title(titlea{3});
%     plot(x2(NNNmiss),y2(NNNmiss),'b.') 
%     plot(x2(NNNfa),y2(NNNfa),'r.') 
%     plot(x2(NNNyes),y2(NNNyes),'k.') 
%     legend('USA','miss','false','hit','location','southwest')
%     xlim(numxlim);
%     ylim(numylim);
%  

dp=['./cspng.png'];

    set(gcf, 'PaperPositionMode','auto');
    set(gcf,'render','painter')
    set(gcf,'color','w'); 
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,dp,'png');
%      close(fig)
% %     print(gcf,'-dpng',dp);
% %     close(fig)
% %     clf
%      



clf;
fig=figure(1);
set(fig,'Position',[300 600 800 500]);
ha = tight_subplot(2,2,[.07 .07],[.1 .07],[.07 .07]);

axes(ha(1))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  %all_hnds(ei) = plot( [ 0, avgReward(ei,:) ], [clrStr(ei)] ); 
  all_hnds(ei) = plot( 1:nP, avgReward(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
 ylabel( 'Average Reward' ); 
 ylim([0 1.5])

axes(ha(2))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  %all_hnds(ei) = plot( [ 0, avgReward(ei,:) ], [clrStr(ei)] ); 
  all_hnds(ei) = plot( 1:nP, perOptAction(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
 ylabel( '% Optimal Action' );

axes(ha(3))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  all_hnds(ei) = plot( 1:nP, cumReward(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
legend( all_hnds, { '0', '0.01', '0.1' }, 'Location', 'SouthEast' ); 
grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative Average Reward' ); 
ylim([0 1500])

axes(ha(4))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  all_hnds(ei) = plot( 1:nP, cumProb(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative % Optimal Action' );

set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');
p1=['./no2.png'] ;  
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

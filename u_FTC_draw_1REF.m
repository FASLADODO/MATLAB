close all;
clear all;
clc;

cbox=-10:10;
sbox=cbox;
numtcb=numel(cbox);
numtsb=numtcb;

indexcnum=numel(cbox);
indexsnum=numel(sbox);

kkk=1;
u_SCRfunc

   
tmppout=['./tmpscrREF.png'];
figure(1)
plot(sbox,llscore,'r')
ylim([-1 1])
hold on;
plot(sbox,ssscore,'b')
hold off;
grid on;
legend('center', 'side' )
title('REF scoring func.')
set(figure(1),'Position', [ 100 100 500 400 ] );
set(figure(1), 'PaperPositionMode','auto') 
saveas(gcf,tmppout,'png');


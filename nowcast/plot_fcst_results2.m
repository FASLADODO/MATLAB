clear all;
close all;
aa=csvread('201402_ADV.csv');
hh=csvread('201402_HRRR.csv');
mm=csvread('201402_MT.csv');


var1=['{Absolute \smallskip mean \smallskip error}'];
var2=['{Mean \smallskip square \smallskip error}'];
var3=['{Standard \smallskip deviation \smallskip of \smallskip error}'];
var4=['{Mean \smallskip absolute \smallskip error}'];
var5=['{Probability \smallskip of \smallskip detection}'];
var6=['{False \smallskip alarm}'];
var7=['{Critical \smallskip success \smallskip index}'];
var8=['{Number \smallskip of \smallskip pixels}'];
pn1=['2014_var1.png'];
pn2=['2014_var2.png'];
pn3=['2014_var3.png'];
pn4=['2014_var4.png'];
pn5=['2014_var5.png'];
pn6=['2014_var6.png'];
pn7=['2014_var7.png'];
pn8=['2014_var8.png'];
n=1;
fig=figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:16),abs(aa(:,1)),'b-','linewidth',2)
hold on;
plot(15*(1:16),abs(hh(:,1)),'k-','linewidth',2)
plot(15*(1:16),abs(mm(:,1)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*16);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var1,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 16*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn1,'png');
close(fig)

n=n+1;
fig=figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:16),abs(aa(:,2)),'b-','linewidth',2)
hold on;
plot(15*(1:16),abs(hh(:,2)),'k-','linewidth',2)
plot(15*(1:16),abs(mm(:,2)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*16);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var2,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 16*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn2,'png');

close(fig)
n=n+1;
fig=figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:16),abs(aa(:,3)),'b-','linewidth',2)
hold on;
plot(15*(1:16),abs(hh(:,3)),'k-','linewidth',2)
plot(15*(1:16),abs(mm(:,3)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*16);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var3,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 16*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn3,'png');

close(fig)
n=n+1;
fig=figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:16),abs(aa(:,4)),'b-','linewidth',2)
hold on;
plot(15*(1:16),abs(hh(:,4)),'k-','linewidth',2)
plot(15*(1:16),abs(mm(:,4)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*16);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var4,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 16*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn4,'png');

close(fig)
n=n+1;
fig=figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:16),abs(aa(:,5)),'b-','linewidth',2)
hold on;
plot(15*(1:16),abs(hh(:,5)),'k-','linewidth',2)
plot(15*(1:16),abs(mm(:,5)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*16);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var5,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 16*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn5,'png');

close(fig)
n=n+1;
fig=figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:16),abs(aa(:,6)),'b-','linewidth',2)
hold on;
plot(15*(1:16),abs(hh(:,6)),'k-','linewidth',2)
plot(15*(1:16),abs(mm(:,6)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*16);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var6,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 16*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn6,'png');

close(fig)
n=n+1;
fig=figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:16),abs(aa(:,7)),'b-','linewidth',2)
hold on;
plot(15*(1:16),abs(hh(:,7)),'k-','linewidth',2)
plot(15*(1:16),abs(mm(:,7)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*16);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var7,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 16*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn7,'png');

close(fig)
n=n+1;
fig=figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:16),abs(aa(:,8)),'b-','linewidth',2)
hold on;
plot(15*(1:16),abs(hh(:,8)),'k-','linewidth',2)
plot(15*(1:16),abs(mm(:,8)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*16);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var8,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 16*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn8,'png');
close(fig)
% 
% figure(2)
% plot(15*(1:16),aa2)
% hold on;
% plot(15*(1:16),bb(:,2),'r')
% title(var2,'fontsize',15)
% saveas(gcf,pn2)
% 
% figure(3)
% plot(15*(1:16),aa3)
% hold on;
% plot(15*(1:16),bb(:,3),'r')
% title(var3,'fontsize',15)
% saveas(gcf,pn3)
% 
% figure(4)
% plot(15*(1:16),aa4)
% hold on;
% plot(15*(1:16),bb(:,4),'r')
% title(var4,'fontsize',15)
% saveas(gcf,pn4)
% 
% figure(5)
% plot(15*(1:16),aa5)
% hold on;
% plot(15*(1:16),bb(:,5),'r')
% title(var5,'fontsize',15)
% saveas(gcf,pn5)
% 
% figure(6)
% plot(15*(1:16),aa6)
% hold on;
% plot(15*(1:16),bb(:,6),'r')
% title(var6,'fontsize',15)
% saveas(gcf,pn6)
% 
% figure(7)
% plot(15*(1:16),aa7)
% hold on;
% plot(15*(1:16),bb(:,7),'r')
% title(var7,'fontsize',15)
% saveas(gcf,pn7)
% 
% figure(8)
% plot(15*(1:16),aa8)
% hold on;
% plot(15*(1:16),bb(:,8),'r')
% title(var8,'fontsize',15)
% saveas(gcf,pn8)
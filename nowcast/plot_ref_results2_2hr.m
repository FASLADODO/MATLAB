clear all;
close all;
aa=csvread('score_ADVWSR88D.csv');
hh=csvread('ref_hrrr.csv');
mm=csvread('ref_mt.csv');
ntime=8;

var1=['{REF \smallskip Absolute \smallskip mean \smallskip error}'];
var2=['{REF \smallskip Mean \smallskip square \smallskip error}'];
var3=['{REF \smallskip Standard \smallskip deviation \smallskip of \smallskip error}'];
var4=['{REF \smallskip Mean \smallskip absolute \smallskip error}'];
var5=['{REF \smallskip Probability \smallskip of \smallskip detection}'];
var6=['{REF \smallskip False \smallskip alarm}'];
var7=['{REF \smallskip Critical \smallskip success \smallskip index}'];
var8=['{REF \smallskip Number \smallskip of \smallskip pixels}'];
pn1=['r_var1.png'];
pn2=['r_var2.png'];
pn3=['r_var3.png'];
pn4=['r_var4.png'];
pn5=['r_var5.png'];
pn6=['r_var6.png'];
pn7=['r_var7.png'];
pn8=['r_var8.png'];
n=1;
figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:ntime),abs(aa(:,1)),'b-','linewidth',2)
hold on;
plot(15*(1:ntime),abs(hh(:,1)),'k-','linewidth',2)
plot(15*(1:ntime),abs(mm(:,1)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*ntime);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var1,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 ntime*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn1,'png');
clf

n=n+1;
figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:ntime),abs(aa(:,2)),'b-','linewidth',2)
hold on;
plot(15*(1:ntime),abs(hh(:,2)),'k-','linewidth',2)
plot(15*(1:ntime),abs(mm(:,2)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*ntime);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var2,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 ntime*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn2,'png');

clf
n=n+1;
figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:ntime),abs(aa(:,3)),'b-','linewidth',2)
hold on;
plot(15*(1:ntime),abs(hh(:,3)),'k-','linewidth',2)
plot(15*(1:ntime),abs(mm(:,3)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*ntime);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var3,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 ntime*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn3,'png');

clf
n=n+1;
figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:ntime),abs(aa(:,4)),'b-','linewidth',2)
hold on;
plot(15*(1:ntime),abs(hh(:,4)),'k-','linewidth',2)
plot(15*(1:ntime),abs(mm(:,4)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*ntime);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var4,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 ntime*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn4,'png');

clf
n=n+1;
figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:ntime),abs(aa(:,5)),'b-','linewidth',2)
hold on;
plot(15*(1:ntime),abs(hh(:,5)),'k-','linewidth',2)
plot(15*(1:ntime),abs(mm(:,5)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*ntime);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var5,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 ntime*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn5,'png');

clf
n=n+1;
figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:ntime),abs(aa(:,6)),'b-','linewidth',2)
hold on;
plot(15*(1:ntime),abs(hh(:,6)),'k-','linewidth',2)
plot(15*(1:ntime),abs(mm(:,6)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*ntime);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var6,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 ntime*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn6,'png');

clf
n=n+1;
figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:ntime),abs(aa(:,7)),'b-','linewidth',2)
hold on;
plot(15*(1:ntime),abs(hh(:,7)),'k-','linewidth',2)
plot(15*(1:ntime),abs(mm(:,7)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*ntime);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var7,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 ntime*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn7,'png');

clf
n=n+1;
figure(n)
set(figure(n),'Position',[100 100 500 300]);
plot(15*(1:ntime),abs(aa(:,8)),'b-','linewidth',2)
hold on;
plot(15*(1:ntime),abs(hh(:,8)),'k-','linewidth',2)
plot(15*(1:ntime),abs(mm(:,8)),'r-','linewidth',2)
set(gca,'XTick', 0:15:15*ntime);
ylabel('{Score} ','interpreter', 'latex','Fontsize',13);
xlabel('{Nowcast \smallskip time \smallskip (evevry  \smallskip 15 \smallskip minutes)} ','interpreter', 'latex','Fontsize',14);
title(var8,'interpreter', 'latex','fontsize',15)
legend('ADV','HRRR','MT','Location','BestOutside' );
grid on;
set(gca,'tick','in','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');   
xlim([0 ntime*15])
frame = getframe(figure(n));
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,pn8,'png');
clf
% 
% figure(2)
% plot(15*(1:ntime),aa2)
% hold on;
% plot(15*(1:ntime),bb(:,2),'r')
% title(var2,'fontsize',15)
% saveas(gcf,pn2)
% 
% figure(3)
% plot(15*(1:ntime),aa3)
% hold on;
% plot(15*(1:ntime),bb(:,3),'r')
% title(var3,'fontsize',15)
% saveas(gcf,pn3)
% 
% figure(4)
% plot(15*(1:ntime),aa4)
% hold on;
% plot(15*(1:ntime),bb(:,4),'r')
% title(var4,'fontsize',15)
% saveas(gcf,pn4)
% 
% figure(5)
% plot(15*(1:ntime),aa5)
% hold on;
% plot(15*(1:ntime),bb(:,5),'r')
% title(var5,'fontsize',15)
% saveas(gcf,pn5)
% 
% figure(6)
% plot(15*(1:ntime),aa6)
% hold on;
% plot(15*(1:ntime),bb(:,6),'r')
% title(var6,'fontsize',15)
% saveas(gcf,pn6)
% 
% figure(7)
% plot(15*(1:ntime),aa7)
% hold on;
% plot(15*(1:ntime),bb(:,7),'r')
% title(var7,'fontsize',15)
% saveas(gcf,pn7)
% 
% figure(8)
% plot(15*(1:ntime),aa8)
% hold on;
% plot(15*(1:ntime),bb(:,8),'r')
% title(var8,'fontsize',15)
% saveas(gcf,pn8)
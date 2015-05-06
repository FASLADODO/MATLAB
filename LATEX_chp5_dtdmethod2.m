clear all
close all
[x,y]=meshgrid(-10:0.5:10,-10:0.5:10);
[ss,ss]=size(x);
plate=zeros(ss,ss);
plate2=plate;
plate3=plate;
plate4=plate;
plate5=plate;
plate6=plate;
plate66=plate;
plate7=plate;
plate77=plate;


% pPARTREND=[ '../../png/PARTREND/lgndsize.eps'];
p1=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/dtdmethod.png'] ;  
% pPARTREND=['/Users/hisnameys/Desktop/thesisdefense/figs/dtdmethod2.png'] ;  


plate4(11,11:31)=1;
plate7(11,15:26)=1;
plate2(11,11:31)=1;
% plate2(13,2:7)=1;
plate3(6:16,11:31)=1;
plate5(21,5:31)=1;
plate6(11,4:11)=1;
plate66(21,11:31)=1;
plate77(11,11:31)=1;

ind1=(plate2==1);
ind3=(plate4==1);
ind5=(plate5==1);
ind6=(plate6==1);
ind66=(plate66==1);
ind7=(plate7==1);
ind77=(plate77==1);


x1=x(ind1);
y1=y(ind1);
x3=x(ind3);
y3=y(ind3);
x5=x(ind5);
y5=y(ind5);
x6=x(ind6);
y6=y(ind6);
x66=x(ind66);
y66=y(ind66);

x7=x(ind7);
y7=y(ind7);
x77=x(ind77);
y77=y(ind77);



% figure(1)

% pcolor(x,y,plate3); hold on;
% plot(x3,y3,'b.','linewidth',4); hold on;
% plot(x1,y1,'k--','linewidth',2); hold on;
% contour(x,y,plate3,'k','linewidth',1); hold on;

titlesize=20;
lgndsize=15;

fig=figure(1);
set(fig,'Position',[300 600 800 500]);
ha = tight_subplot(2,3,[.07 .03],[.07 .07],[.07 .05]);
%   text_title = [ timetable(m,:)    '$\textrm{Z}$' ];
axes(ha(1))
% plot(x3,y3,'k-','linewidth',4); hold on;


plot(x1,y1,'b--','linewidth',1); hold on;
plot(x7,y7,'k-','linewidth',3); hold on;
contour(x,y,plate3,'y','linewidth',1); hold on;
text_title = [ 'Hit' ];
% set(gca, 'YTick', []);
set(gca, 'XTick', []);
% xlabel('{x} \medskip (km)','interpreter', 'latex','Fontsize',14);
ylabel('{y} \medskip (km)','interpreter', 'latex','Fontsize',14);title(text_title,'interpreter', 'latex','Fontsize',15);
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);

title(text_title,'interpreter', 'latex','Fontsize',titlesize);
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
h_legend=legend('True line','Detected line','True region');
set(h_legend,'box','off','interpreter', 'latex','Fontsize',lgndsize,'Location','northwest');

xlim([-10 10])
ylim([-10 10])
% axis square;

axes(ha(2))
plot(x6,y6,'r-','linewidth',4); hold on;
% plot(x66,y66,'r-','linewidth',4); hold on;
plot(x77,y77,'k-','linewidth',3); hold on;
% plot(x1,y1,'b--','linewidth',1); hold on;
contour(x,y,plate3,'y','linewidth',1); hold on;
text_title = [ 'Hit' ];
set(gca, 'XTick', []);
set(gca, 'YTick', []);

% xlabel('{x} \medskip (km)','interpreter', 'latex','Fontsize',14);
% ylabel('{y} \medskip (km)','interpreter', 'latex','Fontsize',14);title(text_title,'interpreter', 'latex','Fontsize',15);
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);

title(text_title,'interpreter', 'latex','Fontsize',titlesize);
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
h_legend=legend('False detected line','Detected line');
set(h_legend,'box','off','interpreter', 'latex','Fontsize',lgndsize,'Location','northwest');

title(text_title,'interpreter', 'latex','Fontsize',titlesize);
% h_legend=legend('Outlier line','Detect line','Truth line');
% set(h_legend,'box','off','interpreter', 'latex','Fontsize',lgndsize);
xlim([-10 10])
ylim([-10 10])
% axis square;

axes(ha(3))
plot(x5,y5,'r-','linewidth',4); hold on;
plot(x1,y1,'b--','linewidth',1); hold on;
contour(x,y,plate3,'y','linewidth',1); hold on;
text_title = [ 'Miss' ];
% set(gca, 'XTick', []);
set(gca, 'YTick', []);
% xlabel('{}','interpreter', 'latex','Fontsize',14);
% ylabel('{}','interpreter', 'latex','Fontsize',14);

xlabel('{x} \medskip (km)','interpreter', 'latex','Fontsize',14);
% ylabel('{y} \medskip (km)','interpreter', 'latex','Fontsize',14);
title(text_title,'interpreter', 'latex','Fontsize',15);

set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);

title(text_title,'interpreter', 'latex','Fontsize',titlesize);
h_legend=legend('False detected line');
set(h_legend,'box','off','interpreter', 'latex','Fontsize',lgndsize,'Location','northwest');
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
xlim([-10 10])
ylim([-10 10])
% axis square;


axes(ha(4))
text_title = [ 'Correct rejection' ];
% xlabel('{}','interpreter', 'latex','Fontsize',14);
% ylabel('{}','interpreter', 'latex','Fontsize',14);
xlabel('{x} \medskip (km)','interpreter', 'latex','Fontsize',14);
ylabel('{y} \medskip (km)','interpreter', 'latex','Fontsize',14);

title(text_title,'interpreter', 'latex','Fontsize',15);
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
title(text_title,'interpreter', 'latex','Fontsize',titlesize);
% h_legend=legend('False detected line');
% set(h_legend,'box','off','interpreter', 'latex','Fontsize',lgndsize,'Location','north');
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
xlim([-10 10])
ylim([-10 10])



axes(ha(5))
plot(x3,y3,'r-','linewidth',4); hold on;
% plot(x1,y1,'k--','linewidth',2); hold on;
% contour(x,y,plate3,'k','linewidth',1); hold on;
text_title = [ 'False' ];
% set(gca, 'XTick', []);
set(gca, 'YTick', []);

xlabel('{x} \medskip (km)','interpreter', 'latex','Fontsize',14);
% ylabel('{y} \medskip (km)','interpreter', 'latex','Fontsize',14);title(text_title,'interpreter', 'latex','Fontsize',15);
% xlabel('{}','interpreter', 'latex','Fontsize',14);
% ylabel('{}','interpreter', 'latex','Fontsize',14);title(text_title,'interpreter', 'latex','Fontsize',15);
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);

title(text_title,'interpreter', 'latex','Fontsize',titlesize);
h_legend=legend('False detected line');
set(h_legend,'box','off','interpreter', 'latex','Fontsize',lgndsize,'Location','northwest');
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
xlim([-10 10])
ylim([-10 10])
% axis square;


% axis square;

set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');

% print(gcf,'-depsc',p1)
% pcolor(x,y,plate2);

% % print(gcf,'-depsc',plotout);
% % close(fig)

frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

close(fig)

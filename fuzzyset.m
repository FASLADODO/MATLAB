clear all;
close all;
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter4/figs/01fzy.eps'];
text_title = [ '{Fuzzy $\medskip$ set \medskip }'];

a1=zeros(10,1);
a1(6:10)=1;
fig=figure;
set(fig,'Position',[300 600 500 400]);

% plot(a1,'k-')
l1=line([0 6],[0 1]);
l2=line([6 10],[1 1]);
% l3=line([6 6],[0 1]);
set(l1, 'linewidth',3,'color','red')
set(l2, 'linewidth',3,'color','red')
% set(l3, 'linewidth',1,'color','red')

xlabel('{$x$}','interpreter', 'latex','Fontsize',20);
ylabel('{$ \mu_{A} $}','interpreter', 'latex','Fontsize',20);title(text_title,'interpreter', 'latex','Fontsize',15);
set(gca,'tick','out','box','on','TickLength'  , [.01 .01], 'LineWidth'   , 1.5);
title(text_title,'interpreter', 'latex','Fontsize',25);
ylim([-0.05 1.05])
grid on

set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
print(gcf,'-depsc',plotout);
% close(fig)


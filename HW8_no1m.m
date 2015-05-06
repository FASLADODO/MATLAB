clear all;
close all;
mpath=['/Users/hisnameys/Desktop/CLASS/2014Fall/latex/figs/'];
aa=zeros(12,2);
bb=aa;
aa(:,1)=[0.03; 0.18; 0.24; 0.32; 0.45; 0.53; 0.59; 0.65; 0.70; 0.77; 0.81; 0.90;];
aa(:,2)=[-1; -1; 1; 1; -1; -1; -1; 1; 1; -1; 1; 1;];
bb(:,1)=aa(:,1);
bb(:,2)=[-1; -1; -1; -1; -1; -1; -1; -1; 1; -1; -1; -1;];
no1a=aa(:,1)>0.5;
no1acorrect=0;

% for bdry=0:0.05:1;
bdry=0:0.05:1;
no1bcc=zeros(21,1);
for j=1:21
nb=bdry(j);
no1b=aa(:,1)>nb;
no1bcorrect=0;
for i=1:12
    if aa(i,2)>0 && no1b(i)==1 || aa(i,2)<1 && no1b(i)==0
        no1bcorrect=no1bcorrect+1;
    end
end
no1bcc(j)=no1bcorrect/12;
end
% figure(1)
% plot(bdry,no1bcc,'k','linewidth',2)
% ylim([0 1])
% title('No1. b)')
% xlabel('Boundary')
% ylabel('Accuracy')
% saveas(gcf,[mpath 'b.png'],'png')
% indno1b=(no1bcc==0.7500);
% bdry(indno1b) 
%  

% % % for bdry=0:0.05:1;
no1cfpr=zeros(21,1);
no1ctpr=zeros(21,1);
no1cfprb=zeros(21,1);
no1ctprb=zeros(21,1);
for j=1:21
nb=bdry(j);
no1c=aa(:,1)>nb;
no1cb=bb(:,1)>nb;
% no1c
no1c2=aa(:,2)>0;
no1c2b=bb(:,2)>0;

numneg=12-sum(no1c2(:));
numnegb=12-sum(no1c2b(:));

no1cnbutp=0;
no1ccorp=0;
no1cnbutpb=0;
no1ccorpb=0;

for i=1:12
    if aa(i,2)<0 && no1c(i)==1 
        no1cnbutp=no1cnbutp+1;
    end
    if aa(i,2)>0 && no1c(i)==1 
        no1ccorp=no1ccorp+1;
    end
    
    if bb(i,2)<0 && no1cb(i)==1 
        no1cnbutpb=no1cnbutpb+1;
    end
    if bb(i,2)>0 && no1cb(i)==1 
        no1ccorpb=no1ccorpb+1;
    end
end
no1cfpr(j)=no1cnbutp/numneg;
no1ctpr(j)=no1ccorp/sum(no1c2(:));
no1cfprb(j)=no1cnbutpb/numnegb;
no1ctprb(j)=no1ccorpb/sum(no1c2b(:));
end
no1cfpr2=[no1cfpr; 1];
no1ctpr2=[no1ctpr; 0];
no1cfpr2b=[no1cfprb; 1];
no1ctpr2b=[no1ctprb; 0];

polyarea(no1cfpr2,no1ctpr2)
polyarea(no1cfpr2b,no1ctpr2b)

figure(7)
plot(no1cfprb,no1ctprb,'k','linewidth',2)
xlim([-0.1 1.1])
ylim([-0.1 1.1])
xlabel('False Positive Ratio')
ylabel('True Positive Ratio')
title('No1. m) ROC curve','fontsize',20)
saveas(gcf,[mpath 'm.png'],'png')


% table = [bdry; no1cfpr'; no1ctpr';]'
% figure(1)
% plot(bdry,no1cfpr,'b','linewidth',2)
% hold on;
% plot(bdry,no1ctpr,'r','linewidth',2)
% ylim([-0.1 1.1])
% title('No1. c)','fontsize',20)
% legend('False Positive Ratio','True Positive Ratio')
% xlabel('Boundary')
% ylabel('Score')
% saveas(gcf,[mpath 'c.png'],'png')
% 
% figure(2)
% plot(no1cfpr,no1ctpr,'k','linewidth',2)
% xlim([-0.1 1.1])
% ylim([-0.1 1.1])
% xlabel('False Positive Ratio')
% ylabel('True Positive Ratio')
% title('No1. d) ROC curve','fontsize',20)
% saveas(gcf,[mpath 'd.png'],'png')

no1dFP=zeros(21,1);
no1dFN=zeros(21,1);
for j=1:21
nb=bdry(j);
no1c=aa(:,1)>nb;
no1c2=aa(:,2)>0;
numneg=12-sum(no1c2(:));
dFP=0;
dFN=0;
for i=1:12
    if aa(i,2)<0 && no1c(i)==1 
        dFP=dFP+1;
    end
    if aa(i,2)>0 && no1c(i)==0 
        dFN=dFN+1;
    end
end
no1dFP(j)=dFP;
no1dFN(j)=dFN;
end
% figure(4)
% plot(bdry,no1dFP,'b','linewidth',2)
% hold on;
% plot(bdry,no1dFN,'r','linewidth',2)
% plot(bdry,no1dFP+no1dFN,'k','linewidth',2)
% ylim([-0.1 6.1])
% title('No1. e)','fontsize',20)
% legend('False Positive','False Negative','Sum','location','best')
% xlabel('Boundary')
% ylabel('Accumulated Number')
% saveas(gcf,[mpath 'e.png'],'png')

% figure(5)
% plot(bdry,no1dFP,'b','linewidth',2)
% hold on;
% plot(bdry,5.*no1dFN,'r','linewidth',2)
% plot(bdry,no1dFP+5.*no1dFN,'k','linewidth',2)
% ylim([-0.1 30.1])
% title('No1. f)','fontsize',20)
% legend('False Positive','5xFalse Negative','Sum','location','best')
% xlabel('Boundary')
% ylabel('Accumulated Number')
% saveas(gcf,[mpath 'f.png'],'png')

% figure(6)
% plot(bdry,bdry,'k','linewidth',2)
% ylim([-0.01 1.01])
% title('No1. g) ROC','fontsize',20)
% xlabel('False Positive Ratio')
% ylabel('True Positive Ratio')
% saveas(gcf,[mpath 'g.png'],'png')



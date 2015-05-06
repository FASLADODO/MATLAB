clear all;
close all;
mpath=['/Users/hisnameys/Desktop/CLASS/2014Fall/latex/figs/'];
aa=zeros(12,2);
aa(:,1)=[0.03; 0.18; 0.24; 0.32; 0.45; 0.53; 0.59; 0.65; 0.70; 0.77; 0.81; 0.90;];
aa(:,2)=[-1; -1; 1; 1; -1; -1; -1; 1; 1; -1; 1; 1;];
no1a=aa(:,1)>0.5;
no1acorrect=0;
for i=1:12
    if aa(i,2)>0.5 && no1a(i)==1 || aa(i,2)<0.5 && no1a(i)==0
        no1acorrect=no1acorrect+1;
    end
end
no1acc=no1acorrect/12

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

no1cfpr=zeros(21,1);
no1ctpr=zeros(21,1);
for j=1:21
nb=bdry(j);
no1c=aa(:,1)>nb;
no1c2=aa(:,2)>0;
numneg=12-sum(no1c2(:));
no1cnbutp=0;
no1ccorp=0;
for i=1:12
    if aa(i,2)>0 && no1c(i)==0 
        no1cnbutp=no1cnbutp+1;
    end
    if aa(i,2)>0 && no1c(i)==1 
        no1ccorp=no1ccorp+1;
    end
end
no1cfpr(j)=no1cnbutp/numneg;
no1ctpr(j)=no1ccorp/sum(no1c2(:));
end
table = [no1cfpr; no1ctpr;]
figure(1)
subplot(1,2,1);
plot(bdry,no1cfpr,'b')
hold on;
plot(bdry,no1ctpr,'r')
ylim([0 1])
axis square;
subplot(1,2,2);
plot(no1cfpr,no1ctpr,'b.')
xlim([0 1])
ylim([0 1])
axis square;


% figure(2)
% 
% % for bdry=0:0.05:1;
% no1efpr=zeros(21,1);
% no1etpr=zeros(21,1);
% numneg=0;
% for j=1:21
% nb=bdry(j);
% no1e=aa(:,1)>nb;
% numneg=12-sum(no1e(:));
% sum(no1e(:))
% no1enbutp=0;
% no1epbutn=0;
% for i=1:12
%     if aa(i,2)>0 && no1e(i)==0 
%         no1enbutp=no1enbutp+1;
%     end
%     if aa(i,2)<0 && no1e(i)==1 
%         no1epbutn=no1epbutn+1;
%     end
% end
% no1efpr(j)=no1enbutp/numneg;
% no1etpr(j)=no1epbutn/sum(no1e(:));
% end
% figure(3)
% plot(bdry,no1efpr,'b')
% hold on;
% plot(bdry,no1etpr,'r')
% plot(bdry,no1etpr+no1efpr,'k')
% 
% ylim([-0.1 6])
% 
% figure(4)
% plot(bdry,no1efpr.*5,'b')
% hold on;
% plot(bdry,no1etpr,'r')
% plot(bdry,no1etpr+no1efpr.*5,'k')
% ylim([-0.1 6])
% 

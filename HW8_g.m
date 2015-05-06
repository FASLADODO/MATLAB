clear all;
close all;
aa=zeros(12,2);
aa(:,1)=[0.03; 0.18; 0.24; 0.32; 0.45; 0.53; 0.59; 0.65; 0.70; 0.77; 0.81; 0.90;];
aa(:,2)=[-1; -1; 1; 1; -1; -1; -1; 1; 1; -1; 1; 1;];
bdry=0:0.05:1;
no1cfpr=zeros(21,1);
no1ctpr=zeros(21,1);
for j=1:21
nb=bdry(j);
no1c=aa(:,1)>nb;
numneg=12-sum(no1c(:));
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
no1ctpr(j)=no1ccorp/sum(no1c(:));
end
% % figure(1)
% % plot(bdry,no1cfpr,'b')
% % hold on;
% % plot(bdry,no1ctpr,'r')
% % ylim([0 1])
% % 
figure(2)
plot(no1cfpr,no1ctpr,'b')
xlim([0 1])
ylim([0 1])

clear all;
close all;

dataxout=['./circdatax.mat'];
datayout=['./circdatay.mat'];

   
rsize=10;


gsize=rsize*2+1;
orip=rsize+1;
ori=zeros(gsize,gsize);
ori(orip,orip)=1;

 se = strel('disk',rsize);
 dori=imdilate(ori,se);
%  dori(orip,orip)=2;
 
 x=-rsize:rsize;
 y=x;
 pcolor(x,y,dori);
 xlim([-rsize-1 rsize+1])
 ylim([-rsize-1 rsize+1])
 
 [indy,indx]=find(dori>0);
 
 datax=[x(indx)];
 datay=[y(indy)];
 
 save(dataxout,'datax');
 save(datayout,'datay');
 
 
 indexnum=numel(indy);
 
 for i=1:indexnum
%      i 
%      datax(i)
%      i 
%      datay(i)
 end
 
 
 

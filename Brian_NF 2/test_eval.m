clear all;
close all
aa=textread('testdata.txt');
input=aa(:,1:7);
truth=aa(:,8);
histyes=zeros(numel(truth),7);
histno=zeros(numel(truth),7);

for i=1:7
    for j=1:numel(truth)
    if truth(j)==1;
        histyes(j,i)=aa(j,i);
    else
        histno(j,i)=aa(j,i);
    end
    end
    
end

histyes(histyes==0)=nan;
histno(histno==0)=nan;
lly=zeros(100,7);
lln=zeros(100,7);

lineyes=hist(histyes);
lineno=hist(histno);
for k=1:7
lly(:,k)=hist(histyes(:,k),100);
lln(:,k)=hist(histno(:,k),100);
figure(k)
xaxis1=nanmin(lly(:,k));
xaxis2=nanmax(lly(:,k));
plot(xaxis1:(xaxis2-xaxis1)/99:xaxis2,lly(:,k),'r-');
hold on;
plot(xaxis1:(xaxis2-xaxis1)/99:xaxis2,lln(:,k),'b-');

end





fuzzfile=['./testanfis.fis'];
fuzzanfis=readfis(fuzzfile);
% output= evalfis(input,fismat)
result=evalfis(input,fuzzanfis);
result(result>0.5)=1;
result(result<=0.5)=0;
hit=sum(truth(:).*result(:))
miss=sum(-1.*truth(:)+result(:)<0)
false=sum(truth(:)+-1.*result(:)<0)
cn=numel(truth-hit-miss-false)
csi=hit/(hit+miss+false)


plot(result,'r*')
hold on;
plot(truth,'b.','markersize',10)
legend('NF predict','Truth')

clear all;
close all;
% figure(1)

fig=figure(1);
set(fig,'Position',[300 600 1000 800]);
ha = tight_subplot(5,5,[.07 .03],[.07 .07],[.07 .05]);


n=1;
    kkk=-10:5:10;
    nk=numel(kkk);

for i=kkk

mu = [i -15];
mu1= [i 0];
mu2= [i 15];

Sigma = [5 0.5; 0.5 5];
Sigma2 = [6 0.5; 0.5 6];


x1 = -25:25; x2 = -25:25;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F1 = mvnpdf([X1(:) X2(:)],mu1,Sigma);
F2 = mvnpdf([X1(:) X2(:)],mu2,Sigma);

rF = reshape(F,length(x2),length(x1));
rF1 = reshape(F1,length(x2),length(x1));
rF2 = reshape(F2,length(x2),length(x1));

aF = mvnpdf([X1(:) X2(:)],mu,Sigma2);
aF1 = mvnpdf([X1(:) X2(:)],mu1,Sigma2);
aF2 = mvnpdf([X1(:) X2(:)],mu2,Sigma2);

arF = reshape(aF,length(x2),length(x1));
arF1 = reshape(aF1,length(x2),length(x1));
arF2 = reshape(aF2,length(x2),length(x1));


% fall=rF.*30*(10-n)+rF1.*30+rF2.*30;
FK=rF.*30*(10-n)+rF1.*300+rF2.*40*abs(1-n);
hFK=arF1.*300+arF2.*40*abs(1-n);
aFK=rF.*30*(10-1)+rF1.*300+rF2.*40*abs(1-1);

saFK=aFK./max(aFK(:));
shFK=hFK./max(hFK(:));
sdif=saFK-shFK+1.0;
ssum=saFK+shFK;
% msdif=(sdif+ssum)./2;
msdif=(sdif+ssum)./2;


totsizesdif=abs(max(msdif(:))-min(msdif(:)));
totmulsdif=(2*exp(1))/totsizesdif;
totconsdif=-1*exp(1)-totmulsdif*min(msdif(:));
totcval=normcdf(totmulsdif.*msdif+totconsdif,0,1);

sumsizesdif=abs(max(ssum(:))-min(ssum(:)));
summulsdif=(2*exp(1))/sumsizesdif;
sumconsdif=-1*exp(1)-summulsdif*min(ssum(:));
sumcval=normcdf(summulsdif.*ssum+sumconsdif,0,1);

difsizesdif=abs(max(sdif(:))-min(sdif(:)));
difmulsdif=(2*exp(1))/difsizesdif;
difconsdif=-1*exp(1)-difmulsdif*min(sdif(:));
difcval=normcdf(difmulsdif.*sdif+difconsdif,0,1);


constt=(nk-(n-1))/nk;
% totwp=(constt.*totcval)./(constt.*totcval+(1-constt).*(1-totcval));
tnum=0.8;
totwp=(constt.*totcval.^tnum)./(constt.*totcval.^tnum+(1-constt).*(1-totcval.^tnum));

difwp=(constt.*difcval)./(constt.*difcval+(1-constt).*(1-difcval));
sumwp=(constt.*sumcval)./(constt.*sumcval+(1-constt).*(1-sumcval));

mFK=(((nk-(n-1))/nk.*aFK)+((1-(nk-(n-1))/nk).*hFK));
totmFK=zeros(size(mFK));
summFK=zeros(size(mFK));
difmFK=zeros(size(mFK));

[nki,nkj]=size(totcval);
for ki=1:nki
    for kj=1:nkj
        totmFK(ki,kj)= totwp(ki,kj)*aFK(ki,kj)+(1-totwp(ki,kj))*hFK(ki,kj);
%        totmFK(ki,kj)= totwp(ki,kj)*aFK(ki,kj)+(1-constt)*hFK(ki,kj);      
       difmFK(ki,kj)= difwp(ki,kj)*aFK(ki,kj)+(1-difwp(ki,kj))*hFK(ki,kj);
       summFK(ki,kj)= sumwp(ki,kj)*aFK(ki,kj)+(1-sumwp(ki,kj))*hFK(ki,kj);
    end
end
% mFK2=(((nk-(n-1))/nk.*aFK)+((1-(nk-(n-1))/nk).*hFK))./2;
% mFK2(mFK2 < 0.1) = NaN;

FK(FK<0.1)=nan;
aFK(aFK<0.1)=nan;
hFK(hFK<0.1)=nan;
mFK(mFK<0.1)=nan;
totmFK(totmFK<0.1)=nan;
% figure(n)
% pcolor(x1,x2,mFK2)
% caxis([0 10])
axes(ha(n))
pcolor(X1,X2,FK);
% colorbar;
caxis([0 10])
shading flat;
title([ ',Obs', ]);

% xlabel('x'); ylabel('y');

axes(ha(n+5))
pcolor(X1,X2,aFK);
% colorbar;
caxis([0 10])
shading flat;
title(['t=' num2str(n-1) ',Linear']);

% xlabel('x'); ylabel('y');

axes(ha(n+10))
pcolor(X1,X2,hFK);
% colorbar;
caxis([0 10])
shading flat;
title(['t=' num2str(n-1) ',Salience "DIF"']);
% xlabel('x'); ylabel('y');

axes(ha(n+15))
pcolor(X1,X2,mFK);
% colorbar;
caxis([0 10])
shading flat;
title(['t=' num2str(n-1) ',Salience "SUM"']);
% xlabel('x'); ylabel('y');

axes(ha(n+20))
pcolor(X1,X2,totmFK);
% colorbar;
caxis([0 10])
shading flat;
title(['t=' num2str(n-1) ',Salience "AVG"']);
% xlabel('x'); ylabel('y');



n=n+1;



end
% surf(x1,x2,F);
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
% axis([-30 30 -30 30 0 .4])
% xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
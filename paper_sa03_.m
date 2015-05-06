clear all;
close all;
    n=1;
    kkk=-10:5:10;
%     kkk=5:5:10;
    
    nk=numel(kkk);
    
fig=figure(1);
set(fig,'Position',[300 600 800 800]);
ha = tight_subplot(5,6,[.02 .02],[.07 .07],[.07 .05]);

for i=kkk

mu = [i 0];
mu1 = [i -15];
mu2 = [i 15];

Sigma = [5 0.5; 0.5 5];
Sigma2 = [6 0.5; 0.5 6];


x1 = -25:0.2:25; x2 = -25:0.2:25;
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

FK=rF.*30*(10-n)+rF1.*300+rF2.*70*abs(1-n);
hFK=arF1.*300+arF2.*70*abs(1-n);
aFK=rF.*30*(10-1)+rF1.*300+rF2.*40*abs(1-1);
saFK=aFK./max(aFK(:));
shFK=hFK./max(hFK(:));
sdif=saFK-shFK+1.0;

difsizesdif=abs(max(sdif(:))-min(sdif(:)));
difmulsdif=(2*exp(1))/difsizesdif;
difconsdif=-1*exp(1)-difmulsdif*min(sdif(:));
difcval=normcdf(difmulsdif.*sdif+difconsdif,0,1);

constt=(nk-(n-1))/nk;
tnum=0.8;

difwp=(constt.*difcval)./(constt.*difcval+(1-constt).*(1-difcval));
difp=sqrt(difcval.^2+constt.^2);
difp2=sqrt((1-difcval).^2+(1-constt).^2);
difwp2=difp./(difp+difp2);
difwp3=0.5.*(difwp+difwp2);
mFK=(((nk-(n-1))/nk.*aFK)+((1-(nk-(n-1))/nk).*hFK));
sFK=(difwp3.*aFK)+((1-difwp).*hFK);

difmFK=zeros(size(mFK));

% [nki,nkj]=size(difcval);
% for ki=1:nki
%     for kj=1:nkj
%         totmFK(ki,kj)= totwp(ki,kj)*aFK(ki,kj)+(1-totwp(ki,kj))*hFK(ki,kj);
%     end
% end

mFK(mFK < 0.1) = NaN;
sFK(sFK < 0.1) = NaN;
FK(FK < 0.1) = NaN;
aFK(aFK < 0.1) = NaN;
hFK(hFK < 0.1) = NaN;
% if n>1
    p=n;
axes(ha(p))
pcolor(X1,X2,FK);
% colorbar;
caxis([0 10])
shading flat;
title(['t=' num2str(n-1)], 'interpreter', 'latex','Fontsize',12);
% xlabel('x'); ylabel('y');

axes(ha(p+6))
pcolor(X1,X2,aFK);
caxis([0 10])
shading flat;

axes(ha(p+12))
pcolor(X1,X2,hFK);
caxis([0 14])
shading flat;

axes(ha(p+18))
pcolor(X1,X2,mFK);
caxis([0 10])
shading flat;

axes(ha(p+24))
pcolor(X1,X2,sFK);
caxis([0 10])
shading flat;

clear mFK;
% end
n=n+1;

end

set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');
p1=['../figs/03_sali_ex2.png'] ;  

frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

close(fig)




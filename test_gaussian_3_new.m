clear all;
close all;
    n=1;
    kkk=-10:5:10;
%     kkk=5:5:10;
    
    nk=numel(kkk);
    
fig=figure(1);
set(fig,'Position',[300 600 800 400]);
ha = tight_subplot(3,5,[.07 .03],[.07 .07],[.07 .05]);

for i=kkk

mu = [i 0];
mu2 = [i -12];
mu3 = [i 12];

Sigma = [1 0.5 ; 0.5 3];
Sigma2 = [1 n/20 ; n/20 nk*0.8+0.2-0.5*n ];
Sigma3 = [1 n/30 ; n/30 5+0.7*n];

hSigma = [1 0.5 ; 0.5 1.5+0.7*n];
hSigma2 = [1 n/20 ; n/20 nk*0.7+0.2-0.6*n ];
hSigma3 = [1 n/30 ; n/30 3.5+0.6*n];

aSigma = [1 0.5 ; 0.5 3];
aSigma2 = [1 1/20 ; 1/20 nk*0.8+0.2-0.5*1 ];
aSigma3 = [1 1/30 ; 1/30 5+0.7*1];

x1 = -20:.2:20; x2 = -20:.2:20;
xx1 = -9:.2:9; xx2 = -9:.2:9;
[XX1,XX2] = meshgrid(xx1,xx2);
% aa=zeros(size(XX1));
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F2 = mvnpdf([X1(:) X2(:)],mu2,Sigma2);
F3 = mvnpdf([X1(:) X2(:)],mu3,Sigma3);

aF = mvnpdf([X1(:) X2(:)],mu,aSigma);
aF2 = mvnpdf([X1(:) X2(:)],mu2,aSigma2);
aF3 = mvnpdf([X1(:) X2(:)],mu3,aSigma3);

hF = mvnpdf([X1(:) X2(:)],mu,hSigma);
hF2 = mvnpdf([X1(:) X2(:)],mu2,hSigma2);
hF3 = mvnpdf([X1(:) X2(:)],mu3,hSigma3);


aa=zeros(size(X1));
 Fn1 = reshape(F,length(x2),length(x1)).*30;
 Fn2 = reshape(F2,length(x2),length(x1)).*(25+(0.5*n));
 Fn3 = reshape(F3,length(x2),length(x1)).*(50-(0.5*n));
 
 aFn1 = reshape(aF,length(x2),length(x1)).*30;
 aFn2 = reshape(aF2,length(x2),length(x1)).*(25+(0.5*1));
 aFn3 = reshape(aF3,length(x2),length(x1)).*(50-(0.5*1));
 
 hFn1 = reshape(hF,length(x2),length(x1)).*30;
 hFn2 = reshape(hF2,length(x2),length(x1)).*(18+(0.2*n));
%  hFn3 = reshape(hF3,length(x2),length(x1)).*50-(0.5*n);
 hFn3=zeros(size(hFn1));
 
 
% FF=zeros(size(F));
FK=(Fn1+Fn2+Fn3).*3;
aFK=(aFn1+aFn2+aFn3).*3;
hFK=(hFn1+hFn2+hFn3).*3;
saFK=aFK./max(aFK(:));
shFK=hFK./max(hFK(:));
sdif=saFK+shFK;
msdif=(saFK+shFK)./2;
asdif=saFK-msdif;
hsdif=shFK-msdif;


% max(sdif(:))
% min(sdif(:))
% sizesdif=abs(max(sdif(:))-min(sdif(:)));
% mulsdif=(2*exp(1))/sizesdif;
% consdif=-1*exp(1)-mulsdif*min(sdif(:));
% cval=normcdf(mulsdif.*sdif+consdif,0,1);
% cval=saFK./(saFK+shFK);
cval=max(saFK,shFK);




constt=(nk-(n-1))/nk;
wp=(constt.*cval)./(constt.*cval+(1-constt).*(1-cval));
% wp=(constt.*cval)./(constt.*cval+(1-constt).*(cval));

% awp=(constt.*acval)./(constt.*acval+(1-constt).*(1-acval));
% hwp=(constt.*hcval)./(constt.*hcval+(1-constt).*(1-hcval));

% w[p]=(t*r[p])/((t*r[p])+((1-t)*(1-r[p]))) 

% plot(min(sdif(:)):max(sdif(:)),normcdf(min(sdif(:)):max(sdif(:))))

mFK=(((nk-(n-1))/nk.*aFK)+((1-(nk-(n-1))/nk).*hFK));
mFK2=zeros(size(mFK));
[nki,nkj]=size(cval);
for ki=1:nki
    for kj=1:nkj
       mFK2(ki,kj)= wp(ki,kj)*aFK(ki,kj)+(1-wp(ki,kj))*hFK(ki,kj);
%        mFK2(ki,kj)= awp(ki,kj)*aFK(ki,kj)+(1-hwp(ki,kj))*hFK(ki,kj);
    end
end
% mFK2=(((nk-(n-1))/nk.*aFK)+((1-(nk-(n-1))/nk).*hFK))./2;
mFK2(mFK2 < 0.1) = NaN;
mFK(mFK < 0.1) = NaN;
FK(FK < 0.1) = NaN;
aFK(aFK < 0.1) = NaN;
hFK(hFK < 0.1) = NaN;

axes(ha(n))
pcolor(X1,X2,FK);
% colorbar;
caxis([0 10])
shading flat;
title(['t=' num2str(n-1) ',Obs']);

% xlabel('x'); ylabel('y');

axes(ha(n+5))
pcolor(X1,X2,mFK);
% colorbar;
caxis([0 10])
shading flat;
title(['t=' num2str(n-1) ',Linear']);

% xlabel('x'); ylabel('y');

axes(ha(n+10))
pcolor(X1,X2,mFK2);
% colorbar;
caxis([0 10])
shading flat;
title(['t=' num2str(n-1) ',Salience']);
% xlabel('x'); ylabel('y');




clear mFK;

n=n+1;
end

set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');
p1=['./sali.png'] ;  

frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

close(fig)




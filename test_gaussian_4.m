clear all;
close all;
    n=1;
    kkk=-20:1:20;
%     kkk=5:5:10;
    
    nk=numel(kkk);
    

for i=kkk

fig=figure(n);
set(fig,'Position',[300 600 600 800]);
ha = tight_subplot(3,2,[.1 .1],[.1 .1],[.1 .1]);

    
mu = [i 0];
mu2 = [i -12];
mu3 = [i 12];

% Sigma = [1 0.5*2 ; 0.5*2 3];
% Sigma2 = [1 n/20 ; n/20 nk*0.8+0.2-0.5*n ];
% Sigma3 = [1 n/30 ; n/30 5+0.7*n];
% 
% hSigma = [1 0.5*2 ; 0.5*2 1.5+0.7*n];
% hSigma2 = [1 n/20 ; n/20 nk*0.7+0.2-0.6*n ];
% hSigma3 = [1 n/30 ; n/30 3.5+0.6*n];
% 
% aSigma = [1 0.5*2 ; 0.5*2 3];
% aSigma2 = [1 1/20 ; 1/20 nk*0.8+0.2-0.5*1 ];
% aSigma3 = [1 1/30 ; 1/30 5+0.7*1];

% Sigma = [1 1 ; 1 3];
% Sigma2 = [1 1 ; 1 nk*0.8+0.2-0.5*n ];
% Sigma3 = [1 1 ; 1 2+0.7*n];
% 
% hSigma = [1 1 ; 0.5*2 1.5+0.7*n];
% hSigma2 = [1 1 ; 1 nk*0.7+0.2-0.6*n ];
% hSigma3 = [1 1 ; 1 2.5+0.6*n];
% 
% aSigma = [1 0.5*2 ; 0.5*2 3];
% aSigma2 = [1 1 ; 1 nk*0.8+0.2-0.5*1 ];
% aSigma3 = [1 1 ; 1 2+0.7*1];

Sigma = [1 1 ; 1 3];
Sigma2 = [1 1 ; 1 5 ];
Sigma3 = [1 1 ; 1 5];

hSigma = [1 1 ; 1 3];
hSigma2 = [1 1 ; 1 5 ];
hSigma3 = [1 1 ; 1 5];

aSigma = [1 0.5*2 ; 0.5*2 3];
aSigma2 = [1 1 ; 1 5 ];
aSigma3 = [1 1 ; 1 5];


x1 = -30:.2:30; x2 = -30:.2:30;
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
 Fn2 = reshape(F2,length(x2),length(x1)).*(45+(0.8*n));
 Fn3 = reshape(F3,length(x2),length(x1)).*(40-(0.5*n));
 
 aFn1 = reshape(aF,length(x2),length(x1)).*30;
 aFn2 = reshape(aF2,length(x2),length(x1)).*(45+(0.8*1));
 aFn3 = reshape(aF3,length(x2),length(x1)).*(40-(0.5*1));
 
 hFn1 = reshape(hF,length(x2),length(x1)).*30;
 hFn2 = reshape(hF2,length(x2),length(x1)).*(45+(0.6*n));
%  hFn3 = reshape(hF3,length(x2),length(x1)).*50-(0.5*n);
 hFn3=zeros(size(hFn1));
 
 
% FF=zeros(size(F));
FK=(Fn1+Fn2+Fn3).*3;
aFK=(aFn1+aFn2+aFn3).*3;
hFK=(hFn1+hFn2+hFn3).*3;
saFK=aFK./max(aFK(:));
shFK=hFK./max(hFK(:));
% sdif=saFK-shFK;
% max(sdif(:))
% min(sdif(:))
% sizesdif=abs(max(sdif(:))-min(sdif(:)));
% mulsdif=(2*exp(1))/sizesdif;
% consdif=-1*exp(1)-mulsdif*min(sdif(:));
% % sdif(sdif == 0) = NaN;
% cval=normcdf(mulsdif.*sdif+consdif);
% constt=(nk-(n-1))/nk;
% wp=(constt.*cval)./(constt.*cval+(1-constt).*(1-cval));
% % w[p]=(t*r[p])/((t*r[p])+((1-t)*(1-r[p]))) 

% sdif=saFK-shFK;
% max(sdif(:));
% min(sdif(:));
% sizesdif=abs(max(sdif(:))-min(sdif(:)));
% mulsdif=(2*exp(1))/sizesdif;
% consdif=-1*exp(1)-mulsdif*min(sdif(:));
% % sdif(sdif == 0) = NaN;
% cval=normcdf(mulsdif.*sdif+consdif);
cval=saFK./(saFK+shFK);
% cval=max(saFK,shFK);

constt=(nk-(n-1))/nk;
% wp=(constt.*cval)./(constt.*cval+(1-constt).*(1-cval));
wp=(constt.*saFK)./(constt.*saFK+(1-constt).*shFK);


wp2=(constt*0.9)/(constt*0.9+(1-constt).*(1-0.9))
% w[p]=(t*r[p])/((t*r[p])+((1-t)*(1-r[p]))) 

% plot(min(sdif(:)):max(sdif(:)),normcdf(min(sdif(:)):max(sdif(:))))

mFK=(((nk-(n-1))/nk.*aFK)+((1-(nk-(n-1))/nk).*hFK));
mFK2=zeros(size(mFK));
[nki,nkj]=size(cval);
for ki=1:nki
    for kj=1:nkj
       mFK2(ki,kj)= wp(ki,kj)*aFK(ki,kj)+(1-wp(ki,kj))*hFK(ki,kj);
    end
end
% mFK2=(((nk-(n-1))/nk.*aFK)+((1-(nk-(n-1))/nk).*hFK))./2;
mFK2(mFK2 < 1) = NaN;
mFK(mFK < 1) = NaN;
FK(FK < 0.1) = NaN;
aFK(aFK < 0.1) = NaN;
hFK(hFK < 0.1) = NaN;

FK(FK < 1) = NaN;
aFK(aFK < 1) = NaN;
hFK(hFK < 1) = NaN;

axes(ha(1))
pcolor(X1,X2,FK);
% colorbar;
caxis([5 10])
shading flat;
title(['t=' num2str(n-1) ',Obs']);

% xlabel('x'); ylabel('y');

axes(ha(2))
pcolor(X1,X2,mFK);
% colorbar;
caxis([5 10])
shading flat;
title(['t=' num2str(n-1) ',Linear']);


axes(ha(3))
pcolor(X1,X2,aFK);
% colorbar;
caxis([5 10])
shading flat;
title(['t=' num2str(n-1) ',ADV']);

axes(ha(4))
pcolor(X1,X2,hFK);
% colorbar;
caxis([5 10])
shading flat;
title(['t=' num2str(n-1) ',HRR']);

% xlabel('x'); ylabel('y');

axes(ha(5))
pcolor(X1,X2,mFK2);
% colorbar;
caxis([5 10])
shading flat;
title(['t=' num2str(n-1) ',Salience']);
% xlabel('x'); ylabel('y');




clear mFK;


set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');
p1=['./sali' num2str(n,'%02i') '.png'] ;

frame = getframe(n);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

close(fig)
n=n+1;


end
  





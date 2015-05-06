clear all;
close all;
w1=1:-0.01:0;
w2=1-w1;
cval=0:0.01:1.0;
% cval2=0.5:0.005:1.0;
% cval=cval2.*2.0-1.0;

wp2=zeros(numel(cval),numel(w1));
cval2=zeros(size(cval));
wpn=wp2;
cvalf=wp2;
cvalf2=wp2;
wp=wp2;
wp3=wp2;




for i=1:numel(cval)
    for j=1:numel(w1)
            cvalf(i,j)=sqrt((cval(i))^2+(w1(j))^2);
            if cvalf(i,j)>1.0
                cvalf(i,j)=1.0;
            end
    end
end

for i=1:numel(cval)
    for j=1:numel(w2)
         cvalf2(i,j)=sqrt(((1-cval(i)))^2+((w2(j)))^2);
         if cvalf2(i,j)>1.0
                cvalf2(i,j)=1.0;
            end
    end
end

 
for i=1:numel(cval)
    for j=1:numel(w1)
%         if w1(j)>0.2
   wp(i,j)=w1(j)*(cval(i))/(w1(j)*(cval(i))+w2(j)*(1-cval(i)));
%         end
    end
end
% figure(k)
%     pcolor(w1,w2,wp(:,:,k))
% end
for i=1:numel(w1);
for j=1:numel(cval)
            wp2(i,j)=cvalf(i,j)/(cvalf(i,j)+cvalf2(i,j));
    end
end

 for i=1:numel(w1);
for j=1:numel(cval)
% if w1(i)<=(1-cval(j))
            wp3(i,j)=(w1(i)*wp(i,j)+w2(i)*wp2(i,j));
%             wp3(i,j)=(0.5*wp(i,j)+0.5*wp2(i,j));
%             wp3(i,j)=(0.5*wp(i,j)+w2(i));
            
            
% else
%             wp3(i,j)=wp(i,j);   
% end
    end
end

fig=figure(1);
set(fig,'Position',[100 600 800 600]);
ha = tight_subplot(2,2,[.1 .1],[.1 .1],[.1 .1]);


axes(ha(1))
pcolor(w1,cval,wp)
shading flat;
grid off;
   set(gca,'XDir','reverse')
colorbar
title(['Salience intensity image1']);
xlabel('Time fraction'); 
ylabel('Intensity');
 caxis([0 1])

axes(ha(2))
pcolor(1-w1,cval,wp2)
shading flat;
grid off;

%  set(gca,'XDir','reverse')
title(['Salience intensity image2']);
colorbar
xlabel('Time fraction'); 
ylabel('Intensity');
 caxis([0 1])
% % % 
axes(ha(3))
pcolor(w1,cval,wp3)
shading flat;
grid off;

set(gca,'XDir','reverse')
title(['Linear intensity image1']);
colorbar
xlabel('Time fraction'); 
ylabel('Intensity');
% 
axes(ha(4))
pcolor(w2,cval,1-wp3)
shading flat;
grid off;

title(['Linear intensity image2']);
% set(gca,'XDir','reverse')
colorbar
xlabel('Time fraction'); 
ylabel('Intensity');

set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');
p1=['./June_01intensities.png'] ;

frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

% plot(wp)
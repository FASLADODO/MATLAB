clear all;
close all;
[x2,y2]=meshgrid(47.9:-0.0253:47.9-0.0253*1058,-127:0.0407:-127+0.0407*1626);
% indcirc=zeros(1627,1059);
nbfcst = 1e3+8e3*rand(1627,1059);
nbobs = 1e3+8e3*rand(1627,1059);
save('nbfcst.dat','nbfcst');
save('nbobs.dat','nbobs');


% randnum=rand(1627,1059);
indcirc=medfilt2(nbfcst>6.5e3,[5 5]);

% for i=1:1627
%     for j=1:1059
%         if sqrt((x2(800,500)-x2(i,j))^2+(y2(800,500)-y2(i,j))^2)>=2
%             indcirc(i,j)=1;
%         else
%             indcirc(i,j)=0;
%         end
%     end
% end
fig=figure;
set(fig,'Position',[100 100 1200 500]);
pcolor(y2,x2,double(indcirc))
shading flat
% axis square
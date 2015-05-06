clear all;
close all;
[y2 x2]=meshgrid(51:-0.03:21,-127:0.03:-65);

totaa=zeros(2067,1001);
% [rlat]=textread('radarloc.dat', '%f %f \n');

% plot(rlat(:,1),rlat(:,2),'r.')
% xlim([-127 -65]);
% ylim([21 51])

usabs = shaperead('statesp020.SHP','UseGeoCoords',true);
lats = [usabs.Lat];
lons = [usabs.Lon];
xlim([-127 -65])
ylim([21 51])
grid on;
grid minor
hold on;
plot(lons,lats,'k-','markersize',1)
saveas(gcf,'radar_range22', 'pdf')

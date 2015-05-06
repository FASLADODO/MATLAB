clear all;
close all;
BDZ=[20; 25; 45; 50;];
RAZ=[5; 10; 45; 50;];
HRZ=[40; 45; 55; 60;];
RHZ=[45; 50; 75; 80;];

BDZDR(1) =-0.68-4.81*10^-2*BDZ(1)+2.92*10^-3*BDZ(1)^2-0.3;
BDZDR(2) =-0.68-4.81*10^-2*BDZ(2)+2.92*10^-3*BDZ(2)^2;
BDZDR(3) =1.42+6.67*10^-2*BDZ(3)+4.85*10^-4*BDZ(3)^2;
BDZDR(4) =1.42+6.67*10^-2*BDZ(4)+4.85*10^-4*BDZ(4)^2+1.0;

RAZDR(1) =-0.5+2.5*10^-3*RAZ(1)+7.50*10^-4*RAZ(1)^2-0.3;
RAZDR(2) =-0.5+2.5*10^-3*RAZ(2)+7.50*10^-4*RAZ(2)^2;
RAZDR(3) =-0.68-4.81*10^-2*RAZ(3)+2.92*10^-3*RAZ(3)^2;
RAZDR(4) =-0.68-4.81*10^-2*RAZ(4)+2.92*10^-3*RAZ(4)^2+0.5;

HRZDR(1) =-0.5+2.5*10^-3*HRZ(1)+7.50*10^-4*HRZ(1)^2-0.3;
HRZDR(2) =-0.5+2.5*10^-3*HRZ(2)+7.50*10^-4*HRZ(2)^2;
HRZDR(3) =-0.68-4.81*10^-2*HRZ(3)+2.92*10^-3*HRZ(3)^2;
HRZDR(4) =-0.68-4.81*10^-2*HRZ(4)+2.92*10^-3*HRZ(4)^2+0.5;

RHZDR(1) =-0.3;
RHZDR(2) =0.0;
RHZDR(3) =-0.5+2.5*10^-3*RHZ(3)+7.50*10^-4*RHZ(3)^2;
RHZDR(4) =-0.5+2.5*10^-3*RHZ(4)+7.50*10^-4*RHZ(4)^2+0.5;

BDR=[0.95; 0.97; 1.00; 1.01;];
RAR=[0.95; 0.97; 1.00; 1.01;];
HRR=[0.92; 0.95; 1.00; 1.01;];
RHR=[0.85; 0.90; 1.00; 1.01;];

BDK(1) =-44.0+0.8*BDZ(1)-1;
BDK(2) =-44.0+0.8*BDZ(2);
BDK(3) =-22.0+0.5*BDZ(3);
BDK(4) =-22.0+0.5*BDZ(4)+1;

RAK(1) =-44.0+0.8*RAZ(1)-1;
RAK(2) =-44.0+0.8*RAZ(2);
RAK(3) =-22.0+0.5*RAZ(3);
RAK(4) =-22.0+0.5*RAZ(4)+1;

HRK(1) =-44.0+0.8*HRZ(1)-1;
HRK(2) =-44.0+0.8*HRZ(2);
HRK(3) =-22.0+0.5*HRZ(3);
HRK(4) =-22.0+0.5*HRZ(4)+1;

RHK(1) =-10;
RHK(2) =-4;
RHK(3) =-44.0+0.8*RHZ(3);
RHK(4) =-44.0+0.8*RHZ(4)+1;

BDSDZ=[0; 0.5; 3; 6;];
RASDZ=[0; 0.5; 3; 6;];
HRSDZ=[0; 0.5; 3; 6;];
RHSDZ=[0; 0.5; 3; 6;];

BDSDP=[0; 1; 15; 30;];
RASDP=[0; 1; 15; 30;];
HRSDP=[0; 1; 15; 30;];
RHSDP=[0; 1; 15; 30;];

kkk=[0; 1; 1; 0;];

text_a = [ '{Characteristics \medskip of \medskip'];
plotout=['./NFresult.eps'];
fig=figure;
set(fig,'Position',[10 10 800 500]);
ha = tight_subplot(2,2,[.07 .07],[.07 .07],[.07 .07]);
axes(ha(1))
text_title = [ text_a '$Z$ (dBZ) }'];
plot(RAZ,kkk,'k-','linewidth',1.5);
hold on;
plot(HRZ,kkk,'r-','linewidth',1.5);
plot(BDZ,kkk,'b--','linewidth',1);
plot(RHZ,kkk,'g--','linewidth',1.5);
h_legend=legend('RA','HR','BD','RH');
set(h_legend,'box','off','interpreter', 'latex','Fontsize',10,'Location','northwest');
title(text_title,'interpreter', 'latex','Fontsize',15);
ylim([0 1.2])
xlim([0 85])
ylabel('{Membership \medskip degree}','interpreter', 'latex','Fontsize',14);
% xlabel('{$Z$ (dBZ) }','interpreter', 'latex','Fontsize',14)
clear kkk1;
% xlbl='{Distance \medskip from \medskip the \medskip center \medskip of \medskip gust \medskip front (km)}';
grid on;

axes(ha(2))
text_title = [ text_a '$Z_{DR} $ (dB) }'];
plot(RAZDR,kkk,'k-','linewidth',1.5);
hold on;
plot(HRZDR,kkk,'r-','linewidth',1.5);
plot(BDZDR,kkk,'b--','linewidth',1);
plot(RHZDR,kkk,'g--','linewidth',1.5);
% h_legend=legend('RA','HR','BD','RH');
set(h_legend,'box','off','interpreter', 'latex','Fontsize',10,'Location','northwest');
title(text_title,'interpreter', 'latex','Fontsize',15);
ylim([0 1.2])
% xlim([0 85])
% ylabel('{Membership \medskip degree}','interpreter', 'latex','Fontsize',14);
% xlabel('{$Z_{DR}$ (dB) }','interpreter', 'latex','Fontsize',14)
clear kkk1;
% xlbl='{Distance \medskip from \medskip the \medskip center \medskip of \medskip gust \medskip front (km)}';
grid on;

axes(ha(3))
text_title = [ text_a '$\rho_{hv}$ }'];
plot(RAR,kkk,'k-','linewidth',1.5);
hold on;
plot(HRR,kkk,'r-','linewidth',1.5);
plot(BDR,kkk,'b--','linewidth',1);
plot(RHR,kkk,'g--','linewidth',1.5);
% h_legend=legend('RA','HR','BD','RH');
set(h_legend,'box','off','interpreter', 'latex','Fontsize',10,'Location','northwest');
title(text_title,'interpreter', 'latex','Fontsize',15);
ylim([0 1.2])
xlim([0.85 1.01])
ylabel('{Membership \medskip degree}','interpreter', 'latex','Fontsize',14);
% ylabel('{Membership \medskip degree}','interpreter', 'latex','Fontsize',14);
% xlabel('{$\rho_{hv}$ (dB) }','interpreter', 'latex','Fontsize',14)
clear kkk1;
% xlbl='{Distance \medskip from \medskip the \medskip center \medskip of \medskip gust \medskip front (km)}';
grid on;

axes(ha(4))
% text_title = [ text_a 'LK$_{DR} $ ($^{\circ}$km$^{-1}$) }'];
text_title = [ text_a '$LK_{DP}$ ($^{\circ}$km$^{-1}$) }'];

plot(RAK,kkk,'k-','linewidth',1.5);
hold on;
plot(HRK,kkk,'r-','linewidth',1.5);
plot(BDK,kkk,'b--','linewidth',1);
plot(RHK,kkk,'g--','linewidth',1.5);
% h_legend=legend('RA','HR','BD','RH');
set(h_legend,'box','off','interpreter', 'latex','Fontsize',10,'Location','northwest');
title(text_title,'interpreter', 'latex','Fontsize',15);
ylim([0 1.2])
xlim([-50 30])
% ylabel('{Membership \medskip degree}','interpreter', 'latex','Fontsize',14);
% ylabel('{Membership \medskip degree}','interpreter', 'latex','Fontsize',14);
% xlabel('{$\rho_{hv}$ (dB) }','interpreter', 'latex','Fontsize',14)
clear kkk1;
% xlbl='{Distance \medskip from \medskip the \medskip center \medskip of \medskip gust \medskip front (km)}';
grid on;

set(gcf,'color','w');
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
print(gcf,'-depsc',plotout);


 






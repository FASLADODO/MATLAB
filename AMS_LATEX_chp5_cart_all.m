run ../header;

pPARTREND=[pngPATH2 '/PARTREND/totalpt1.eps'];


mPARTRENDout=[matPATH2 '/PARTREND/cartDTDmean.mat']; 
load(mPARTRENDout, 'Sumr','Sumr2'); 
totDTD2=Sumr2;
llth=10;
llthnum=llth*2+1;
xcord=-llth/2:0.5:llth/2;
ledg=2.5;
tedg=-2;
VARIL=[2 3 4 5 6 7];
% VARIL=[10];

%  VARIL=[1];

text_a = [ '{Spatial \medskip variation \medskip of \medskip '];
for kkk=1:numel(VARIL)

fig=figure;
set(fig,'Position',[300 600 600 250]);
ha = tight_subplot(1,1,[.1 .1],[.13 .13],[.13 .13]);
if VARIL(kkk)==1
text_title = [ text_a 'ground \medskip truth}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean01NFresult.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip ground \medskip truth}';
clear kkk1;

elseif VARIL(kkk)==2
text_title = [ text_a '$\beta$}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean02beta.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip $\beta$}';
clear kkk1;

elseif VARIL(kkk)==3
text_title = [ text_a 'SD$(v_{r})$}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean03SDV.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip SD($v_{r}$) (ms$^{-1}$)}';
clear kkk1;

elseif VARIL(kkk)==4
text_title = [ text_a '$Z$}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean04Z.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip $Z$ (dBZ)}';
clear kkk1;

elseif VARIL(kkk)==5
text_title = [ text_a '$\rho_{hv}$}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean05rho.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip $\rho_{hv}$}';
ylim([kkk1(1) kkk1(2)])
clear kkk1;

elseif VARIL(kkk)==6
text_title = [ text_a '$Z_{DR}$}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean06ZDR.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip $Z_{DR}$ (dB)}';
clear kkk1;

elseif VARIL(kkk)==7
text_title = [ text_a 'SD($\Phi_{DP}$)}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean07SDP.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip SD($\Phi_{DP}$) ($^{\circ}$)}';
clear kkk1;

elseif VARIL(kkk)==9
text_title = [ text_a '$\Phi_{DP}$}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean09PHI.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip $\Phi_{DP}$ ($^{\circ}$)}';
clear kkk1;

elseif VARIL(kkk)==10
text_title = [ '{Trend \medskip of \medskip NF \medskip result \medskip across \medskip gust \medskip front}'];
text_title = [ text_a 'output \medskip of \medskip rule \medskip inference}'];
plotout=['/Users/hisnameys/Desktop/thesisYHwang/chapter5/figs/mean10NFresult.eps'];
plot(xcord,totDTD2(:,VARIL(kkk)),'b','LineWidth' , 3);
kkk1=get(gca,'ylim');
H=line([0.5 0.5],[kkk1(1) kkk1(2)]);
set(H,'Color','r','LineWidth' , 2)
H2=line([tedg tedg],[kkk1(1) kkk1(2)]);
set(H2,'Color','k','LineWidth' , 2)
H3=line([ledg ledg],[kkk1(1) kkk1(2)]);
set(H3,'Color','y','LineWidth' , 2)
ylim([kkk1(1) kkk1(2)])
ylbl='{Averaged \medskip weighted \medskip mean}';
clear kkk1;

end
xlbl='{Distance \medskip from \medskip the \medskip center \medskip of \medskip gust \medskip front (km)}';
grid on;

set(gcf,'color','w');
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
if VARIL(kkk)==10
title(text_title,'interpreter', 'latex','Fontsize',20,'position',[-0.8 0.72]);
else
title(text_title,'interpreter', 'latex','Fontsize',20);
end
xlabel(xlbl,'interpreter', 'latex','Fontsize',15);
ylabel(ylbl,'interpreter', 'latex','Fontsize',15);
% xlim([-5 5])
print(gcf,'-depsc',plotout);
% close(fig)

end

 



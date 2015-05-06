clear all
close all
centerlinebox=-30:70;
sidebox=-30:70;
numtcl=numel(centerlinebox);
numstd=numel(sidebox);

for pp=1:numtcl
    if (centerlinebox(pp)>=-10 & centerlinebox(pp)<10) 
        llscore(pp)=0.125*centerlinebox(pp)-0.75;
    elseif (centerlinebox(pp)>=10 & centerlinebox(pp)<15)
        llscore(pp)=0.3*centerlinebox(pp)-2.5;
    elseif (centerlinebox(pp)>=15 & centerlinebox(pp)<=25)
        llscore(pp)=2;
    elseif (centerlinebox(pp)>25 & centerlinebox(pp)<40)
        llscore(pp)=-0.1*centerlinebox(pp)+4.5;
    elseif (centerlinebox(pp)>=40 & centerlinebox(pp)<50)
        llscore(pp)=-0.05*centerlinebox(pp)+2.5;
    elseif (centerlinebox(pp)>=50 )
        llscore(pp)=0;
    elseif (centerlinebox(pp)<-10)
        llscore(pp)=-2;
    end
%     clscore(pp)=(sum(llscore(:)));
end
 
for ppp=1:numtcl
    if (sidebox(ppp)>=-10 & sidebox(ppp)<0) 
        ssscore(ppp)=-0.25*sidebox(ppp)-1;
    elseif (sidebox(ppp)>=0 & sidebox(ppp)<10) 
        ssscore(ppp)=-0.1*sidebox(ppp)-1;
    elseif (sidebox(ppp)>=10)
        ssscore(ppp)=-2;
    elseif (sidebox(ppp)<-10)
        ssscore(ppp)=1.5;
    end
end

 plot(centerlinebox,llscore,'k','linewidth',2)
ylim([-3 3])
 hold on;
plot(centerlinebox,ssscore,'b','linewidth',2)
hold off;

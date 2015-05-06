clear all;
close all;
% from(state)_method_to(state)=[prob; reward;]
rB=5;
rD=1;
rW=0;
% % % % % % % % % % % % % % % % % % % % % % % % 
% % policy B_dive_D, D_swim_W, S_climb_S
% % % % % % % % % % % % % % % % % % % % % % % % 
alpha=0.05;
gamma=0.9;
VB=0;
VD=0;
VW=0;
VS=0; %%terminal 
VB=VB+alpha*(rB+gamma*VD-VB);
VD=VD+alpha*(rD+gamma*VW-VD);
VW=VW+alpha*(rW+gamma*VS-VW);
VB
VD
VW
VS
QB=0;
QD=0;
QW=0;
QS=0; %%terminal 
QB=QB+alpha*(rB+gamma*0-QB);
QD=QD+alpha*(rD+gamma*0-QD);
QW=QW+alpha*(rW+gamma*0-QW);
% %  since Q are all set to zeros at the beginning
QB
QD
QW
QS
VB=0;
VD=0;
VW=0;
VS=0;

eb=1
lambda=0.8;
deltaB=rB+gamma*VD-VB;
VB=VB+alpha*deltaB*eb
eb=gamma*lambda*eb;

ed=1;
deltaD=rD+gamma*VW-VD;
V2B=VB+alpha*deltaD*eb
eb=gamma*lambda*eb
V2D=VD+alpha*deltaD*ed
ed=gamma*lambda*ed;
ew=1;
deltaW=rW+gamma*VS-VW;
V2W=VW+alpha*deltaW*ew
ew=gamma*lambda*ew;

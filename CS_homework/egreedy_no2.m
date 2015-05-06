% % ----------Yunsung Hwang #112855905 Meteorology for the CS HW no.2 
close all; 
clc; 
clear all; 

nB = 2000;  
nA = 10; 
nP = 1000; 
sigma = 1.0; 


randn('seed',0); 
for qi=1:nB
    for qj=1:nA
        mu(qi,qj)=0;
    end
end
% q_SMean = mvnrnd( mu, eye(nA) ); 
qStarMeans = mvnrnd( zeros(nB,nA), eye(nA) ); 
epsArray = [ 0, 0.01, 0.1 ]; 

% assume we have at least ONE draw from each "arm" (initialize with use the qStarMeans matrix):
qT0 = mvnrnd( qStarMeans, eye(nA) );

avgReward    = zeros(length(epsArray),nP); 
perOptAction = zeros(length(epsArray),nP); 
cumReward    = zeros(length(epsArray),nP); 
cumProb      = zeros(length(epsArray),nP); 
for ei=1:length(epsArray), 
  tEps = epsArray(ei); 

  %qT = qT0;  % <- initialize to one draw per arm 
  qT = zeros(size(qT0));  % <- initialize to zero draws per arm (no knowledge)
  pqT = zeros(size(qT0));  % <- initialize to zero draws per arm (no knowledge)
  qN = ones( nB, nA );
  qS=zeros(size(qT0));
  allRewards      = zeros(nB,nP); 
  pickedMaxAction = zeros(nB,nP); 
  for bi=1:nB-1, % pick a bandit
    for pi=1:nP, % make a play
      % determine if this move is exploritory or greedy: 
      if( rand(1) <= tEps ) % pick a RANDOM arm: 
        [dum,arm] = histc(rand(1),linspace(0,1+eps,nA+1)); clear dum; 
      else                  % pick the GREEDY arm:
        [dum,arm] = max( qT(bi,:) ); clear dum; 
      end
      % determine if the arm selected is the best possible: 
      [dum,bestArm] = max( qStarMeans(bi,:) ); 
      if( arm==bestArm ) pickedMaxAction(bi,pi) = 1; end
      % get the reward from drawing on that arm: 
      reward = qStarMeans(bi,arm) + sigma*randn(1); 
      allRewards(bi,pi) = reward; 
      qN(bi,arm) = qN(bi,arm)+1;
      qS(bi,arm) = qS(bi,arm)+reward; 
      pqT(bi,arm) = qS(bi,arm)/qN(bi,arm); 
      qT(bi,arm) = pqT(bi,arm)+0.1*(reward-pqT(bi,arm));
%       else
%       qT(bi,arm) = 0.1*(reward);    
%       end
%       oldarm=arm;
      
    end
  end

  avgRew          = mean(allRewards,1);
  avgReward(ei,:) = avgRew(:).'; 
  percentOptAction   = mean(pickedMaxAction,1);
  perOptAction(ei,:) = percentOptAction(:).';
  csAR            = cumsum(allRewards,2); % do a cummulative sum across plays for each bandit
  csRew           = mean(csAR,1);
  cumReward(ei,:) = csRew(:).';
  csPA          = cumsum(pickedMaxAction,2)./cumsum(ones(size(pickedMaxAction)),2);
  csProb        = mean(csPA,1);
  cumProb(ei,:) = csProb(:).';
end

clf;
fig=figure(1);
set(fig,'Position',[100 100 800 1000]);
ha = tight_subplot(3,2,[.07 .07],[.1 .07],[.07 .07]);

axes(ha(1))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  %all_hnds(ei) = plot( [ 0, avgReward(ei,:) ], [clrStr(ei)] ); 
  all_hnds(ei) = plot( 1:nP, avgReward(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
 ylabel( 'Average reward' ); 
 ylim([0 1.5])

axes(ha(2))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  %all_hnds(ei) = plot( [ 0, avgReward(ei,:) ], [clrStr(ei)] ); 
  all_hnds(ei) = plot( 1:nP, perOptAction(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
 ylabel( 'Optimal action (%)' );

axes(ha(3))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  all_hnds(ei) = plot( 1:nP, cumReward(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
legend(  { '0', '0.01', '0.1' }, 'Location', 'Northwest' ); 
grid on; 
ylabel( 'Cummulative average reward' ); 
ylim([0 1500])

axes(ha(4))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  all_hnds(ei) = plot( 1:nP, cumProb(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
ylabel( 'Cummulative optimal action (%)' );

axes(ha(5))
clrStr = 'brk'; all_hnds = []; 
all_hnds(ei) = plot( 1:nP, cumReward(3,:)-cumReward(2,:), 'r-' ); 
hold on;
all_hnds(ei) = plot( 1:nP, cumReward(3,:)-cumReward(1,:), 'b-' ); 
legend(  { 'r0.1-r0.01', 'r0.1-r0' }, 'Location', 'Northwest' ); 
grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative average reward diff' ); 
% ylim([0 100])

axes(ha(6))
clrStr = 'brk'; all_hnds = []; 
all_hnds(ei) = plot( 1:nP, cumProb(3,:)-cumProb(2,:), 'r-' ); 
hold on;
all_hnds(ei) = plot( 1:nP, cumProb(3,:)-cumProb(1,:), 'b-' ); 
legend(  { 'c0.1-c0.01', 'c0.1-c0' }, 'Location', 'Southeast' ); 
grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative optimal action (%) diff' );

set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');
p1=['./no2.png'] ;  
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

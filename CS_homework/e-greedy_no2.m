
close all; 
clc; 
clear; 

%   nB = 2000;  
%   nA = 10; 
%   nP = 1000; 
  
   nB = 100;  
  nA = 10; 
  nP = 100; 
  
sigma = 1.0; 

randn('seed',0); 

realA=1:10;
% generate the TRUE reward Q^{\star}: 
% qStarMeans = mvnrnd( zeros(nB,nA), eye(nA) ); 
for qi=1:nB
    for qj=1:nA
        qStarMeans(qi,qj)=realA(qj);
    end
end
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
  qN = ones( nB, nA ); % keep track of the number draws on this arm 
  qS = qT;             % keep track of the SUM of the rewards (qT = qS./qN) 

  allRewards      = zeros(nB,nP); 
  pickedMaxAction = zeros(nB,nP); 
  for bi=1:nB, % pick a bandit
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
      % update qN,qS,qT-using: 
      if pi>1
      qT(bi,arm) = qT(bi,oldarm)+0.1*(reward-qT(bi,oldarm));
      else
      qT(bi,arm) = 0.1*(reward);    
      end
      oldarm=arm;
      
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

fig=figure(1);
set(fig,'Position',[300 600 800 400]);
ha = tight_subplot(2,2,[.07 .03],[.07 .07],[.07 .05]);

axes(ha(1))
hold on; clrStr = 'brkc'; all_hnds = []; 
for ei=1:length(epsArray),
  %all_hnds(ei) = plot( [ 0, avgReward(ei,:) ], [clrStr(ei)] ); 
  all_hnds(ei) = plot( 1:nP, avgReward(ei,:), [clrStr(ei),'-'] ); 
end 
legend( all_hnds, { '0', '0.01', '0.1' }, 'Location', 'SouthEast' ); 
axis tight; grid on; 
xlabel( 'plays' ); ylabel( 'Average Reward' ); 

axes(ha(2))
hold on; clrStr = 'brkc'; all_hnds = []; 
for ei=1:length(epsArray),
  %all_hnds(ei) = plot( [ 0, avgReward(ei,:) ], [clrStr(ei)] ); 
  all_hnds(ei) = plot( 1:nP, perOptAction(ei,:), [clrStr(ei),'-'] ); 
end 
legend( all_hnds, { '0', '0.01', '0.1' }, 'Location', 'SouthEast' ); 
axis( [ 0, nP, 0, 1 ] ); axis tight; grid on; 
xlabel( 'plays' ); ylabel( '% Optimal Action' );

axes(ha(3))
 hold on; clrStr = 'brkc'; all_hnds = []; 
for ei=1:length(epsArray),
  all_hnds(ei) = plot( 1:nP, cumReward(ei,:), [clrStr(ei),'-'] ); 
end 
legend( all_hnds, { '0', '0.01', '0.1' }, 'Location', 'SouthEast' ); 
axis tight; grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative Average Reward' ); 

axes(ha(4))
 hold on; clrStr = 'brkc'; all_hnds = []; 
for ei=1:length(epsArray),
  all_hnds(ei) = plot( 1:nP, cumProb(ei,:), [clrStr(ei),'-'] ); 
end 
legend( all_hnds, { '0', '0.01', '0.1' }, 'Location', 'SouthEast' ); 
axis( [ 0, nP, 0, 1 ] ); axis tight; grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative % Optimal Action' );
close all; 
clc; 
clear; 

  nB = 2000;  
  nA = 5; 
  nP = 1000; 
sigma = 1.0; 
randn('seed',0); 

realA=-2:2;
% generate the TRUE reward Q^{\star}: 
% qStarMeans = mvnrnd( zeros(nB,nA), eye(nA) ); 
for qi=1:nB
    for qj=1:nA
        qStarMeans(qi,qj)=realA(qj);
    end
end
qStarMeans = mvnrnd( zeros(nB,nA), eye(nA) );
epsArray = [ 0, 1, 10 ]; 

% run an experiment for each temperature:
% temp << 1 => fully greedy method
% temp >> 1 => uniform selction fully exploritory
temperatureArray = [ 0.01, 0.1, 1 ];

% assume we have at least ONE draw from each "arm" (initialize with use the qStarMeans matrix):
qT0 = mvnrnd( qStarMeans, eye(nA) );

avgReward    = zeros(length(temperatureArray),nP); 
perOptAction = zeros(length(temperatureArray),nP); 
cumReward    = zeros(length(temperatureArray),nP); 
cumProb      = zeros(length(temperatureArray),nP); 
for ei=1:length(temperatureArray), 
  Temp = temperatureArray(ei); 

  %qT = qT0;  % <- initialize to one draw per arm 
  qT = zeros(size(qT0));  % <- initialize to zero draws per arm (no knowledge)
  qN = ones( nB, nA ); % keep track of the number draws on this arm 
  qS = qT;             % keep track of the SUM of the rewards (qT = qS./qN) 

  allRewards      = zeros(nB,nP); 
  pickedMaxAction = zeros(nB,nP); 
  for bi=1:nB, % pick a bandit
    for pi=1:nP, % make a play
      % determine the move to make based on past experience:
      % 
      qt        = qT(bi,:);                            % <- pick the current belief on the rewards to come from each action
      smp       = exp(qt/Temp) ./ sum(exp(qt/Temp));    % <- compute the softmax probabilities (use Gibbs)
      [dum,arm] = histc(rand(1),[0,cumsum(smp)]); clear dum; 
      if( arm<1 || arm>nA )
        arm
        qt
        smp
      end
      % determine if the arm selected is the best possible: 
      [dum,bestArm] = max( qStarMeans(bi,:) ); 
      if( arm==bestArm ) pickedMaxAction(bi,pi) = 1; end
      % get the reward from drawing on that arm: 
      reward = qStarMeans(bi,arm) + sigma*randn(1); 
      allRewards(bi,pi) = reward; 
      % update qN,qS,qT: 
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
set(fig,'Position',[300 600 800 500]);
ha = tight_subplot(2,2,[.07 .07],[.1 .07],[.07 .07]);

axes(ha(1))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  %all_hnds(ei) = plot( [ 0, avgReward(ei,:) ], [clrStr(ei)] ); 
  all_hnds(ei) = plot( 1:nP, avgReward(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
 ylabel( 'Average Reward' ); 
 ylim([0 1.5])

axes(ha(2))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  %all_hnds(ei) = plot( [ 0, avgReward(ei,:) ], [clrStr(ei)] ); 
  all_hnds(ei) = plot( 1:nP, perOptAction(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
 ylabel( '% Optimal Action' );

axes(ha(3))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  all_hnds(ei) = plot( 1:nP, cumReward(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
legend( all_hnds, { '0', '1', '10' }, 'Location', 'SouthEast' ); 
grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative Average Reward' ); 
ylim([0 1500])

axes(ha(4))
clrStr = 'brk'; all_hnds = []; 
for ei=1:length(epsArray),
  all_hnds(ei) = plot( 1:nP, cumProb(ei,:), [clrStr(ei),'-'] ); 
  hold on;
end 
grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative % Optimal Action' );

set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');
p1=['./no3_2.png'] ;  
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

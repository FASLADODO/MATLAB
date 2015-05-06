% % ----------Yunsung Hwang #112855905 Meteorology for the CS HW no.3_2 
% %  I used max to get the best arm among 2000 bandit -> Gaussian
% % distribution with mean of -2, -1, 0, 1, 2 with std of 1
close all; 
clear all;  
%foloowing the example number of bandit =2000
%number of arm =5
%iteration,play of arm =1000
%sigma for making gaussian distribution = 1.0
nB = 2000;  
nA = 5; 
nP = 1000; 
sigma = 1.0; 
randn('seed',0); 
% making an array of considering the given reward and make distribution using command mvnrnd:
realA=-2:2;
for qi=1:nB
    for qj=1:nA
        mu(qi,qj)=realA(qj);
    end
end
q_SMean = mvnrnd( mu, eye(nA) ); 
% temp 1 and 10 for the problem 2 and 0.1 to see if it is closer to greedy
% the figures will be divided into all 3 and only 2 to figure out more
% closely
temperatureA = [ 0.1, 1, 10];
% This is one draw from each arm using reward array of q_SMean
qT0 = mvnrnd( q_SMean, eye(nA) );
% For the average reward, percent of opt action, and cumulatives of them
avgR    = zeros(length(temperatureA),nP); 
poA = zeros(length(temperatureA),nP); 
cumR    = zeros(length(temperatureA),nP); 
cumP      = zeros(length(temperatureA),nP); 
for einx=1:length(temperatureA), 
    tempone = temperatureA(einx); 
    % initialize qT using to one draw per arm (no knowlege)
    qT = zeros(size(qT0));  
    pqT = zeros(size(qT0));  % <previous qT
    qN = ones( nB, nA );
    qS=zeros(size(qT0));
    allR      = zeros(nB,nP); 
    Max_action_pick = zeros(nB,nP); 
    for bi=1:nB, %  bandit
        for pi=1:nP, % play
        qt=qT(bi,:);    
        % using the softmax probabilities 
        smp= exp(qt/tempone) ./ sum(exp(qt/tempone));    
        [dconst,arm] = histc(rand(1),[0,cumsum(smp)]); 
        clear dconst; 
        % find the best possible: 
        [dconst,bestArm] = max( q_SMean(bi,:) ); 
        if( arm==bestArm ) 
            Max_action_pick(bi,pi) = 1; 
        end
        reward = q_SMean(bi,arm) + sigma*randn(1); 
        allR(bi,pi) = reward; 
        % using weinxghted average
        qN(bi,arm) = qN(bi,arm)+1;
        qS(bi,arm) = qS(bi,arm)+reward; 
        pqT(bi,arm) = qS(bi,arm)/qN(bi,arm); 
        qT(bi,arm) = pqT(bi,arm)+0.1*(reward-pqT(bi,arm));
        end
    end
avgRew = mean(allR,1);
avgR(einx,:) = avgRew(:).'; 
A_opt_pct   = mean(Max_action_pick,1);
poA(einx,:) =A_opt_pct(:).';
csAR = cumsum(allR,2); 
csRew = mean(csAR,1);
cumR(einx,:) = csRew(:).';
csPA = cumsum(Max_action_pick,2)./cumsum(ones(size(Max_action_pick)),2);
csProb = mean(csPA,1);
cumP(einx,:) = csProb(:).';
end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % tight_subplot is a function that make possible to make tight multiple
% figures
clf;
fig=figure(1);
set(fig,'Position',[100 100 800 500]);
ha = tight_subplot(2,2,[.07 .07],[.1 .07],[.07 .07]);
axes(ha(1))
clrStr = 'brk'; all_hnds = []; 
for einx=1:length(temperatureA),
  all_hnds(einx) = plot( 1:nP, avgR(einx,:), [clrStr(einx),'-'] ); 
  hold on;
end 
grid on; 
ylabel( 'Average Reward' ); 
ylim([0 2.2])
axes(ha(2))
clrStr = 'brk'; all_hnds = []; 
for einx=1:length(temperatureA),
  all_hnds(einx) = plot( 1:nP, poA(einx,:), [clrStr(einx),'-'] ); 
  hold on;
end 
grid on; 
ylabel( '% Optimal action (%)' );
axes(ha(3))
clrStr = 'brk'; all_hnds = []; 
for einx=1:length(temperatureA),
  all_hnds(einx) = plot( 1:nP, cumR(einx,:), [clrStr(einx),'-'] ); 
  hold on;
end 
legend( all_hnds, { '0.1', '1', '10' }, 'Location', 'Northwest' ); 
grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative average reward' ); 
ylim([0 2200])
axes(ha(4))
clrStr = 'brk'; all_hnds = []; 
for einx=1:length(temperatureA),
  all_hnds(einx) = plot( 1:nP, cumP(einx,:), [clrStr(einx),'-'] ); 
  hold on;
end 
grid on; 
xlabel( 'plays' ); ylabel( 'Cummulative optimal action (%)' );
set(gcf, 'PaperPositionMode','auto');
set(gcf,'render','painter')
set(gcf,'color','w');
p1=['./no3_2.png'] ;  
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,p1,'png');

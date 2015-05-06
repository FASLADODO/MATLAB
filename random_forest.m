clear all
close all
% Define the signal and noise distribution parameters:
variance = 1;

noiseMean = 0;
signalMean = 1;

% List of criterion values
criterionList = -4:.2:6;

% Number of trials for each criterion value
nTrials = 100;

% Zero out some vectors ahead of time
pCR = zeros(1,length(criterionList));
pHit = zeros(1,length(criterionList));
dPrimeEst = zeros(1,length(criterionList));

% Loop through the list of criterion values
for criterionNum = 1:length(criterionList)
    criterion = criterionList(criterionNum);

    %Choose a random sequence of 'signal' and noise' trials with equal
    %numbers:
    stim = shuffle(floor(linspace(.5,1.5,nTrials)));  %think about it...

    resp = zeros(1,nTrials);
    for i=1:nTrials
        if stim(i) == 0  %noise trial
            internalResponse = randn(1)*sqrt(variance)+noiseMean;
        else
            internalResponse = randn(1)*sqrt(variance)+signalMean;
        end

        %Decision:
        resp(i) = internalResponse>criterion;
    end

    %Calculate our estimate of D-Prime, and save the correct rejection rate
    %and the hit rate for later.

    %Correct rejections
    pCR(criterionNum)  = sum(resp==0 & stim ==0)/sum(stim ==0);
    zCR = inverseNormalCDF(pCR(criterionNum) );

    %Hits
    pHit(criterionNum)  = sum(resp==1 & stim==1)/sum(stim==1);
    zHit = inverseNormalCDF(pHit(criterionNum) );

    dPrimeEst(criterionNum) = zCR+zHit;
end

figure(4)
clf

plot(pFA,pHit,'ko','MarkerFaceColor','b');
set(gca,'XLim',[0,1]);
set(gca,'YLim',[0,1]);
axis square
xlabel('p(False Alarm)');
ylabel('p(Hit)');
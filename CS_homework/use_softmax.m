%Initializations are Here:
NumMachines=5;
% ActQ=randn(NumMachines,1); %10 machines
ActQ=[-2; -1; 0; 1; 2;]; %10 machines
NumPlay=1000; %Play 100 times
% Initialtau=1; %Initial tau ("High in beginning")
% Endingtau=1;
tau=0.1;
NumPlayed=zeros(NumMachines,1); %Keep a running sum of the number
% of times each action is selected
ValPlayed=zeros(NumMachines,1); %Keep a running sum of the total
% reward for each action
EstQ=zeros(NumMachines,1);
PayoffHistory=zeros(NumPlay,1); %Keep a record of our payoffs
for i=1:NumPlay
%Pick a machine to play:
a=softmax(EstQ,tau);
%Play the machine and update EstQ, tau
% Payoff=randn+ActQ(a);
Payoff=ActQ(a);

NumPlayed(a)=NumPlayed(a)+1;
ValPlayed(a)=ValPlayed(a)+Payoff;
EstQ(a)=ValPlayed(a)/NumPlayed(a);
PayoffHistory(i)=Payoff;
% tau=Initialtau*(Endingtau/Initialtau)^(i/NumPlay);
end
[v,winningmachine]=max(ActQ);
% winningmachine
% NumPlayed
% plot(1:5,ActQ,'k',1:5,EstQ,'r')
plot(PayoffHistory)
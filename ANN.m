clear all;
close all;

P = [0 1 2 3 4 5 6 7 8 9 10];
T = [0 1 2 3 4 3 2 1 2 3 4];
net = newff([0 10],[5 1],{'tansig' 'purelin'});
% Y = sim(net,P);
% plot(P,T,P,Y,'o')

net.trainParam.epochs = 50;
% net = train(net,P,T);
[net,tr]=train(net,P,T);
wb = getwb(net);
save('testnet.mat','net');
P2 = [0.2 1.2 2.1 3.5 4.3 5.1 6.9 ];
Y = sim(net,P2);
plot(P,T,P2,Y,'o')
% 
% gensim(net)
% 
% t=[0:10];
% u=ones(1,11);
% tu=[t;u];
% save newfrom.mat tu;
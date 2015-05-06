clear all;
close all;
rdata=load('hw7.csv');
plot(rdata(:,1),'k.')
X=rdata;
emgm(X,randi(500,3))

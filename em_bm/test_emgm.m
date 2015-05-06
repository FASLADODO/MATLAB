% X = zeros(600,2); 

clear all;
close all;
rdata=load('hw7.csv');
% plot(rdata(:,1),'k.')
X=rdata;

% X(1:200,:) = normrnd(0,1,200,2); 
% X(201:400,:) = normrnd(0,2,200,2); 
% X(401:600,:) = normrnd(0,3,200,2); 
[W,M,V,L] = EM_GM(X,3,[],100,1,[])
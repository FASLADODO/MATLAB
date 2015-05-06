


hold on;
Ravg=zeros(1000,1);
E=0;
for j=1:100
% m=randn(10,1);
m=[-2; -1; 0; 1; 2;];
[As,Q,R]=banditE(1000,m,E);
Ravg=Ravg+Q;
if mod(j,10)==0
% fprintf('On iterate %d\n',j);
end
end
Ravg=Ravg./2000;
plot(Ravg);


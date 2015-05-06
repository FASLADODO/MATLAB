clear all;
close all;
A=randn(10,10);
A2=(A>0.5);
% pcolor(double(A2))
% A = (rand(8)<0.5).*rand(8); % just a random matrix
[i,j] = find(A2==1);
figure(1)
plot(i,j,'k.')
% for k=numel(i)
%     plot(i(k),j(k),'k.')
%     hold on
% end
hold on;
plot(mean(i),mean(j),'r.')
% centeroid = [mean(i),mean(j)];

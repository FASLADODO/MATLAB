clear all;
close all;
rdata=load('hw7.csv');
% plot(rdata(:,1),'k.')
x=rdata(:,1);
wij=zeros(500,3);
muj=zeros(3,1);
theta=muj+0.5;
No2c=zeros(500,3,100);
% % % % -> initialize theta as 0.5 equally
sigma=muj;

for i=1:3
wij(:,i)=rdata(:,i+1);    
sum(wij(:,i))
end

muitr=zeros(100,3);
thitr=muitr;
siitr=muitr;
muitra=zeros(100,9);

% ------------------loop here
for p=1:100
for j1=1:3
muj(j1)=sum(x.*(wij(:,j1)))/sum(wij(:,j1));   
end
for j2=1:3
sigma(j2)=sqrt(sum((x-muj(j2)).^2.*(wij(:,j2)))/sum(wij(:,j2)));  
% sigma(i)=(1/sqrt(500))*sum((x-muj(i)).*(x-muj(i)));   
end

% for j5=1:3
%     theta(j5)=sum(wij(:,j5))/500;
% end

for i2=1:500
    sumwij=0;
    prewij=zeros(3,1);
    for j3=1:3
    prewij(j3)=theta(j3)*normpdf(x(i2),muj(j3),sigma(j3));   
    sumwij=sumwij+prewij(j3);
    end
    
    for j4=1:3
  wij(i2,j4)=prewij(j4)/sumwij;
    end
end

No2c(:,:,p)=wij(:,:);


for j5=1:3
    theta(j5)=sum(wij(:,j5))/500;
end

for j6=1:3
muitr(p,j6)=muj(j6);
thitr(p,j6)=theta(j6);
siitr(p,j6)=sigma(j6);
muitra(p,j6)=muj(j6);
muitra(p,j6+3)=theta(j6);
muitra(p,j6+6)=sigma(j6);

end

end

figure(1)
plot(muitr(:,1),'k')
hold on;
plot(muitr(:,2),'b')
plot(muitr(:,3),'r')
title('Mu')

figure(2)
plot(thitr(:,1),'k')
hold on;
plot(thitr(:,2),'b')
plot(thitr(:,3),'r')2
title('Theta')

figure(3)
plot(siitr(:,1),'k')
hold on;
plot(siitr(:,2),'b')
plot(siitr(:,3),'r')
title('Sigma')
% 
% 
% 
% % ----------------loop here

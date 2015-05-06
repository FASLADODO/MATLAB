clear all
x=[1 2 3 4 5 6 7 8 9 10]';
y=[1 2 3 4 5 6 7 8 9 10]';

numx=numel(x);

multixy=zeros(numx,1);
xsq=zeros(numx,1);
ysq=zeros(numx,1);

for i=1:numx
    multixy(i)=x(i)*y(i);
    xsq(i)=x(i)^2;
    ysq(i)=y(i)^2;
end

sumx=sum(x);
sumy=sum(y);
sumxsq=sum(xsq);
sumysq=sum(ysq);
summultixy=sum(multixy);

rnumel=numx*summultixy-sumx*sumy;
rdenom=sqrt(numx*sumxsq-sumx^2)*sqrt(numx*sumysq-sumy^2);

r=rnumel/rdenom

figure(1)
scatter(x,y,'k.')
titlefg1=['r is    ' num2str(r)];
title(titlefg1,'fontsize',20)

x=[1 2 5 6 7 8 9 8 9 10]';
y=[1 2 3 4 5 6 7 8 9 10]';

numx=numel(x);

multixy=zeros(numx,1);
xsq=zeros(numx,1);
ysq=zeros(numx,1);

for i=1:numx
    multixy(i)=x(i)*y(i);
    xsq(i)=x(i)^2;
    ysq(i)=y(i)^2;
end

sumx=sum(x);
sumy=sum(y);
sumxsq=sum(xsq);
sumysq=sum(ysq);
summultixy=sum(multixy);

rnumel=numx*summultixy-sumx*sumy;
rdenom=sqrt(numx*sumxsq-sumx^2)*sqrt(numx*sumysq-sumy^2);

r=rnumel/rdenom

figure(2)
scatter(x,y,'k.')
titlefg1=['r is    ' num2str(r)];
title(titlefg1,'fontsize',20)

x=rand(20,1)
y=rand(20,1)
% [6 7 8 6 7 8 4 5 6 7]';
% y=[1 2 3 4 5 6 7 8 9 10]';

numx=numel(x);

multixy=zeros(numx,1);
xsq=zeros(numx,1);
ysq=zeros(numx,1);

for i=1:numx
    multixy(i)=x(i)*y(i);
    xsq(i)=x(i)^2;
    ysq(i)=y(i)^2;
end

sumx=sum(x);
sumy=sum(y);
sumxsq=sum(xsq);
sumysq=sum(ysq);
summultixy=sum(multixy);

rnumel=numx*summultixy-sumx*sumy;
rdenom=sqrt(numx*sumxsq-sumx^2)*sqrt(numx*sumysq-sumy^2);

r=rnumel/rdenom

figure(3)
scatter(x,y,'k.')
titlefg1=['r is     ' num2str(r)];
title(titlefg1,'fontsize',20)






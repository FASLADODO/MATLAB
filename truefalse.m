
[x,y]=meshgrid(-40:0.5:40,-40:0.5:40);
[ss,ss]=size(x);
plate=zeros(ss,ss);
plate2=plate;
plate3=plate;
plate4=plate;
plate5=plate;


plate4(81,60:100)=1;
plate2(81,40:120)=1;
plate2(81,40:120)=1;
plate3(40:120,40:120)=1;
ind1=(plate2==1);
ind3=(plate4==1);

x1=x(ind1);
y1=y(ind1);
x3=x(ind3);
y3=y(ind3);


figure(1)

% pcolor(x,y,plate3); hold on;
plot(x3,y3,'b.','linewidth',4); hold on;
plot(x1,y1,'k--','linewidth',2); hold on;
contour(x,y,plate3,'k','linewidth',1); hold on;



xlim([-40 40])
ylim([-40 40])


% pcolor(x,y,plate2);
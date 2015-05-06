clear all;
close all;
aa=csvread('nowcast360.csv');
bb=csvread('renowcast360.csv');
aa1=(aa(:,1));
aa2=(aa(:,2));
aa3=(aa(:,3));
aa4=(aa(:,4));
aa5=(aa(:,5));
aa6=(aa(:,6));
aa7=(aa(:,7));
aa8=(aa(:,8));

var1=['mean error'];
var2=['mean square error'];
var3=['error std'];
var4=['mean abs error'];
var5=['prob detection'];
var6=['False alarm'];
var7=['CIS'];
var8=['num_pixel'];
pn1=['var1.png'];
pn2=['var2.png'];
pn3=['var3.png'];
pn4=['var4.png'];
pn5=['var5.png'];
pn6=['var6.png'];
pn7=['var7.png'];
pn8=['var8.png'];

figure(1)
plot(15*(1:24),aa1)
hold on;
plot(15*(1:24),bb(:,1),'r')
title(var1,'fontsize',15)
saveas(gcf,pn1)

figure(2)
plot(15*(1:24),aa2)
hold on;
plot(15*(1:24),bb(:,2),'r')
title(var2,'fontsize',15)
saveas(gcf,pn2)

figure(3)
plot(15*(1:24),aa3)
hold on;
plot(15*(1:24),bb(:,3),'r')
title(var3,'fontsize',15)
saveas(gcf,pn3)

figure(4)
plot(15*(1:24),aa4)
hold on;
plot(15*(1:24),bb(:,4),'r')
title(var4,'fontsize',15)
saveas(gcf,pn4)

figure(5)
plot(15*(1:24),aa5)
hold on;
plot(15*(1:24),bb(:,5),'r')
title(var5,'fontsize',15)
saveas(gcf,pn5)

figure(6)
plot(15*(1:24),aa6)
hold on;
plot(15*(1:24),bb(:,6),'r')
title(var6,'fontsize',15)
saveas(gcf,pn6)

figure(7)
plot(15*(1:24),aa7)
hold on;
plot(15*(1:24),bb(:,7),'r')
title(var7,'fontsize',15)
saveas(gcf,pn7)

figure(8)
plot(15*(1:24),aa8)
hold on;
plot(15*(1:24),bb(:,8),'r')
title(var8,'fontsize',15)
saveas(gcf,pn8)
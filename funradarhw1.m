clear all;
close all;
% Fun ATMO RADAR homework 1.5
h=[362; 899; 1219; 1829; 2439; 3923; 5487; 6402; 7621; 9944];
P=[962; 904; 871; 811; 755; 630; 516; 458; 389; 281;];
T=[18.4; 21.2; 19.6; 17.5; 12.3; 0.0; -9.4; -14.7; -22.0; -39.9;];
Pw=[16.7; 11.6; 10.0; 7.4; 6.2; 5.5; 2.7; 1.7; 0.8; 0.1;];
numh=numel(h);
N=zeros(numh,1);
Nref=zeros(numh,1);
for i=1:numh
    N(i)=(77.6/(T(i)+273))*(P(i)+4810*Pw(i)/(T(i)+273));
end

for i=1:numh
    Nref(i)=313*exp(-0.1439*h(i)/1000);
end


% N=(77.6./T)*(P+4810.*Pw./T);

plot(N,h,'b','linewidth',3)
hold on;
plot(Nref,h,'r','linewidth',3)
legend('N','Nref')
xlabel('N')
ylabel('height(m)')

N2=N.*10^-6+1;
Nref2=Nref.*10^-6+1;

dndh=(N2(3)-N2(1))/(h(3)-h(1));
refdndh=(Nref2(3)-Nref2(1))/(h(3)-h(1));

a=6371;
ae1=a/(1+a*dndh);
ae1ref=a/(1+a*refdndh);

ke1=ae1/a;
ke1ref=ae1ref/a;
rr=100000;

h1=((rr)^2+(ke1*a)^2+2*rr*ke1*sin(0))^0.5-ke1*a;
h2=((rr)^2+(ke1ref*a)^2+2*rr*ke1ref*sin(0))^0.5-ke1ref*a;




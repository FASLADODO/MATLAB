 T=273.9-273.15
% T=250:300;
numel(T);
% for i=1:numel(T)
es=.611*10^((7.5*T)/(237.3+T))
es2=5.9728*10^22*(2.71^(-6788.026/T))*T^(-5.0065);
% end
drsdp=-.622/(70*70)*es
R=287
P=70
Lv=2.26*10^6
Cp=1004

chunk=R/P*Lv/Cp*drsdp

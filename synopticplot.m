clear all;
close all;

generalFontSize = 14;

% -----------------------------------------------------------------------
% Part b) Plot the 1000mb isotherms
% -----------------------------------------------------------------------
% The given variables:
L = 4000; %km
a = 10/1000; %?C/km
T_hat = 10; % ?C

% The ranges of x and y we want to plot:
y_interval = L/200;
y = -L/4:y_interval:L/4;

x_interval = L/200;
x = -L/2:x_interval:L/2;

% Create a grid:
[xg yg] = meshgrid(x,y);

% The equation:
delT = -a*yg - T_hat*cos(2*pi*xg/L).*cos(2*pi*yg/L);

% Make the plot:
[C,h] = contour(xg,yg,delT);
set(h,'ShowText','on')
title('a) 1000mb Isotherms','fontsize',generalFontSize)
set(gca,'FontSize',generalFontSize) % just makes axes labels readable
grid on

% -----------------------------------------------------------------------
% Part c) Plot the 1000mb geopotential height
% -----------------------------------------------------------------------
% More given variables:
phi_0 = 1000; % m^2/s^2
lambda = L/8;

% The equation:
phi_at_p1000 = phi_0 * cos(2*pi/L*(xg+lambda)).*cos(2*pi*yg/L);

%Make the plot:
figure % make a new figure
[C2,h2] = contour(xg,yg,phi_at_p1000);
set(h2,'ShowText','on','LevelStep',250)
title('b) 1000mb Geopotential Height ','fontsize',generalFontSize)
set(gca,'FontSize',generalFontSize) % just makes axes labels readable
grid on

% -----------------------------------------------------------------------
% Part d) Plot the 500mb geopotential height
% -----------------------------------------------------------------------
% More given variables:
alpha = 0.721;
p = 500; % mb
R = 287; % J/(kg K)?

% The equation:
del_phi = phi_at_p1000 + R*(a*yg + T_hat*cos(2*pi*xg/L).*cos(2*pi*yg/L))*...
    (log(p/1000) + alpha/2*(log(p/1000))^2); %log() means natural log in matlab

%Make the plot:
figure % make a new figure
[C3,h3] = contour(xg,yg,del_phi);
set(h3,'ShowText','on','LevelStep',500)
title('c) 500mb Geopotential Height ','fontsize',generalFontSize)
set(gca,'FontSize',generalFontSize) % just makes axes labels readable
grid on

% -----------------------------------------------------------------------
% Part e) Plot the 300mb geopotential height
% -----------------------------------------------------------------------
% More given variables:
p = 300; % mb

% The equation: (we need to run this again for p=300 now)
del_phi = phi_at_p1000 + R*(a*yg + T_hat*cos(2*pi*xg/L).*cos(2*pi*yg/L))*...
    (log(p/1000) + alpha/2*(log(p/1000))^2); %log() means natural log in matlab

%Make the plot:
figure % make a new figure
[C4,h4] = contour(xg,yg,del_phi);
set(h4,'ShowText','on','LevelStep',500)
title('d) 300mb Geopotential Height','fontsize',generalFontSize)
set(gca,'FontSize',generalFontSize) % just makes axes labels readable
grid on
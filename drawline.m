lineLength = 10;
angle = 30;
x(1) = 50;
y(1) = 50;
x(2) = x(1) + lineLength * cosd(angle);
y(2) = y(1) + lineLength * sind(angle);
hold on; % Don't blow away the image.
plot(x, y, 'k.');
xlim([40 70]);
ylim([40 70]);
grid on;
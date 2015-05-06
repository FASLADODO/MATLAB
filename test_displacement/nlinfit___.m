x = [0 90 180 270]';
y = [201 173 118 146]';
% modelfun = @(b,x)(b(1)+ b(2).*x.^2.5+ b(3).*x.^3);
% opts = statset('nlinfit');
% beta0 = [0;0;0];
% beta = nlinfit(x,y,modelfun,beta0,opts);
% disp(beta);
%  b = beta;
% y1 = b(1)+ b(2).*x.^2.5 + b(3).*x.^3;
% disp(y1);

modelfun = @(b,x)(b(1)+ b(2).*x.^2.5+ b(3).*x.^3);
opts = statset('nlinfit');
beta0 = [0;0;0];
beta = nlinfit(x,y,modelfun,beta0,opts);
% % % disp(beta);
b = beta;
y1 = b(1)+ b(2).*x.^2.5 + b(3).*x.^3;
% disp(y1);

clear all;
close all;

%  a1 =  0.254829592;
%  a2 = -0.284496736;
%  a3 =  1.421413741;
%  a4 = -1.453152027;
%  a5 =  1.061405429;
%  a6  =  0.3275911;
% 
% 
% v=-4:0.5:4;
% vs=1;
% if (v<0) 
% vs=-1;
% x=vs.*v./sqrt(2.0);
% else
% x=v./sqrt(2.0);
% end
% t=1.0./(1.0+a6.*x);
% y= 1.0 - (((((a5.*t+a4).*t)+a3).*t+a2).*t+a1).*t.*exp(-1.*x.*x);
% cval=0.5.*(1.0+vs.*y);
% plot(v,cval)

%   int N=1000;
%   double a=0,b=x;
%   double s,h,sum=0.;
%   h=(b-a)/N;
%   sum = sum + exp(-a*a/2.) + 4.*exp(-(a+h)*(a+h)/2.);
%   sum = sum + exp(-b*b/2.);
%   for(int i=1;i<N/2;i++)
%   {
%     s = a + 2*i*h;
%     sum = sum + 2.*exp(-s*s/2.);
%     s = s + h;
%     sum = sum + 4.*exp(-s*s/2.);
%   }
%   sum = 0.5 + h*sum/3./sqrt(8.*atan(1.));
%   b=-2.7183:0.05:2.7183;
  b=-2.7183*2:0.05:2.7183*2;
  maxb=max(b(:));
  minb=min(b(:));
  sizesdif=abs(maxb-minb);
  mulsdif=(2*exp(1))/sizesdif;
  consdif=-1*exp(1)-mulsdif*minb;
  cval=(mulsdif.*b+consdif);
  
  N=1000;
  a=0;
  s=0;
  h=0;
  sum=0.;
  h=(b-a)./N;
  sum = sum + exp(-a.*a./2.) + 4.*exp(-(a+h).*(a+h)./2.);
  sum = sum + exp(-b.*b./2.);
  for i=1 : N/2
    s = a + 2.*i.*h;
    sum = sum + 2.*exp(-s.*s./2.);
    s = s + h;
    sum = sum + 4.*exp(-s.*s./2.);
  end
  sum = 0.5 + h.*sum./3./sqrt(8.*atan(1.));
  plot(cval,sum)


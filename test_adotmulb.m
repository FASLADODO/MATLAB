clear all;
close all;

a=zeros(5,5);
b=a;
a(2,2)=1;
a(3,3)=1;
b(2,2)=1;
b(2,3)=2;

'hit'
H=sum(a(:).*b(:)>0)
'misses'
M=sum(-1.*a(:)+b(:)<0)
'fa'
F=sum(a(:)+-1.*b(:)<0)
'cn'
[i j]=size(a);
N=i*j-(H+M+F)
% sum(a(:).*b(:))

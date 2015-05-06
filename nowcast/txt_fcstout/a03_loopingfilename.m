clear all;
close all;

A(1,1) = 'A';
A(1,2) = 'D';
A(1,3) = 'V';
A(2,1) = 'H';
A(2,2) = 'R';
A(2,3) = 'R';
A(3,1) = 'R';
A(3,2) = 'D';
A(3,3) = 'R';

B =  cellstr(A);
for j=1:3
for i=1:3
filename=[B{j} num2str(15*i,'%03i') '.dat']
end
end


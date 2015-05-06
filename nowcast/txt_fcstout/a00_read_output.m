clear all;
close all;
fid = fopen('score_ADVWSR88D.dat','r');
data1 = textscan(fid,'%f,');
aa=data1{1,1};
aa2=(reshape(aa,[8,8]))';
fclose(fid);
clear a;

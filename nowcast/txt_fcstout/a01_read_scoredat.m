clear all;
close all;
fo = fopen('../score_ADVWSR88D.csv','w');

for i=1:8

fid = fopen(['ADVWSR88D_' num2str(15*i,'%03i') '.dat']);
data1 = textscan(fid,'%s',33,'delimiter','="', 'headerLines', 8);
a=data1{1,1}
fclose(fid);
for ji=1:8
    fprintf(fo,'%f,',str2num(a{3*ji}));
end
fprintf(fo,'\n');
clear a;
end
fclose(fo)